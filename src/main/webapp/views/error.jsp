<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lỗi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="d-flex justify-content-center align-items-center" style="min-height:100vh;">
        <div class="card shadow-sm" style="width:400px;">
            <div class="card-body p-4 text-center">
                <h2 class="card-title mb-2">Đã có lỗi xảy ra</h2>
                <p class="text-muted mb-4">Rất tiếc, trang bạn yêu cầu không tồn tại hoặc bạn không có quyền truy cập.</p>
                <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Quay lại trang chủ</a>
            </div>
        </div>
    </div>
</body>
</html>
