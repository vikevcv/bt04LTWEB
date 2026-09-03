<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Hồ sơ cá nhân</title>
<style>
    .profile-card { background:#fff; border-radius:12px; box-shadow:0 2px 12px rgba(0,0,0,0.07); padding:32px; max-width:600px; margin:0 auto; }
    .profile-card h2 { color:#2c3e50; margin-bottom:24px; font-size:22px; border-bottom:2px solid #0d6efd; padding-bottom:10px; }
    .profile-avatar { text-align:center; margin-bottom:24px; }
    .profile-avatar img { width:120px; height:120px; border-radius:50%; object-fit:cover; border:3px solid #dee2e6; }
    .profile-avatar .no-avatar { width:120px; height:120px; border-radius:50%; background:#e9ecef; display:inline-flex; align-items:center; justify-content:center; font-size:40px; color:#adb5bd; border:3px solid #dee2e6; }
    .profile-info { display:grid; grid-template-columns:1fr 1fr; gap:16px; margin-bottom:20px; }
    .profile-info .info-item { background:#f8f9fa; padding:12px 16px; border-radius:8px; }
    .profile-info .info-item .label { font-size:12px; color:#888; margin-bottom:4px; }
    .profile-info .info-item .value { font-size:15px; color:#2c3e50; font-weight:600; }
    .form-group select { width:100%; padding:11px 14px; border:1.5px solid #ced4da; border-radius:8px; font-size:15px; background:#f8f9fa; }
    .form-group select:focus { outline:none; border-color:#0d6efd; box-shadow:0 0 0 3px rgba(13,110,253,0.15); background:#fff; }
    .btn-group { display:flex; gap:12px; margin-top:24px; }
    .current-avatar { margin:10px 0 16px; text-align:center; }
    .current-avatar img { border-radius:50%; border:2px solid #dee2e6; }
</style>

<div class="content">
    <div class="profile-card">
        <h2>Hồ sơ cá nhân</h2>

        <c:if test="${not empty sessionScope.mess}">
            <div class="alert alert-success">${sessionScope.mess}</div>
            <c:remove var="mess" scope="session"/>
        </c:if>

        <div class="profile-avatar">
            <c:choose>
                <c:when test="${not empty sessionScope.account.images}">
                    <c:choose>
                        <c:when test="${sessionScope.account.images.substring(0,5) == 'https'}">
                            <img src="${sessionScope.account.images}" alt="Avatar"/>
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/image?fname=${sessionScope.account.images}" alt="Avatar"/>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <div class="no-avatar">&#128100;</div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="profile-info">
            <div class="info-item">
                <div class="label">Tên đăng nhập</div>
                <div class="value">${sessionScope.account.username}</div>
            </div>
            <div class="info-item">
                <div class="label">Email</div>
                <div class="value">${sessionScope.account.email}</div>
            </div>
            <div class="info-item">
                <div class="label">Vai trò</div>
                <div class="value">
                    <c:choose>
                        <c:when test="${sessionScope.account.role == 1}">Admin</c:when>
                        <c:otherwise>Người dùng</c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="info-item">
                <div class="label">Trạng thái</div>
                <div class="value">
                    <c:choose>
                        <c:when test="${sessionScope.account.status == 1}">
                            <span class="badge badge-active">Hoạt động</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-inactive">Chưa xác thực</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="fullname">Họ và tên</label>
                <input type="text" id="fullname" name="fullname" value="${sessionScope.account.fullname}" placeholder="Nhập họ và tên">
            </div>

            <div class="form-group">
                <label for="phone">Số điện thoại</label>
                <input type="tel" id="phone" name="phone" value="${sessionScope.account.phone}" placeholder="Nhập số điện thoại">
            </div>

            <div class="form-group">
                <label for="images">Ảnh đại diện</label>
                <input type="file" id="images" name="images" accept="image/*">
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-primary" style="width:auto; padding:10px 28px;">Cập nhật</button>
                <a href="${pageContext.request.contextPath}/home" class="btn btn-outline" style="width:auto; padding:10px 28px; text-align:center;">Hủy bỏ</a>
            </div>
        </form>
    </div>
</div>
