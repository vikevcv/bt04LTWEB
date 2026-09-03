package com.web.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import com.web.utils.Constant; 

@WebServlet(urlPatterns = "/image") 
public class DownloadImageController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy tên file ảnh từ tham số URL trên trình duyệt
        String fileName = req.getParameter("fname");
        
        if (fileName != null && !fileName.isEmpty()) {
            File file = new File(Constant.DIR + "/" + fileName);
            
            if (file.exists()) {
                // Nhận diện tự động đuôi file là jpg, png hay gif để báo cho trình duyệt
                String contentType = getServletContext().getMimeType(file.getName());
                if (contentType == null) {
                    contentType = "application/octet-stream";
                }
                resp.setContentType(contentType);
                
                // Copy luồng dữ liệu từ ổ cứng đẩy thẳng ra Response để web hiển thị ảnh
                Files.copy(file.toPath(), resp.getOutputStream());
            } else {
                // Nếu file bị xóa hoặc không tìm thấy, trả về lỗi 404
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy file ảnh");
            }
        }
    }
}