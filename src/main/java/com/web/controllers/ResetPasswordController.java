package com.web.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.web.services.*;
import com.web.utils.Constant;

@WebServlet(urlPatterns = {"/reset-password"})
public class ResetPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        String email = (session != null) ? (String) session.getAttribute(Constant.SESSION_RESET_EMAIL) : null;
        Boolean otpVerified = (session != null) ? (Boolean) session.getAttribute(Constant.SESSION_RESET_OTP_VERIFIED) : null;

        // Chưa nhập email hoặc chưa verify OTP → redirect về bước trước
        if (email == null) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
            return;
        }
        if (otpVerified == null || !otpVerified) {
            resp.sendRedirect(req.getContextPath() + "/verify-reset-otp");
            return;
        }

        // Hiển thị thông báo từ session
        String message = (String) session.getAttribute(Constant.SESSION_MESS);
        if (message != null) {
            req.setAttribute(Constant.SESSION_MESS, message);
            session.removeAttribute(Constant.SESSION_MESS);
        }

        req.setAttribute("email", email);
        req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        String email = (session != null) ? (String) session.getAttribute(Constant.SESSION_RESET_EMAIL) : null;
        Boolean otpVerified = (session != null) ? (Boolean) session.getAttribute(Constant.SESSION_RESET_OTP_VERIFIED) : null;

        if (email == null || otpVerified == null || !otpVerified) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
            return;
        }

        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        if (newPassword == null || newPassword.trim().isEmpty()) {
            req.setAttribute("email", email);
            req.setAttribute(Constant.SESSION_MESS, "Vui lòng nhập mật khẩu mới!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }

        if (newPassword.length() < 6) {
            req.setAttribute("email", email);
            req.setAttribute(Constant.SESSION_MESS, "Mật khẩu phải có ít nhất 6 ký tự!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            req.setAttribute("email", email);
            req.setAttribute(Constant.SESSION_MESS, "Mật khẩu xác nhận không khớp!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }

        // Đặt lại mật khẩu thành công
        userService.updatePassword(email, newPassword);

        // Xóa session reset
        session.removeAttribute(Constant.SESSION_RESET_EMAIL);
        session.removeAttribute(Constant.SESSION_RESET_OTP_VERIFIED);

        // Khôi phục timeout mặc định nếu user đã đăng nhập
        if (session.getAttribute(Constant.SESSION_ACCOUNT) != null) {
            session.setMaxInactiveInterval(-1); // timeout mặc định (30 phút)
        }

        // Chuyển sang trang login với thông báo thành công
        session.setAttribute(Constant.SESSION_MESS,
            "Đặt lại mật khẩu thành công! Vui lòng đăng nhập.");
        resp.sendRedirect(req.getContextPath() + "/login");
    }
}
