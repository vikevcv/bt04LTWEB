<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác thực OTP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="auth-wrapper">
        <div class="auth-card">
            <h2>Xác thực OTP</h2>
            <p class="subtitle">Nhập mã xác thực để kích hoạt tài khoản</p>

            <c:if test="${not empty mess}">
                <c:choose>
                    <c:when test="${mess.contains('thành công') || mess.contains('thanh cong')}">
                        <div class="alert alert-success">${mess}</div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-danger">${mess}</div>
                    </c:otherwise>
                </c:choose>
            </c:if>

            <p class="otp-email">Mã OTP đã được gửi đến<br><b>${email}</b></p>

            <form action="${pageContext.request.contextPath}/verify-otp" method="post">
                <div class="form-group">
                    <input type="text" name="otpCode" class="otp-input"
                           placeholder="------" maxlength="6" required autocomplete="off" autofocus>
                </div>

                <button type="submit" class="btn btn-success">Xác nhận</button>
            </form>

            <p class="auth-footer">
                <a href="${pageContext.request.contextPath}/register">Đăng ký lại</a>
            </p>
        </div>
    </div>
</body>
</html>
