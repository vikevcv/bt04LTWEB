<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="auth-wrapper">
        <div class="auth-card">
            <h2>Đặt lại mật khẩu</h2>
            <p class="subtitle">Nhập mật khẩu mới cho tài khoản <b>${email}</b></p>

            <c:if test="${not empty mess}">
                <div class="alert alert-danger">${mess}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/reset-password" method="post">
                <div class="form-group">
                    <label for="newPassword">Mật khẩu mới</label>
                    <input type="password" id="newPassword" name="newPassword" placeholder="Nhập mật khẩu mới" required autofocus>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Xác nhận mật khẩu</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu mới" required>
                </div>

                <button type="submit" class="btn btn-success">Đặt lại mật khẩu</button>
            </form>

            <p class="auth-footer">
                <a href="${pageContext.request.contextPath}/login">Quay lại đăng nhập</a>
            </p>
        </div>
    </div>
</body>
</html>
