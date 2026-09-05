<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Hồ sơ cá nhân</title>

<div class="container py-4" style="max-width:600px;">
    <div class="card shadow-sm">
        <div class="card-body p-4">
            <h4 class="card-title text-center pb-3 mb-4 border-bottom border-primary">Hồ sơ cá nhân</h4>

            <c:if test="${not empty sessionScope.mess}">
                <div class="alert alert-success">${sessionScope.mess}</div>
                <c:remove var="mess" scope="session"/>
            </c:if>

            <div class="text-center mb-4">
                <c:choose>
                    <c:when test="${not empty sessionScope.account.images}">
                        <c:choose>
                            <c:when test="${sessionScope.account.images.substring(0,5) == 'https'}">
                                <img src="${sessionScope.account.images}" alt="Avatar" class="rounded-circle" style="width:120px; height:120px; object-fit:cover; border:3px solid #dee2e6;"/>
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/image?fname=${sessionScope.account.images}" alt="Avatar" class="rounded-circle" style="width:120px; height:120px; object-fit:cover; border:3px solid #dee2e6;"/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <div class="d-inline-flex align-items-center justify-content-center rounded-circle bg-light" style="width:120px; height:120px; font-size:40px; color:#adb5bd; border:3px solid #dee2e6;">&#128100;</div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-sm-6">
                    <div class="bg-light rounded p-3">
                        <small class="text-muted d-block mb-1">Tên đăng nhập</small>
                        <span class="fw-semibold">${sessionScope.account.username}</span>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="bg-light rounded p-3">
                        <small class="text-muted d-block mb-1">Email</small>
                        <span class="fw-semibold">${sessionScope.account.email}</span>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="bg-light rounded p-3">
                        <small class="text-muted d-block mb-1">Vai trò</small>
                        <span class="fw-semibold">
                            <c:choose>
                                <c:when test="${sessionScope.account.role == 1}">Admin</c:when>
                                <c:otherwise>Người dùng</c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="bg-light rounded p-3">
                        <small class="text-muted d-block mb-1">Trạng thái</small>
                        <span class="fw-semibold">
                            <c:choose>
                                <c:when test="${sessionScope.account.status == 1}">
                                    <span class="badge bg-success">Hoạt động</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-danger">Chưa xác thực</span>
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="fullname" class="form-label">Họ và tên</label>
                    <input type="text" class="form-control" id="fullname" name="fullname" value="${sessionScope.account.fullname}" placeholder="Nhập họ và tên" required minlength="2">
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="${sessionScope.account.phone}" placeholder="Nhập số điện thoại" required pattern="[0-9]{10,11}">
                </div>

                <div class="mb-3">
                    <label for="images" class="form-label">Ảnh đại diện</label>
                    <input type="file" class="form-control" id="images" name="images" accept="image/*">
                </div>

                <div class="d-flex gap-3 mt-4">
                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">Hủy bỏ</a>
                </div>
            </form>
        </div>
    </div>
</div>
