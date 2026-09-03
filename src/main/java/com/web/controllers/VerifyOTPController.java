package com.web.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.web.services.*;
import com.web.entity.User;
import com.web.utils.Constant;

@WebServlet(urlPatterns = {"/verify-otp"})
public class VerifyOTPController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String email = (String) req.getSession().getAttribute(Constant.SESSION_OTP_EMAIL);
        if (email == null) {
            resp.sendRedirect(req.getContextPath() + "/register");
            return;
        }

        String message = (String) req.getSession().getAttribute(Constant.SESSION_OTP_MESSAGE);
        if (message != null) {
            req.setAttribute(Constant.SESSION_MESS, message);
            req.getSession().removeAttribute(Constant.SESSION_OTP_MESSAGE);
        }

        req.setAttribute("email", email);
        req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String email = (String) req.getSession().getAttribute(Constant.SESSION_OTP_EMAIL);
        String otpCode = req.getParameter("otpCode");

        if (email == null) {
            resp.sendRedirect(req.getContextPath() + "/register");
            return;
        }

        OTPService otpService = new OTPServiceImpl();
        boolean verified = otpService.verifyOTP(email, otpCode);

        if (verified) {
            UserService userService = new UserServiceImpl();
            User user = userService.findByEmail(email);
            if (user != null) {
                user.setStatus(1);
                userService.updateStatus(user);
            }

            req.getSession().removeAttribute(Constant.SESSION_OTP_EMAIL);
            req.getSession().setAttribute(Constant.SESSION_MESS,
                "Kích hoạt tài khoản thành công! Vui lòng đăng nhập.");
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("email", email);
            req.setAttribute(Constant.SESSION_MESS, "Mã OTP không đúng hoặc đã hết hạn!");
            req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
        }
    }
}
