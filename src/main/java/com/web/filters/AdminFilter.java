package com.web.filters;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import com.web.entity.User;
import com.web.services.UserService;
import com.web.services.UserServiceImpl;
import com.web.utils.Constant;

@WebFilter(urlPatterns = {"/admin/*"})
public class AdminFilter implements Filter {

    private UserService userService = new UserServiceImpl();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        User account = (session != null) ? (User) session.getAttribute(Constant.SESSION_ACCOUNT) : null;

        // Nếu chưa có session → thử auto-login từ cookie
        if (account == null) {
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if (c.getName().equals(Constant.COOKIE_REMEMBER) && !c.getValue().isEmpty()) {
                        User user = userService.findByUsername(c.getValue());
                        if (user != null && user.getStatus() != 2 && user.getRole() == 1) {
                            session = req.getSession();
                            session.setAttribute(Constant.SESSION_ACCOUNT, user);
                            account = user;
                        }
                        break;
                    }
                }
            }
        }

        if (account == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if (account.getRole() != 1) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        chain.doFilter(request, response);
    }
}
