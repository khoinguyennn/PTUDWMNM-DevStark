<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    /**
     * Display a listing of orders
     */
    public function index(Request $request)
    {
        $query = Order::with(['user', 'orderItems.course', 'payment']);

        // Filter by status
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        // Filter by user
        if ($request->filled('user_id')) {
            $query->where('user_id', $request->user_id);
        }

        // Filter by date range
        if ($request->filled('start_date')) {
            $query->whereDate('created_at', '>=', $request->start_date);
        }

        if ($request->filled('end_date')) {
            $query->whereDate('created_at', '<=', $request->end_date);
        }

        // Search by order code or user name
        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('order_code', 'like', "%{$search}%")
                  ->orWhere('id', 'like', "%{$search}%")
                  ->orWhereHas('user', function($userQuery) use ($search) {
                      $userQuery->where('name', 'like', "%{$search}%")
                               ->orWhere('email', 'like', "%{$search}%");
                  });
            });
        }

        $orders = $query->latest()->paginate(15);

        // Get users for filter dropdown
        $users = User::where('role', 'student')->orderBy('name')->get();

        // Get status counts for statistics
        $stats = [
            'total' => Order::count(),
            'paid' => Order::whereIn('status', ['paid', 'completed'])->count(),
            'pending' => Order::where('status', 'pending')->count(),
            'cancelled' => Order::where('status', 'cancelled')->count(),
            'total_revenue' => Order::whereIn('status', ['paid', 'completed'])->sum('total_amount'),
        ];

        return view('admin.orders.index', compact('orders', 'users', 'stats'));
    }

    /**
     * Display the specified order
     */
    public function show(Order $order)
    {
        $order->load(['user', 'orderItems.course', 'payment']);
        
        return view('admin.orders.show', compact('order'));
    }

    /**
     * Update order status
     */
    public function updateStatus(Request $request, Order $order)
    {
        $request->validate([
            'status' => 'required|in:pending,paid,completed,cancelled'
        ]);

        $statusNames = [
            'pending' => 'Chờ thanh toán',
            'paid' => 'Đã thanh toán',
            'completed' => 'Hoàn thành',
            'cancelled' => 'Đã hủy'
        ];

        $oldStatus = $order->status;
        $newStatus = $request->status;
        
        try {
            DB::beginTransaction();

            // Check if status change requires enrollment action
            $wasSuccessful = in_array($oldStatus, ['paid', 'completed']);
            $isNowSuccessful = in_array($newStatus, ['paid', 'completed']);

            // Case 1: Changed from cancelled/pending to paid/completed - Add enrollments
            if (!$wasSuccessful && $isNowSuccessful) {
                $order->load('orderItems.course');
                foreach ($order->orderItems as $item) {
                    // Check if enrollment already exists
                    $exists = DB::table('course_enrollments')
                        ->where('user_id', $order->user_id)
                        ->where('course_id', $item->course_id)
                        ->exists();

                    if (!$exists) {
                        DB::table('course_enrollments')->insert([
                            'user_id' => $order->user_id,
                            'course_id' => $item->course_id,
                            'enrolled_at' => now(),
                            'created_at' => now()
                        ]);
                    }
                }
            }

            // Case 2: Changed from paid/completed to pending/cancelled - Remove enrollments
            if ($wasSuccessful && !$isNowSuccessful) {
                $order->load('orderItems.course');
                foreach ($order->orderItems as $item) {
                    // Delete user progress for this course
                    DB::table('user_progress')
                        ->whereIn('lesson_id', function($query) use ($item) {
                            $query->select('lessons.id')
                                  ->from('lessons')
                                  ->join('sections', 'lessons.section_id', '=', 'sections.id')
                                  ->where('sections.course_id', $item->course_id);
                        })
                        ->where('user_id', $order->user_id)
                        ->delete();

                    // Delete enrollment
                    DB::table('course_enrollments')
                        ->where('user_id', $order->user_id)
                        ->where('course_id', $item->course_id)
                        ->delete();
                }
            }

            // Update order status
            $order->update(['status' => $newStatus]);

            DB::commit();

            $oldStatusName = $statusNames[$oldStatus] ?? $oldStatus;
            $newStatusName = $statusNames[$newStatus] ?? $newStatus;

            return redirect()->back()
                ->with('swal_success', "Trạng thái đơn hàng đã được cập nhật từ {$oldStatusName} thành {$newStatusName}.");

        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()
                ->with('swal_error', 'Có lỗi xảy ra khi cập nhật trạng thái đơn hàng.');
        }
    }

    /**
     * Delete order (soft delete or hard delete based on business logic)
     */
    public function destroy(Order $order)
    {
        // Only allow deletion of cancelled orders
        if ($order->status !== 'cancelled') {
            return redirect()->back()
                ->with('swal_error', 'Chỉ có thể xóa đơn hàng đã bị hủy.');
        }

        $orderCode = $order->order_code ?? $order->id;
        
        // Delete related records first
        $order->orderItems()->delete();
        if ($order->payment) {
            $order->payment->delete();
        }
        
        $order->delete();

        return redirect()->route('admin.orders.index')
            ->with('swal_success', "Đơn hàng #{$orderCode} đã được xóa thành công.");
    }
}
