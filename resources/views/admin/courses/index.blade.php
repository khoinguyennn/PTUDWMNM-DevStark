@extends('admin.layout')

@section('title', 'Quản lý Khóa học')
@section('page-title', 'Quản lý Khóa học')

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
            <span><i class="fas fa-book me-2"></i>Danh sách Khóa học</span>
            <a href="{{ route('admin.courses.create') }}" class="btn btn-primary">
                <i class="fas fa-plus me-1"></i> Thêm khóa học mới
            </a>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Thumbnail</th>
                            <th>Tên khóa học</th>
                            <th>Giảng viên</th>
                            <th>Giá</th>
                            <th>Chương</th>
                            <th>Bài học</th>
                            <th>Ngày tạo</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($courses as $course)
                        <tr>
                            <td>{{ $course->id }}</td>
                            <td>
                                @if($course->thumbnail)
                                    <img src="{{ asset('storage/' . $course->thumbnail) }}"
                                         alt="{{ $course->title }}"
                                         style="width: 60px; height: 40px; object-fit: cover; border-radius: 5px;">
                                @else
                                    <div style="width: 60px; height: 40px; background: #e9ecef; border-radius: 5px; display: flex; align-items: center; justify-content: center;">
                                        <i class="fas fa-image text-muted"></i>
                                    </div>
                                @endif
                            </td>
                            <td>
                                <strong>{{ $course->title }}</strong>
                            </td>
                            <td>{{ $course->instructor->name ?? 'N/A' }}</td>
                            <td>{{ number_format($course->price, 0, ',', '.') }} đ</td>
                            <td>
                                <span class="badge bg-info">{{ $course->sections->count() }}</span>
                            </td>
                            <td>
                                <span class="badge bg-success">{{ $course->total_lessons }}</span>
                            </td>
                            <td>{{ $course->created_at->format('d/m/Y') }}</td>
                            <td>
                                <div class="btn-group" role="group">
                                    <a href="{{ route('admin.courses.show', $course) }}"
                                       class="btn btn-sm btn-info"
                                       title="Xem chi tiết">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="{{ route('admin.courses.edit', $course) }}"
                                       class="btn btn-sm btn-warning"
                                       title="Chỉnh sửa">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <form action="{{ route('admin.courses.destroy', $course) }}"
                                          method="POST"
                                          class="delete-form"
                                          style="display: inline;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="button" class="btn btn-sm btn-danger delete-btn" 
                                                data-course-title="{{ $course->title }}"
                                                title="Xóa">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="9" class="text-center text-muted py-4">
                                <i class="fas fa-inbox fa-3x mb-3 d-block"></i>
                                Chưa có khóa học nào.
                                <a href="{{ route('admin.courses.create') }}">Tạo khóa học mới</a>
                            </td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            @if($courses->hasPages())
                <div class="d-flex justify-content-between align-items-center mt-4">
                    <div class="text-muted">
                        Hiển thị {{ $courses->firstItem() }} đến {{ $courses->lastItem() }} 
                        trong tổng số {{ $courses->total() }} kết quả
                    </div>
                    <nav aria-label="Phân trang khóa học">
                        <ul class="pagination pagination-sm mb-0">
                            {{-- Previous Page Link --}}
                            @if ($courses->onFirstPage())
                                <li class="page-item disabled"><span class="page-link">‹ Trước</span></li>
                            @else
                                <li class="page-item"><a class="page-link" href="{{ $courses->previousPageUrl() }}">‹ Trước</a></li>
                            @endif

                            {{-- Pagination Elements --}}
                            @php
                                $start = max($courses->currentPage() - 2, 1);
                                $end = min($start + 4, $courses->lastPage());
                                $start = max($end - 4, 1);
                            @endphp

                            @if($start > 1)
                                <li class="page-item"><a class="page-link" href="{{ $courses->url(1) }}">1</a></li>
                                @if($start > 2)
                                    <li class="page-item disabled"><span class="page-link">...</span></li>
                                @endif
                            @endif

                            @for ($i = $start; $i <= $end; $i++)
                                @if ($i == $courses->currentPage())
                                    <li class="page-item active"><span class="page-link">{{ $i }}</span></li>
                                @else
                                    <li class="page-item"><a class="page-link" href="{{ $courses->url($i) }}">{{ $i }}</a></li>
                                @endif
                            @endfor

                            @if($end < $courses->lastPage())
                                @if($end < $courses->lastPage() - 1)
                                    <li class="page-item disabled"><span class="page-link">...</span></li>
                                @endif
                                <li class="page-item"><a class="page-link" href="{{ $courses->url($courses->lastPage()) }}">{{ $courses->lastPage() }}</a></li>
                            @endif

                            {{-- Next Page Link --}}
                            @if ($courses->hasMorePages())
                                <li class="page-item"><a class="page-link" href="{{ $courses->nextPageUrl() }}">Tiếp ›</a></li>
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
                const courseTitle = this.getAttribute('data-course-title');
                const form = this.closest('.delete-form');
                
                Swal.fire({
                    title: 'Xác nhận xóa?',
                    html: `Bạn có chắc chắn muốn xóa khóa học<br><strong>"${courseTitle}"</strong>?`,
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
