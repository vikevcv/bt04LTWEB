package com.web.controllers;

import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.web.entity.User;
import com.web.services.UserService;
import com.web.services.UserServiceImpl;
import com.web.utils.Constant;

@WebServlet(urlPatterns = {"/profile"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        User account = (session != null) ? (User) session.getAttribute(Constant.SESSION_ACCOUNT) : null;

        if (account == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        User account = (session != null) ? (User) session.getAttribute(Constant.SESSION_ACCOUNT) : null;

        if (account == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");

        // Server-side validation
        if (fullname == null || fullname.trim().isEmpty()) {
            req.setAttribute(Constant.SESSION_MESS, "Họ tên không được để trống!");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }
        if (fullname.trim().length() < 2) {
            req.setAttribute(Constant.SESSION_MESS, "Họ tên phải có ít nhất 2 ký tự!");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }
        if (phone == null || phone.trim().isEmpty()) {
            req.setAttribute(Constant.SESSION_MESS, "Số điện thoại không được để trống!");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }
        if (!phone.matches("[0-9]{10,11}")) {
            req.setAttribute(Constant.SESSION_MESS, "Số điện thoại phải có 10-11 chữ số!");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }

        account.setFullname(fullname.trim());
        account.setPhone(phone.trim());

        // Xử lý upload ảnh
        try {
            Part part = req.getPart("images");
            String originalFileName = part.getSubmittedFileName();
            if (originalFileName != null && !originalFileName.isEmpty()) {
                // Xóa ảnh cũ
                String oldImage = account.getImages();
                if (oldImage != null && !oldImage.isEmpty()) {
                    File oldFile = new File(Constant.DIR + "/" + oldImage);
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }

                // Lưu ảnh mới
                int index = originalFileName.lastIndexOf(".");
                String ext = (index > 0) ? originalFileName.substring(index + 1) : "png";
                String fileName = System.currentTimeMillis() + "." + ext;

                File dir = new File(Constant.DIR);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                part.write(Constant.DIR + "/" + fileName);
                account.setImages(fileName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        userService.updateStatus(account);
        session.setAttribute(Constant.SESSION_ACCOUNT, account);
        resp.sendRedirect(req.getContextPath() + "/profile");
    }
}
