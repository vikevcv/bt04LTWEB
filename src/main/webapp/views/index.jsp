<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Trang chủ</title>

<div class="container py-4">
    <h2 class="mb-3">Trang chủ</h2>
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
                Vui lòng <a href="${pageContext.request.contextPath}/login" class="alert-link">đăng nhập</a> để sử dụng hệ thống.
            </div>
        </c:otherwise>
    </c:choose>

    <h3 class="mt-4 mb-3">Sản phẩm mới nhất</h3>
    <div class="row row-cols-2 row-cols-md-4 g-3">
        <c:forEach items="${latestProducts}" var="p">
            <div class="col">
                <div class="card h-100 shadow-sm">
                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}" class="text-decoration-none">
                        <c:choose>
                            <c:when test="${p.image.substring(0,5) == 'https'}">
                                <img src="${p.image}" class="card-img-top" alt="${p.productname}" style="height:180px; object-fit:cover;">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/image?fname=${p.image}" class="card-img-top" alt="${p.productname}" style="height:180px; object-fit:cover;">
                            </c:otherwise>
                        </c:choose>
                        <div class="card-body">
                            <h6 class="card-title text-truncate">${p.productname}</h6>
                            <p class="card-text text-primary fw-bold">${p.price} VNĐ</p>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/product" class="btn btn-primary">Xem tất cả sản phẩm</a>
    </div>
</div>
