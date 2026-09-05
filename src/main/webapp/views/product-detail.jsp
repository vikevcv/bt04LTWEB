<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>${product.productname}</title>

<div class="container py-4" style="max-width:800px;">
    <div class="card shadow-sm">
        <c:choose>
            <c:when test="${product.image.substring(0,5) == 'https'}">
                <img src="${product.image}" class="card-img-top" alt="${product.productname}" style="max-height:400px; object-fit:cover;">
            </c:when>
            <c:otherwise>
                <img src="${pageContext.request.contextPath}/image?fname=${product.image}" class="card-img-top" alt="${product.productname}" style="max-height:400px; object-fit:cover;">
            </c:otherwise>
        </c:choose>

        <div class="card-body">
            <h3 class="card-title">${product.productname}</h3>
            <p class="fs-4 text-primary fw-bold">${product.price} VNĐ</p>
            <p class="text-muted small">Danh mục: <b>${product.category.categoryname}</b></p>
            <p class="text-secondary">${product.description}</p>
        </div>
    </div>

    <div class="text-center mt-3">
        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-secondary">Quay lại danh sách</a>
        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary ms-2">Trang chủ</a>
    </div>
</div>
