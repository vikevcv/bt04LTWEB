<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>${product.productname}</title>
<style>
    .detail-wrapper { max-width:800px; margin:30px auto; padding:0 20px; }
    .detail-card { background:#fff; border-radius:12px; box-shadow:0 2px 12px rgba(0,0,0,0.07); overflow:hidden; }
    .detail-card img { width:100%; max-height:400px; object-fit:cover; }
    .detail-info { padding:24px; }
    .detail-info h1 { color:#2c3e50; margin-bottom:12px; font-size:24px; }
    .detail-info .price { color:#0d6efd; font-size:22px; font-weight:700; margin-bottom:12px; }
    .detail-info .category { color:#888; font-size:14px; margin-bottom:16px; }
    .detail-info .desc { color:#555; line-height:1.6; }
</style>

<div class="detail-wrapper">
    <div class="detail-card">
        <c:choose>
            <c:when test="${product.image.substring(0,5) == 'https'}">
                <img src="${product.image}" alt="${product.productname}">
            </c:when>
            <c:otherwise>
                <img src="${pageContext.request.contextPath}/image?fname=${product.image}" alt="${product.productname}">
            </c:otherwise>
        </c:choose>

        <div class="detail-info">
            <h1>${product.productname}</h1>
            <div class="price">${product.price} VNĐ</div>
            <div class="category">Danh mục: <b>${product.category.categoryname}</b></div>
            <div class="desc">${product.description}</div>
        </div>
    </div>

    <div style="margin-top:20px; text-align:center;">
        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline" style="width:auto; padding:10px 28px; text-decoration:none; text-align:center;">
            Quay lại danh sách
        </a>
        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary" style="width:auto; padding:10px 28px; text-decoration:none; text-align:center; margin-left:8px;">
            Trang chủ
        </a>
    </div>
</div>
