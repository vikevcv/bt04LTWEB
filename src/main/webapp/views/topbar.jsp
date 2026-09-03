<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="topbar">
    <div class="nav-left">
        <span class="brand">Shopping MVC</span>
        <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/product">Sản phẩm</a>
    </div>
    <div class="nav-right">
        <c:choose>
            <c:when test="${sessionScope.account == null}">
                <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
            </c:when>
            <c:otherwise>
                <span>Xin chào, <span class="user-name">${sessionScope.account.fullname}</span></span>
                <c:if test="${sessionScope.account.status == 0}">
                    <span class="badge badge-inactive" style="font-size:11px; vertical-align:middle;">Chưa xác thực</span>
                </c:if>
                <c:if test="${sessionScope.account.role == 1}">
                    <a href="${pageContext.request.contextPath}/admin">Admin</a>
                </c:if>
                <a href="${pageContext.request.contextPath}/profile">Hồ sơ</a>
                <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>