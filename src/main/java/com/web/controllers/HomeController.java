package com.web.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import com.web.entity.User;
import com.web.entity.Product;
import com.web.services.UserService;
import com.web.services.UserServiceImpl;
import com.web.services.ProductService;
import com.web.services.ProductServiceImpl;
import com.web.utils.Constant;

@WebServlet(urlPatterns = {"", "/home"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UserService userService = new UserServiceImpl();
    ProductService productService = new ProductServiceImpl();

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
                        }
                        break;
                    }
                }
            }
        }

        // Load 10 sản phẩm mới nhất
        List<Product> latestProducts = productService.getLatest(10);
        req.setAttribute(Constant.REQ_LATEST_PRODUCTS, latestProducts);

        req.getRequestDispatcher("/views/index.jsp").forward(req, resp);
    }
}