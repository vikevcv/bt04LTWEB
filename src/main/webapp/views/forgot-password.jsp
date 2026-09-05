<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="d-flex justify-content-center align-items-center" style="min-height:100vh;">
        <div class="card shadow-sm" style="width:400px;">
            <div class="card-body p-4">
                <h2 class="card-title text-center mb-2">Quên mật khẩu</h2>
                <p class="text-center text-muted mb-4">Nhập email để nhận mã OTP đặt lại mật khẩu</p>

                <c:if test="${not empty mess}">
                    <div class="alert alert-danger">${mess}</div>
                </c:if>

                <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Nhập địa chỉ email" required autofocus>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Gửi mã OTP</button>
                </form>

                <p class="text-center mt-3 small">
                    <a href="${pageContext.request.contextPath}/login">Quay lại đăng nhập</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
