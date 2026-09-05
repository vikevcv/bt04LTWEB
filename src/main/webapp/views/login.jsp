<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="d-flex justify-content-center align-items-center" style="min-height:100vh;">
        <div class="card shadow-sm" style="width:400px;">
            <div class="card-body p-4">
                <h2 class="card-title text-center mb-2">Đăng nhập</h2>
                <p class="text-center text-muted mb-4">Chào mừng bạn quay trở lại</p>

                <c:if test="${not empty mess}">
                    <div class="alert alert-danger">${mess}</div>
                </c:if>

                <form action="<c:url value='/login'/>" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Tên đăng nhập</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên đăng nhập" required autofocus>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="remember" name="remember">
                        <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                </form>

                <p class="text-center mt-3 small">
                    <a href="<c:url value='/forgot-password'/>">Quên mật khẩu?</a>
                </p>

                <p class="text-center mt-2 small">Chưa có tài khoản? <a href="<c:url value='/register'/>">Đăng ký ngay</a></p>
            </div>
        </div>
    </div>
</body>
</html>
