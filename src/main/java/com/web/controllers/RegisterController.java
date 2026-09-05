package com.web.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.web.services.UserService;
import com.web.services.UserServiceImpl;
import com.web.services.OTPService;
import com.web.services.OTPServiceImpl;
import com.web.utils.Constant;

@WebServlet(urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");

        // Server-side validation
        if (username == null || username.trim().isEmpty()) {
            req.setAttribute(Constant.SESSION_MESS, "Tên đăng nhập không được để trống!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }
        if (password == null || password.trim().isEmpty()) {
            req.setAttribute(Constant.SESSION_MESS, "Mật khẩu không được để trống!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }
        if (password.length() < 6) {
            req.setAttribute(Constant.SESSION_MESS, "Mật khẩu phải có ít nhất 6 ký tự!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }
        if (fullname == null || fullname.trim().isEmpty()) {
            req.setAttribute(Constant.SESSION_MESS, "Họ tên không được để trống!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }
        if (fullname.trim().length() < 2) {
            req.setAttribute(Constant.SESSION_MESS, "Họ tên phải có ít nhất 2 ký tự!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }
        if (email == null || email.trim().isEmpty()) {
            req.setAttribute(Constant.SESSION_MESS, "Email không được để trống!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            req.setAttribute(Constant.SESSION_MESS, "Email không đúng định dạng!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        if (userService.checkExistUsername(username)) {
            req.setAttribute(Constant.SESSION_MESS, "Tên đăng nhập đã tồn tại!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        if (userService.checkExistEmail(email)) {
            req.setAttribute(Constant.SESSION_MESS, "Email đã được sử dụng!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        boolean result = userService.register(username, password, email, fullname);

        if (result) {
            OTPService otpService = new OTPServiceImpl();
            try {
                otpService.generateOTP(email);
                req.getSession().setAttribute(Constant.SESSION_OTP_EMAIL, email);
                req.getSession().setAttribute(Constant.SESSION_OTP_MESSAGE,
                    "Đăng ký thành công! Vui lòng nhập mã OTP đã gửi về email để kích hoạt tài khoản.");
                resp.sendRedirect(req.getContextPath() + "/verify-otp");
            } catch (Exception e) {
                req.setAttribute(Constant.SESSION_MESS,
                    "Đăng ký thành công nhưng không gửi được email. Vui lòng thử lại.");
                req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute(Constant.SESSION_MESS, "Đăng ký thất bại!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }
    }
}
