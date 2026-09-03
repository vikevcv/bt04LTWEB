package com.web.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.web.services.CategoryService;
import com.web.services.CategoryServiceImpl;

@WebServlet(urlPatterns = { "/admin/category/delete" })
public class CategoryDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy tham số id từ URL[cite: 7]
        String id = req.getParameter("id");
        
        try {
            // Gọi Service để xóa[cite: 7]
            cateService.delete(Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Trở về trang danh sách bằng đường dẫn mới[cite: 7]
        resp.sendRedirect(req.getContextPath() + "/admin/categories");
    }
}