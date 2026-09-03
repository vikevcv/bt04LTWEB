<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Sửa Category</title>
<style>
    .current-image { margin: 10px 0 16px; }
    .current-image img { border-radius: 8px; border: 1px solid #dee2e6; }
    .radio-group { display: flex; gap: 20px; margin-top: 6px; }
    .radio-group label { font-weight: 400; display: inline-flex; align-items: center; gap: 6px; }
    .radio-group input[type="radio"] { width: auto; }
    .btn-group { display: flex; gap: 12px; margin-top: 24px; }
</style>

<div class="content">
    <h2>Chỉnh sửa danh mục</h2>

    <div class="auth-card" style="max-width:600px; margin:0 auto;">
        <form action="<c:url value='/admin/category/edit'/>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="categoryid" value="${cate.categoryid}">

            <div class="form-group">
                <label for="categoryname">Tên Category</label>
                <input type="text" id="categoryname" name="categoryname" value="${cate.categoryname}" required>
            </div>

            <div class="form-group">
                <label>Ảnh hiện tại</label>
                <div class="current-image">
                    <c:if test="${cate.images != null && cate.images.substring(0,5) == 'https'}">
                        <c:url value="${cate.images}" var="imgUrl"></c:url>
                    </c:if>
                    <c:if test="${cate.images != null && cate.images.substring(0,5) != 'https'}">
                        <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                    </c:if>
                    <img height="120" src="${imgUrl}" alt="Anh cu"/>
                </div>
            </div>

            <div class="form-group">
                <label for="images1">Upload file ảnh mới (để trống nếu không đổi)</label>
                <input type="file" id="images1" name="images1">
            </div>

            <div class="form-group">
                <label>Trạng thái</label>
                <div class="radio-group">
                    <label><input type="radio" id="ston" name="status" value="1" ${cate.status == 1 ? 'checked' : ''}> Hoạt động</label>
                    <label><input type="radio" id="stoff" name="status" value="0" ${cate.status != 1 ? 'checked' : ''}> Khóa</label>
                </div>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-primary" style="width:auto; padding:10px 28px;">Cập nhật</button>
                <a href="<c:url value='/admin/categories'/>" class="btn btn-outline" style="width:auto; padding:10px 28px; text-align:center;">Hủy bỏ</a>
            </div>
        </form>
    </div>
</div>
