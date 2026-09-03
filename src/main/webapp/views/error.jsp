<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Lỗi</title>

<div class="auth-wrapper">
    <div class="auth-card">
        <h2>Đã có lỗi xảy ra</h2>
        <p class="subtitle">Rất tiếc, trang bạn yêu cầu không tồn tại hoặc bạn không có quyền truy cập.</p>

        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary" style="text-align:center; text-decoration:none; margin-top:10px;">
            Quay lại trang chủ
        </a>
    </div>
</div>
