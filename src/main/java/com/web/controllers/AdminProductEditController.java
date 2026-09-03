package com.web.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import com.web.entity.Category;
import com.web.entity.Product;
import com.web.services.CategoryService;
import com.web.services.CategoryServiceImpl;
import com.web.services.ProductService;
import com.web.services.ProductServiceImpl;
import com.web.utils.Constant;

@WebServlet(urlPatterns = {"/admin/product/edit"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class AdminProductEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = req.getParameter("id");
        Product product = productService.get(Integer.parseInt(id));
        List<Category> categories = categoryService.getAll();

        req.setAttribute(Constant.REQ_PRODUCT, product);
        req.setAttribute(Constant.REQ_LIST_CATE, categories);
        req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int productid = Integer.parseInt(req.getParameter("productid"));
        String productname = req.getParameter("productname");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));

        Category category = categoryService.get(categoryId);

        Product product = productService.get(productid);
        product.setProductname(productname);
        product.setDescription(description);
        product.setPrice(price);
        product.setCategory(category);

        // Xử lý upload ảnh mới (nếu có)
        try {
            Part part = req.getPart("image");
            String originalFileName = part.getSubmittedFileName();
            if (originalFileName != null && !originalFileName.isEmpty()) {
                // Xóa ảnh cũ
                String oldImage = product.getImage();
                if (oldImage != null && !oldImage.isEmpty()) {
                    File oldFile = new File(Constant.DIR + "/" + oldImage);
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }

                // Lưu ảnh mới
                int index = originalFileName.lastIndexOf(".");
                String ext = originalFileName.substring(index + 1);
                String fileName = System.currentTimeMillis() + "." + ext;

                File dir = new File(Constant.DIR);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                part.write(Constant.DIR + "/" + fileName);
                product.setImage(fileName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        productService.edit(product);
        resp.sendRedirect(req.getContextPath() + "/admin/products");
    }
}