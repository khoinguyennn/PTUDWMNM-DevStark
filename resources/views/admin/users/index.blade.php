@extends('admin.layout')

@section('title', 'Quản lý Người dùng')
@section('page-title', 'Quản lý Người dùng')

@section('content')
    @if(session('swal_success'))
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            Swal.fire({
                icon: 'success',
                title: 'Thành công!',
                text: '{{ session('swal_success') }}',
                timer: 3000,
                showConfirmButton: true,
                confirmButtonColor: '#4e73df'
            });
        });
    </script>
    @endif

    @if(session('swal_error'))
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi!',
                text: '{{ session('swal_error') }}',
                showConfirmButton: true,
                confirmButtonColor: '#4e73df'
            });
        });
    </script>
    @endif

    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            <span><i class="fas fa-users me-2"></i>Danh sách Người dùng</span>
            <a href="{{ route('admin.users.create') }}" class="btn btn-primary">
                <i class="fas fa-plus me-1"></i> Thêm người dùng mới
            </a>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Email</th>
                            <th>Vai trò</th>
                            <th>Ngày tạo</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($users as $user)
                        <tr>
                            <td>{{ $user->id }}</td>
                            <td>{{ $user->name }}</td>
                            <td>{{ $user->email }}</td>
                            <td>
                                @if($user->role == 'admin')
                                    <span class="badge bg-danger">
                                        <i class="fas fa-user-shield"></i> Admin
                                    </span>
                                @elseif($user->role == 'instructor')
                                    <span class="badge bg-warning">
                                        <i class="fas fa-chalkboard-teacher"></i> Giảng viên
                                    </span>
                                @else
                                    <span class="badge bg-success">
                                        <i class="fas fa-user-graduate"></i> Học viên
                                    </span>
                                @endif
                            </td>
                            <td>{{ $user->created_at->format('d/m/Y') }}</td>
                            <td>
                                <div class="btn-group" role="group">
                                    <a href="{{ route('admin.users.edit', $user) }}"
                                       class="btn btn-sm btn-warning"
                                       title="Chỉnh sửa">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <form action="{{ route('admin.users.destroy', $user) }}"
                                          method="POST"
                                          class="delete-form"
                                          style="display: inline;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="button" class="btn btn-sm btn-danger delete-btn" 
                                                data-user-name="{{ $user->name }}"
                                                data-user-email="{{ $user->email }}"
                                                title="Xóa">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="text-center text-muted py-4">
                                <i class="fas fa-inbox fa-3x mb-3 d-block"></i>
                                Chưa có người dùng nào.
                                <a href="{{ route('admin.users.create') }}">Tạo người dùng mới</a>
                            </td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            @if($users->hasPages())
                <div class="d-flex justify-content-between align-items-center mt-4">
                    <div class="text-muted">
                        Hiển thị {{ $users->firstItem() }} đến {{ $users->lastItem() }} 
                        trong tổng số {{ $users->total() }} kết quả
                    </div>
                    <nav aria-label="Phân trang người dùng">
                        <ul class="pagination pagination-sm mb-0">
                            {{-- Previous Page Link --}}
                            @if ($users->onFirstPage())
                                <li class="page-item disabled"><span class="page-link">‹ Trước</span></li>
                            @else
                                <li class="page-item"><a class="page-link" href="{{ $users->previousPageUrl() }}">‹ Trước</a></li>
                            @endif

                            {{-- Pagination Elements --}}
                            @php
                                $start = max($users->currentPage() - 2, 1);
                                $end = min($start + 4, $users->lastPage());
                                $start = max($end - 4, 1);
                            @endphp

                            @if($start > 1)
                                <li class="page-item"><a class="page-link" href="{{ $users->url(1) }}">1</a></li>
                                @if($start > 2)
                                    <li class="page-item disabled"><span class="page-link">...</span></li>
                                @endif
                            @endif

                            @for ($i = $start; $i <= $end; $i++)
                                @if ($i == $users->currentPage())
                                    <li class="page-item active"><span class="page-link">{{ $i }}</span></li>
                                @else
                                    <li class="page-item"><a class="page-link" href="{{ $users->url($i) }}">{{ $i }}</a></li>
                                @endif
                            @endfor

                            @if($end < $users->lastPage())
                                @if($end < $users->lastPage() - 1)
                                    <li class="page-item disabled"><span class="page-link">...</span></li>
                                @endif
                                <li class="page-item"><a class="page-link" href="{{ $users->url($users->lastPage()) }}">{{ $users->lastPage() }}</a></li>
                            @endif

                            {{-- Next Page Link --}}
                            @if ($users->hasMorePages())
                                <li class="page-item"><a class="page-link" href="{{ $users->nextPageUrl() }}">Tiếp ›</a></li>
                            @else
                                <li class="page-item disabled"><span class="page-link">Tiếp ›</span></li>
                            @endif
                        </ul>
                    </nav>
                </div>
            @endif
        </div>
    </div>

    @push('scripts')
    <script>
        // SweetAlert confirmation for delete
        document.querySelectorAll('.delete-btn').forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                const userName = this.getAttribute('data-user-name');
                const userEmail = this.getAttribute('data-user-email');
                const form = this.closest('.delete-form');
                
                Swal.fire({
                    title: 'Xác nhận xóa?',
                    html: `Bạn có chắc chắn muốn xóa người dùng<br><strong>"${userName}"</strong><br><small class="text-muted">${userEmail}</small>?`,
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#6c757d',
                    confirmButtonText: '<i class="fas fa-trash me-2"></i>Xóa',
                    cancelButtonText: '<i class="fas fa-times me-2"></i>Hủy',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        form.submit();
                    }
                });
            });
        });
    </script>
    @endpush
@endsection
