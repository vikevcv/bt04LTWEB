<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="auth-wrapper">
        <div class="auth-card">
            <h2>Đăng nhập</h2>
            <p class="subtitle">Chào mừng bạn quay trở lại</p>

            <c:if test="${not empty mess}">
                <div class="alert alert-danger">${mess}</div>
            </c:if>

            <form action="<c:url value='/login'/>" method="post">
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required autofocus>
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
                </div>
                <div class="form-group" style="display:flex; align-items:center; gap:8px;">
                    <input type="checkbox" id="remember" name="remember" style="width:auto;">
                    <label for="remember" style="margin:0; font-weight:400;">Ghi nhớ đăng nhập</label>
                </div>

                <button type="submit" class="btn btn-primary">Đăng nhập</button>
            </form>

            <p class="auth-footer" style="margin-top:12px;">
                <a href="<c:url value='/forgot-password'/>">Quên mật khẩu?</a>
            </p>

            <p class="auth-footer">Chưa có tài khoản? <a href="<c:url value='/register'/>">Đăng ký ngay</a></p>
        </div>
    </div>
</body>
</html>
