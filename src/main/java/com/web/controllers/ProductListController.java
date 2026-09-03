package com.web.controllers;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.web.entity.Product;
import com.web.services.ProductService;
import com.web.services.ProductServiceImpl;
import com.web.utils.Constant;

@WebServlet(urlPatterns = {"/product"})
public class ProductListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();
    private static final int PAGE_SIZE = 6;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String pageParam = req.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;

        int totalCount = productService.countAll();
        int totalPages = (int) Math.ceil((double) totalCount / PAGE_SIZE);

        List<Product> products = productService.getByPage(currentPage, PAGE_SIZE);

        req.setAttribute(Constant.REQ_PRODUCT_LIST, products);
        req.setAttribute(Constant.REQ_CURRENT_PAGE, currentPage);
        req.setAttribute(Constant.REQ_TOTAL_PAGES, totalPages);
        req.setAttribute(Constant.REQ_TOTAL_COUNT, totalCount);

        req.getRequestDispatcher("/views/product-list.jsp").forward(req, resp);
    }
}