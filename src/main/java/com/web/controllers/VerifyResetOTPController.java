package com.web.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.web.services.*;
import com.web.utils.Constant;

@WebServlet(urlPatterns = {"/verify-reset-otp"})
public class VerifyResetOTPController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private OTPService otpService = new OTPServiceImpl();
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = (String) req.getSession().getAttribute(Constant.SESSION_RESET_EMAIL);
        if (email == null) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
            return;
        }

        // Hiển thị thông báo từ session
        String message = (String) req.getSession().getAttribute(Constant.SESSION_MESS);
        if (message != null) {
            req.setAttribute(Constant.SESSION_MESS, message);
            req.getSession().removeAttribute(Constant.SESSION_MESS);
        }

        req.setAttribute("email", email);
        req.getRequestDispatcher("/views/verify-reset-otp.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        String email = (String) req.getSession().getAttribute(Constant.SESSION_RESET_EMAIL);

        if (email == null) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
            return;
        }

        if ("resend".equals(action)) {
            // Chỉ gửi lại OTP nếu email tồn tại
            if (userService.checkExistEmail(email)) {
                otpService.generateResetPasswordOTP(email);
            }
            // Luôn báo "đã gửi" dù email có thật hay không
            req.getSession().setAttribute(Constant.SESSION_MESS,
                "Mã OTP mới đã được gửi về email.");
            resp.sendRedirect(req.getContextPath() + "/verify-reset-otp");
            return;
        }

        // Verify OTP
        String otpCode = req.getParameter("otpCode");
        boolean verified = otpService.verifyOTP(email, otpCode);

        if (verified) {
            req.getSession().setAttribute(Constant.SESSION_RESET_OTP_VERIFIED, true);
            resp.sendRedirect(req.getContextPath() + "/reset-password");
        } else {
            req.setAttribute("email", email);
            req.setAttribute(Constant.SESSION_MESS, "Mã OTP không đúng hoặc đã hết hạn!");
            req.getRequestDispatcher("/views/verify-reset-otp.jsp").forward(req, resp);
        }
    }
}
