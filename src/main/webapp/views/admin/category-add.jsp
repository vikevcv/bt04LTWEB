<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Thêm Category</title>

<div class="container py-4" style="max-width:600px;">
    <h2 class="mb-3">Thêm danh mục mới</h2>

    <div class="card shadow-sm">
        <div class="card-body p-4">
            <form action="<c:url value='/admin/category/add'/>" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="categoryname" class="form-label">Tên Category</label>
                    <input type="text" class="form-control" id="categoryname" name="categoryname" placeholder="Nhập tên danh mục" required>
                </div>

                <div class="mb-3">
                    <label for="images1" class="form-label">Upload file ảnh</label>
                    <input type="file" class="form-control" id="images1" name="images1">
                </div>

                <div class="mb-3">
                    <label class="form-label">Trạng thái</label>
                    <div class="d-flex gap-4 mt-1">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="ston" name="status" value="1" checked>
                            <label class="form-check-label" for="ston">Hoạt động</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="stoff" name="status" value="0">
                            <label class="form-check-label" for="stoff">Khóa</label>
                        </div>
                    </div>
                </div>

                <div class="d-flex gap-3 mt-4">
                    <button type="submit" class="btn btn-primary">Thêm mới</button>
                    <a href="<c:url value='/admin/categories'/>" class="btn btn-outline-secondary">Hủy bỏ</a>
                </div>
            </form>
        </div>
    </div>
</div>
