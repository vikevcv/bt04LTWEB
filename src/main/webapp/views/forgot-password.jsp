<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="auth-wrapper">
        <div class="auth-card">
            <h2>Quên mật khẩu</h2>
            <p class="subtitle">Nhập email để nhận mã OTP đặt lại mật khẩu</p>

            <c:if test="${not empty mess}">
                <div class="alert alert-danger">${mess}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Nhập địa chỉ email" required autofocus>
                </div>

                <button type="submit" class="btn btn-primary">Gửi mã OTP</button>
            </form>

            <p class="auth-footer">
                <a href="${pageContext.request.contextPath}/login">Quay lại đăng nhập</a>
            </p>
        </div>
    </div>
</body>
</html>
