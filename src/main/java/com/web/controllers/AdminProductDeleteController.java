package com.web.controllers;

import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.web.entity.Product;
import com.web.services.ProductService;
import com.web.services.ProductServiceImpl;
import com.web.utils.Constant;

@WebServlet(urlPatterns = {"/admin/product/delete"})
public class AdminProductDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null && !id.isEmpty()) {
            Product product = productService.get(Integer.parseInt(id));
            // Xóa ảnh khỏi disk
            if (product != null && product.getImage() != null && !product.getImage().isEmpty()) {
                File file = new File(Constant.DIR + "/" + product.getImage());
                if (file.exists()) {
                    file.delete();
                }
            }
            productService.delete(Integer.parseInt(id));
        }
        resp.sendRedirect(req.getContextPath() + "/admin/products");
    }
}