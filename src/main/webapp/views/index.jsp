<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Trang chủ</title>

<div class="content">
    <h2>Trang chủ</h2>
    <c:choose>
        <c:when test="${sessionScope.account != null}">
            <c:if test="${not empty sessionScope.warn}">
                <div class="alert alert-warning">${sessionScope.warn}</div>
            </c:if>
            <div class="alert alert-success">
                Xin chào <b>${sessionScope.account.fullname}</b>! Bạn đã đăng nhập thành công.
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-info">
                Vui lòng <a href="${pageContext.request.contextPath}/login">đăng nhập</a> để sử dụng hệ thống.
            </div>
        </c:otherwise>
    </c:choose>
    <h2 style="margin-top:30px;">Sản phẩm mới nhất</h2>
    <div class="product-grid">
        <c:forEach items="${latestProducts}" var="p">
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
    <div style="text-align:center; margin-top:20px;">
        <a href="${pageContext.request.contextPath}/product" class="btn btn-primary" style="width:auto; padding:10px 28px; text-decoration:none; text-align:center;">
            Xem tất cả sản phẩm
        </a>
    </div>
</div>
