package com.web.controllers;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.web.entity.Category;
import com.web.entity.Product;
import com.web.services.CategoryService;
import com.web.services.CategoryServiceImpl;
import com.web.services.ProductService;
import com.web.services.ProductServiceImpl;

@WebServlet(urlPatterns = {"/admin"})
public class AdminDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService categoryService = new CategoryServiceImpl();
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int categoryCount = categoryService.getAll().size();
        int productCount = productService.countAll();

        req.setAttribute("categoryCount", categoryCount);
        req.setAttribute("productCount", productCount);

        req.getRequestDispatcher("/views/admin/dashboard.jsp").forward(req, resp);
    }
}
