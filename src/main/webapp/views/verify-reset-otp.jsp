<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác thực OTP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        .countdown-text { text-align:center; color:#888; font-size:14px; margin-top:16px; }
        .countdown-text b { color:#0d6efd; }
        .btn-resend { display:inline-block; margin-top:12px; padding:10px 20px;
                      background:#6c757d; color:#fff; border:none; border-radius:8px;
                      font-size:14px; font-weight:600; cursor:pointer; width:100%; }
        .btn-resend:hover { background:#5a6268; }
        .btn-resend:disabled { background:#c0c0c0; cursor:not-allowed; }
        .otp-email-hint { text-align:center; color:#555; margin-bottom:20px; font-size:14px; }
        .otp-email-hint b { color:#0d6efd; }
    </style>
</head>
<body>
    <div class="auth-wrapper">
        <div class="auth-card">
            <h2>Xác thực OTP</h2>
            <p class="subtitle">Nhập mã OTP đã gửi về email</p>

            <c:if test="${not empty mess}">
                <c:choose>
                    <c:when test="${mess.contains('thành công') || mess.contains('đã được gửi')}">
                        <div class="alert alert-success">${mess}</div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-danger">${mess}</div>
                    </c:otherwise>
                </c:choose>
            </c:if>

            <p class="otp-email-hint">Mã OTP đã được gửi đến<br><b>${email}</b></p>

            <form action="${pageContext.request.contextPath}/verify-reset-otp" method="post">
                <input type="hidden" name="action" value="verify">
                <div class="form-group">
                    <input type="text" name="otpCode" class="otp-input"
                           placeholder="------" maxlength="6" required autocomplete="off" autofocus>
                </div>
                <button type="submit" class="btn btn-success">Xác nhận</button>
            </form>

            <div class="countdown-text" id="countdownBox">
                Gửi lại OTP sau <b id="countdown">60</b> giây
            </div>

            <form action="${pageContext.request.contextPath}/verify-reset-otp" method="post" id="resendForm">
                <input type="hidden" name="action" value="resend">
                <button type="submit" class="btn-resend" id="btnResend" disabled>Gửi lại OTP</button>
            </form>

            <p class="auth-footer" style="margin-top:20px;">
                <a href="${pageContext.request.contextPath}/forgot-password">Nhập lại email</a> |
                <a href="${pageContext.request.contextPath}/login">Quay lại đăng nhập</a>
            </p>
        </div>
    </div>

    <script>
        (function() {
            var seconds = 60;
            var countdownEl = document.getElementById('countdown');
            var countdownBox = document.getElementById('countdownBox');
            var btnResend = document.getElementById('btnResend');

            var timer = setInterval(function() {
                seconds--;
                countdownEl.textContent = seconds;
                if (seconds <= 0) {
                    clearInterval(timer);
                    countdownBox.style.display = 'none';
                    btnResend.disabled = false;
                }
            }, 1000);
        })();
    </script>
</body>
</html>
