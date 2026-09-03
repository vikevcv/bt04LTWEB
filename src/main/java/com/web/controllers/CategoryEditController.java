package com.web.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

import com.web.entity.Category;
import com.web.services.CategoryService;
import com.web.services.CategoryServiceImpl;
import com.web.utils.Constant;

@WebServlet(urlPatterns = { "/admin/category/edit" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class CategoryEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Category category = cateService.get(Integer.parseInt(id));
        
        req.setAttribute(Constant.REQ_CATE, category);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/category-edit.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        Category category = new Category();
        category.setCategoryid(Integer.parseInt(req.getParameter("categoryid")));
        category.setCategoryname(req.getParameter("categoryname"));
        
        String statusParam = req.getParameter("status");
        if (statusParam != null) {
            category.setStatus(Integer.parseInt(statusParam));
        }

        try {
            Part part = req.getPart("images1");
            String originalFileName = part.getSubmittedFileName();

            if (originalFileName != null && !originalFileName.isEmpty()) {
                int index = originalFileName.lastIndexOf(".");
                String ext = originalFileName.substring(index + 1);
                String fileName = System.currentTimeMillis() + "." + ext;
                
                File dir = new File(Constant.DIR);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                part.write(Constant.DIR + "/" + fileName);
                category.setImages(fileName);
            } else {
                // Nếu người dùng không upload file mới, giữ nguyên link cũ (ẩn trong form hoặc không set)
                category.setImages(req.getParameter("images"));
            }

            cateService.edit(category);
            resp.sendRedirect(req.getContextPath() + "/admin/categories");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}