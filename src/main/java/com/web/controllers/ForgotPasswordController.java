package com.web.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.web.services.*;
import com.web.utils.Constant;

@WebServlet(urlPatterns = {"/forgot-password"})
public class ForgotPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService = new UserServiceImpl();
    private OTPService otpService = new OTPServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");

        if (email == null || email.trim().isEmpty()) {
            req.setAttribute(Constant.SESSION_MESS, "Vui lòng nhập email!");
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
            return;
        }

        // Chỉ gửi OTP nếu email tồn tại, nhưng luôn set session
        if (userService.checkExistEmail(email)) {
            otpService.generateResetPasswordOTP(email);
        }

        // Luôn set email vào session dù tồn tại hay không
        req.getSession().setAttribute(Constant.SESSION_RESET_EMAIL, email);
        req.getSession().setMaxInactiveInterval(300); // 5 phút, khớp thời gian OTP

        req.getSession().setAttribute(Constant.SESSION_MESS,
            "Nếu tài khoản tồn tại, mã OTP đã được gửi về email. Vui lòng kiểm tra hộp thư.");
        resp.sendRedirect(req.getContextPath() + "/verify-reset-otp");
    }
}
