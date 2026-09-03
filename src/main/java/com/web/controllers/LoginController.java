package com.web.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.web.entity.User;
import com.web.services.UserService;
import com.web.services.UserServiceImpl;
import com.web.utils.Constant;

@WebServlet(urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User account = (session != null) ? (User) session.getAttribute(Constant.SESSION_ACCOUNT) : null;

        if (account == null) {
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if (c.getName().equals(Constant.COOKIE_REMEMBER) && !c.getValue().isEmpty()) {
                        User user = userService.findByUsername(c.getValue());
                        if (user != null && user.getStatus() != 2) {
                            session = req.getSession();
                            session.setAttribute(Constant.SESSION_ACCOUNT, user);
                            account = user;
                        }
                        break;
                    }
                }
            }
        }

        if (account != null) {
            if (account.getRole() == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
            return;
        }

        HttpSession session2 = req.getSession();
        String sessionMess = (String) session2.getAttribute(Constant.SESSION_MESS);
        if (sessionMess != null) {
            req.setAttribute(Constant.SESSION_MESS, sessionMess);
            session2.removeAttribute(Constant.SESSION_MESS);
        }

        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        User account = userService.login(user, pass);

        if (account != null) {
            if (account.getStatus() == 2) {
                req.setAttribute(Constant.SESSION_MESS, "Tài khoản đã bị khóa! Vui lòng liên hệ quản trị viên.");
                req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
                return;
            }

            HttpSession session = req.getSession();
            session.setAttribute(Constant.SESSION_ACCOUNT, account);

            if (account.getStatus() == 0) {
                session.setAttribute(Constant.SESSION_WARN,
                    "Tài khoản chưa được xác thực email. Vui lòng xác thực để đầy đủ quyền lợi.");
            }

            String remember = req.getParameter("remember");
            if (remember != null) {
                Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, account.getUsername());
                cookie.setMaxAge(30 * 24 * 60 * 60);
                cookie.setPath(req.getContextPath());
                resp.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, "");
                cookie.setMaxAge(0);
                cookie.setPath(req.getContextPath());
                resp.addCookie(cookie);
            }

            if (account.getRole() == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
            req.setAttribute(Constant.SESSION_MESS, "Sai tên đăng nhập hoặc mật khẩu!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}
