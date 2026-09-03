<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Danh sách sản phẩm</title>

<div class="content">
    <h2>Tất cả sản phẩm</h2>
    <p style="color:#888; margin-bottom:20px;">Tổng số: ${totalCount} sản phẩm</p>

    <div class="product-grid">
        <c:forEach items="${listProduct}" var="p">
            <div class="product-card">
                <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}">
                    <c:choose>
                        <c:when test="${p.image.substring(0,5) == 'https'}">
                            <img src="${p.image}" alt="${p.productname}">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/image?fname=${p.image}" alt="${p.productname}">
                        </c:otherwise>
                    </c:choose>
                    <h3>${p.productname}</h3>
                    <p class="product-price">${p.price} VNĐ</p>
                </a>
            </div>
        </c:forEach>
    </div>

    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/product?page=1">&laquo; Đầu</a>
            <a href="${pageContext.request.contextPath}/product?page=${currentPage - 1}">&lsaquo; Trước</a>
        </c:if>

        <c:forEach begin="1" end="${totalPages}" var="i">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <span class="page-active">${i}</span>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/product?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
            <a href="${pageContext.request.contextPath}/product?page=${currentPage + 1}">Sau &rsaquo;</a>
            <a href="${pageContext.request.contextPath}/product?page=${totalPages}">Cuối &raquo;</a>
        </c:if>
    </div>
</div>
