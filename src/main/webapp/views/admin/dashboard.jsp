<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Quản trị hệ thống</title>

<div class="container py-4">
    <h2 class="mb-2">Quản trị hệ thống</h2>
    <p class="text-muted mb-4">Chào mừng bạn đến trang quản trị.</p>

    <div class="row row-cols-1 row-cols-md-2 g-4">
        <div class="col">
            <a href="${pageContext.request.contextPath}/admin/categories" class="text-decoration-none">
                <div class="card text-center shadow-sm h-100" style="transition:transform 0.2s, box-shadow 0.2s;">
                    <div class="card-body py-4">
                        <div class="display-4 mb-3">&#128193;</div>
                        <div class="display-5 fw-bold text-primary">${categoryCount}</div>
                        <div class="text-muted mt-2">Danh mục</div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col">
            <a href="${pageContext.request.contextPath}/admin/products" class="text-decoration-none">
                <div class="card text-center shadow-sm h-100" style="transition:transform 0.2s, box-shadow 0.2s;">
                    <div class="card-body py-4">
                        <div class="display-4 mb-3">&#128230;</div>
                        <div class="display-5 fw-bold text-success">${productCount}</div>
                        <div class="text-muted mt-2">Sản phẩm</div>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
