<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Thêm Category</title>
<style>
    .form-group-inline { display: flex; gap: 24px; align-items: center; }
    .form-group-inline .form-group { flex: 1; }
    .radio-group { display: flex; gap: 20px; margin-top: 6px; }
    .radio-group label { font-weight: 400; display: inline-flex; align-items: center; gap: 6px; }
    .radio-group input[type="radio"] { width: auto; }
    .btn-group { display: flex; gap: 12px; margin-top: 24px; }
</style>

<div class="content">
    <h2>Thêm danh mục mới</h2>

    <div class="auth-card" style="max-width:600px; margin:0 auto;">
        <form action="<c:url value='/admin/category/add'/>" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="categoryname">Tên Category</label>
                <input type="text" id="categoryname" name="categoryname" placeholder="Nhập tên danh mục" required>
            </div>

            <div class="form-group">
                <label for="images1">Upload file ảnh</label>
                <input type="file" id="images1" name="images1">
            </div>

            <div class="form-group">
                <label>Trạng thái</label>
                <div class="radio-group">
                    <label><input type="radio" id="ston" name="status" value="1" checked> Hoạt động</label>
                    <label><input type="radio" id="stoff" name="status" value="0"> Khóa</label>
                </div>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-primary" style="width:auto; padding:10px 28px;">Thêm mới</button>
                <a href="<c:url value='/admin/categories'/>" class="btn btn-outline" style="width:auto; padding:10px 28px; text-align:center;">Hủy bỏ</a>
            </div>
        </form>
    </div>
</div>
