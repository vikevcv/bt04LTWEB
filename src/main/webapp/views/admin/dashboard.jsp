<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Quản trị hệ thống</title>
<style>
    .dashboard-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
        gap: 20px;
        margin-top: 20px;
    }
    .dash-card {
        background: #fff;
        border-radius: 12px;
        padding: 28px 24px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        text-align: center;
        transition: transform 0.2s, box-shadow 0.2s;
        text-decoration: none !important;
        display: block;
    }
    .dash-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 4px 16px rgba(0,0,0,0.12);
    }
    .dash-card .icon {
        font-size: 40px;
        margin-bottom: 12px;
    }
    .dash-card .count {
        font-size: 36px;
        font-weight: 700;
        color: #2c3e50;
        margin-bottom: 6px;
    }
    .dash-card .label {
        font-size: 15px;
        color: #888;
        font-weight: 500;
    }
    .dash-card.categories .count { color: #0d6efd; }
    .dash-card.products .count { color: #198754; }
</style>

<div class="content">
    <h2>Quản trị hệ thống</h2>
    <p style="color:#888; margin-bottom:8px;">Chào mừng bạn đến trang quản trị.</p>

    <div class="dashboard-grid">
        <a href="${pageContext.request.contextPath}/admin/categories" class="dash-card categories">
            <div class="icon">&#128193;</div>
            <div class="count">${categoryCount}</div>
            <div class="label">Danh mục</div>
        </a>

        <a href="${pageContext.request.contextPath}/admin/products" class="dash-card products">
            <div class="icon">&#128230;</div>
            <div class="count">${productCount}</div>
            <div class="label">Sản phẩm</div>
        </a>
    </div>
</div>
