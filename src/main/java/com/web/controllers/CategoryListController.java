package com.web.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.web.entity.Category;
import com.web.services.CategoryService;
import com.web.services.CategoryServiceImpl;
import com.web.utils.Constant;

@WebServlet(urlPatterns = { "/admin/categories" }) // Đổi URL để khớp với các trang redirect
public class CategoryListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy danh sách category từ database[cite: 9]
        List<Category> list = cateService.getAll();
        
        // Đẩy dữ liệu lên request với tên "listcate" để khớp với ${listcate} trong file category-list.jsp
        req.setAttribute(Constant.REQ_LIST_CATE, list);
        
        // Chuyển tiếp (forward) sang trang JSP để render giao diện[cite: 9]
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/category-list.jsp");
        dispatcher.forward(req, resp);
    }
}