@extends('layouts.app')

@section('title', 'Lịch sử đơn hàng')

@section('content')
<div class="container py-5 px-4">
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2><i class="fas fa-history me-2"></i>Lịch sử đơn hàng</h2>
                    @if($orders->total() > 0)
                        <p class="text-muted mb-0">Tổng cộng {{ $orders->total() }} đơn hàng</p>
                    @endif
                </div>
                <div class="d-flex gap-2">
                    @if($orders->total() > 10)
                        <form method="GET" action="{{ route('orders.history') }}" class="d-flex align-items-center">
                            <label class="form-label me-2 mb-0 small">Hiển thị:</label>
                            <select name="per_page" class="form-select form-select-sm" onchange="this.form.submit()" style="width: auto;">
                                <option value="10" {{ request('per_page') == 10 ? 'selected' : '' }}>10</option>
                                <option value="25" {{ request('per_page') == 25 ? 'selected' : '' }}>25</option>
                                <option value="50" {{ request('per_page') == 50 ? 'selected' : '' }}>50</option>
                            </select>
                        </form>
                    @endif
                    <!-- <a href="{{ route('profile.show') }}" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i>Quay lại hồ sơ
                    </a> -->
                </div>
            </div>

            <!-- Orders List -->
            <div class="card shadow-sm border-0">
                <div class="card-body p-0">
                    @if($orders->count() > 0)
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th class="px-4 py-3" style="font-size: 0.9rem; font-weight: 600; color: #495057;">
                                            <i class="fas fa-hashtag me-2 text-muted"></i>Mã đơn hàng
                                        </th>
                                        <th class="px-4 py-3" style="font-size: 0.9rem; font-weight: 600; color: #495057;">
                                            <i class="fas fa-book me-2 text-muted"></i>Khóa học
                                        </th>
                                        <th class="px-4 py-3" style="font-size: 0.9rem; font-weight: 600; color: #495057;">
                                            <i class="fas fa-money-bill-wave me-2 text-muted"></i>Tổng tiền
                                        </th>
                                        <th class="px-4 py-3" style="font-size: 0.9rem; font-weight: 600; color: #495057;">
                                            <i class="fas fa-info-circle me-2 text-muted"></i>Trạng thái
                                        </th>
                                        <th class="px-4 py-3" style="font-size: 0.9rem; font-weight: 600; color: #495057;">
                                            <i class="fas fa-calendar-alt me-2 text-muted"></i>Ngày mua
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($orders as $order)
                                    <tr class="order-row">
                                        <td class="px-4 py-3">
                                            <div class="d-flex align-items-center">
                                                <div class="order-id-badge">
                                                    <strong style="color: #2c3e50; font-size: 0.95rem;">#{{ $order->order_code ?? $order->id }}</strong>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3">
                                            @foreach($order->orderItems as $item)
                                                <div class="course-item mb-2">
                                                    <div class="d-flex align-items-start">
                                                        <i class="fas fa-graduation-cap text-primary me-2 mt-1" style="font-size: 0.9rem;"></i>
                                                        <span style="font-size: 0.9rem; color: #495057; line-height: 1.5;">
                                                            {{ $item->course->title ?? 'Khóa học không tồn tại' }}
                                                        </span>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </td>
                                        <td class="px-4 py-3">
                                            <div class="price-container">
                                                <strong class="text-primary" style="font-size: 1rem; font-weight: 600;">
                                                    {{ number_format($order->total_amount, 0, ',', '.') }} đ
                                                </strong>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3">
                                            @if($order->status == 'completed' || $order->status == 'paid')
                                                <span class="badge rounded-pill bg-success-custom px-3 py-2">
                                                    <i class="fas fa-check-circle me-1"></i>Thành công
                                                </span>
                                            @elseif($order->status == 'pending')
                                                <span class="badge rounded-pill bg-warning-custom px-3 py-2">
                                                    <i class="fas fa-clock me-1"></i>Chờ thanh toán
                                                </span>
                                            @else
                                                <span class="badge rounded-pill bg-danger-custom px-3 py-2">
                                                    <i class="fas fa-times-circle me-1"></i>Đã hủy
                                                </span>
                                            @endif
                                        </td>
                                        <td class="px-4 py-3">
                                            <div class="date-container">
                                                <div style="font-size: 0.9rem; color: #495057; font-weight: 500;">
                                                    {{ $order->created_at->format('d/m/Y') }}
                                                </div>
                                                <small class="text-muted" style="font-size: 0.8rem;">
                                                    <i class="far fa-clock me-1"></i>{{ $order->created_at->format('H:i') }}
                                                </small>
                                            </div>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->
                        @if($orders->hasPages())
                            <div class="pagination-wrapper">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="text-muted small">
                                        Hiển thị {{ $orders->firstItem() }} - {{ $orders->lastItem() }}
                                        trong tổng số {{ $orders->total() }} đơn hàng
                                    </div>
                                    <nav aria-label="Phân trang đơn hàng">
                                        {{ $orders->links('pagination::bootstrap-4') }}
                                    </nav>
                                </div>
                            </div>
                        @endif
                    @else
                        <div class="text-center py-5">
                            <i class="fas fa-shopping-cart fa-3x text-muted mb-3"></i>
                            <h4 class="text-muted">Chưa có đơn hàng nào</h4>
                            <p class="text-muted">Bạn chưa có đơn hàng nào. Hãy khám phá các khóa học của chúng tôi!</p>
                            <a href="{{ route('home') }}" class="btn btn-primary">
                                <i class="fas fa-search me-1"></i>Khám phá khóa học
                            </a>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('styles')
<style>
    /* Card styling */
    .card {
        border-radius: 12px;
        overflow: hidden;
        transition: box-shadow 0.3s ease;
    }

    .card.shadow-sm {
        box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
    }

    /* Table styling */
    .table {
        font-size: 0.9rem;
    }

    .table thead.table-light {
        background-color: #f8f9fa;
        border-bottom: 2px solid #dee2e6;
    }

    .table thead th {
        border-bottom: none;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        font-size: 0.85rem;
    }

    .table tbody tr {
        border-bottom: 1px solid #f1f1f1;
        transition: all 0.2s ease;
    }

    .table tbody tr:last-child {
        border-bottom: none;
    }

    .table-hover tbody tr.order-row:hover {
        background-color: #f8f9fa;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
    }

    /* Order ID badge */
    .order-id-badge {
        padding: 4px 0;
    }

    /* Course item styling */
    .course-item {
        line-height: 1.6;
    }

    .course-item:last-child {
        margin-bottom: 0 !important;
    }

    /* Price container */
    .price-container {
        display: inline-block;
        padding: 4px 8px;
        background: linear-gradient(135deg, #e3f2fd 0%, #f3e5f5 100%);
        border-radius: 8px;
    }

    /* Custom badge colors */
    .badge.rounded-pill {
        font-size: 0.8rem;
        font-weight: 500;
        padding: 0.5rem 1rem;
        letter-spacing: 0.3px;
    }

    .bg-success-custom {
        background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        color: white;
    }

    .bg-warning-custom {
        background: linear-gradient(135deg, #ffc107 0%, #fd7e14 100%);
        color: #000;
    }

    .bg-danger-custom {
        background: linear-gradient(135deg, #dc3545 0%, #e83e8c 100%);
        color: white;
    }

    /* Date container */
    .date-container {
        white-space: nowrap;
    }

    /* Pagination Styling */
    .pagination {
        margin-bottom: 0;
    }

    .page-link {
        color: #0BBAF4;
        border: 1px solid #dee2e6;
        padding: 8px 12px;
        margin: 0 2px;
        border-radius: 6px;
        transition: all 0.3s ease;
    }

    .page-link:hover {
        background-color: #0BBAF4;
        border-color: #0BBAF4;
        color: white;
        text-decoration: none;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(11, 186, 244, 0.3);
    }

    .page-item.active .page-link {
        background-color: #0BBAF4;
        border-color: #0BBAF4;
        color: white;
        box-shadow: 0 4px 8px rgba(11, 186, 244, 0.3);
    }

    .page-item.disabled .page-link {
        color: #6c757d;
        background-color: #fff;
        border-color: #dee2e6;
    }

    .pagination-wrapper {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 8px;
        margin-top: 20px;
    }

    /* Responsive table */
    @media (max-width: 768px) {
        .table {
            font-size: 0.85rem;
        }

        .table thead th,
        .table tbody td {
            padding: 0.5rem !important;
        }

        .badge.rounded-pill {
            font-size: 0.75rem;
            padding: 0.4rem 0.8rem;
        }
    }

    /* Empty state styling */
    .text-center.py-5 {
        padding: 4rem 2rem !important;
    }

    .text-center.py-5 i.fa-3x {
        opacity: 0.3;
    }
</style>
@endpush

@push('scripts')
<script>
    // Removed payOrder function since action column is no longer needed
</script>
@endpush
