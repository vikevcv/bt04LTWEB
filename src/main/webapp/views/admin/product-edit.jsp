<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Sửa sản phẩm</title>
<style>
    .form-group select { width:100%; padding:11px 14px; border:1.5px solid #ced4da; border-radius:8px; font-size:15px; background:#f8f9fa; }
    .form-group select:focus { outline:none; border-color:#0d6efd; box-shadow:0 0 0 3px rgba(13,110,253,0.15); background:#fff; }
    .current-image { margin:10px 0 16px; }
    .current-image img { border-radius:8px; border:1px solid #dee2e6; max-height:150px; }
    .btn-group { display:flex; gap:12px; margin-top:24px; }
</style>

<div class="content">
    <h2>Chỉnh sửa sản phẩm</h2>

    <div class="auth-card" style="max-width:600px; margin:0 auto;">
        <form action="${pageContext.request.contextPath}/admin/product/edit" method="post" enctype="multipart/form-data">
            <input type="hidden" name="productid" value="${product.productid}">

            <div class="form-group">
                <label for="productname">Tên sản phẩm</label>
                <input type="text" id="productname" name="productname" value="${product.productname}" required>
            </div>

            <div class="form-group">
                <label for="description">Mô tả</label>
                <input type="text" id="description" name="description" value="${product.description}">
            </div>

            <div class="form-group">
                <label for="price">Giá (VNĐ)</label>
                <input type="number" id="price" name="price" step="0.01" min="0" value="${product.price}" required>
            </div>

            <div class="form-group">
                <label for="categoryId">Danh mục</label>
                <select id="categoryId" name="categoryId" required>
                    <option value="">-- Chọn danh mục --</option>
                    <c:forEach items="${listcate}" var="cate">
                        <option value="${cate.categoryid}" ${cate.categoryid == product.category.categoryid ? 'selected' : ''}>${cate.categoryname}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label>Ảnh hiện tại</label>
                <div class="current-image">
                    <c:choose>
                        <c:when test="${product.image.substring(0,5) == 'https'}">
                            <img src="${product.image}" alt="Anh san pham"/>
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/image?fname=${product.image}" alt="Anh san pham"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="form-group">
                <label for="image">Upload ảnh mới (để trống nếu không đổi)</label>
                <input type="file" id="image" name="image">
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-primary" style="width:auto; padding:10px 28px;">Cập nhật</button>
                <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-outline" style="width:auto; padding:10px 28px; text-align:center;">Hủy bỏ</a>
            </div>
        </form>
    </div>
</div>
