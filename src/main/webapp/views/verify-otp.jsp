<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác thực OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .otp-input { letter-spacing: 12px; text-align: center; font-size: 24px; font-weight: bold; }
    </style>
</head>
<body>
    <div class="d-flex justify-content-center align-items-center" style="min-height:100vh;">
        <div class="card shadow-sm" style="width:400px;">
            <div class="card-body p-4">
                <h2 class="card-title text-center mb-2">Xác thực OTP</h2>
                <p class="text-center text-muted mb-4">Nhập mã xác thực để kích hoạt tài khoản</p>

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

                <p class="text-center text-muted mb-4">Mã OTP đã được gửi đến<br><b>${email}</b></p>

                <form action="${pageContext.request.contextPath}/verify-otp" method="post">
                    <div class="mb-3">
                        <input type="text" name="otpCode" class="form-control otp-input"
                               placeholder="------" maxlength="6" pattern="[0-9]{6}" required autocomplete="off" autofocus>
                    </div>

                    <button type="submit" class="btn btn-success w-100">Xác nhận</button>
                </form>

                <p class="text-center mt-3 small">
                    <a href="${pageContext.request.contextPath}/register">Đăng ký lại</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
