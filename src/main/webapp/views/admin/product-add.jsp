<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Thêm sản phẩm</title>

<div class="container py-4" style="max-width:600px;">
    <h2 class="mb-3">Thêm sản phẩm mới</h2>

    <div class="card shadow-sm">
        <div class="card-body p-4">
            <form action="${pageContext.request.contextPath}/admin/product/add" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="productname" class="form-label">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="productname" name="productname" placeholder="Nhập tên sản phẩm" required>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Mô tả</label>
                    <input type="text" class="form-control" id="description" name="description" placeholder="Nhập mô tả sản phẩm">
                </div>

                <div class="mb-3">
                    <label for="price" class="form-label">Giá (VNĐ)</label>
                    <input type="number" class="form-control" id="price" name="price" step="0.01" min="0" placeholder="Nhập giá sản phẩm" required>
                </div>

                <div class="mb-3">
                    <label for="categoryId" class="form-label">Danh mục</label>
                    <select class="form-select" id="categoryId" name="categoryId" required>
                        <option value="">-- Chọn danh mục --</option>
                        <c:forEach items="${listcate}" var="cate">
                            <option value="${cate.categoryid}">${cate.categoryname}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="image" class="form-label">Hình ảnh</label>
                    <input type="file" class="form-control" id="image" name="image">
                </div>

                <div class="d-flex gap-3 mt-4">
                    <button type="submit" class="btn btn-primary">Thêm mới</button>
                    <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-outline-secondary">Hủy bỏ</a>
                </div>
            </form>
        </div>
    </div>
</div>
