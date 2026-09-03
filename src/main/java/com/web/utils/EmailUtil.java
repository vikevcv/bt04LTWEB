package com.web.utils;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailUtil {

    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final int SMTP_PORT = 587;
    private static final String SMTP_USER = ""; 
    private static final String SMTP_PASS = "";      

    public static void sendOTP(String toEmail, String otpCode) {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", String.valueOf(SMTP_PORT));
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USER, SMTP_PASS);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SMTP_USER));
            message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(toEmail));
            message.setSubject("Xác thực tài khoản - Mã OTP");

            String htmlContent = buildOtpEmailContent(otpCode);
            message.setContent(htmlContent, "text/html; charset=utf-8");

            Transport.send(message);
            System.out.println("OTP email sent to " + toEmail);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Không thể gửi email OTP: " + e.getMessage());
        }
    }

    private static String buildOtpEmailContent(String otpCode) {
        return "<html><body>"
             + "<h2>Xác thực tài khoản</h2>"
             + "<p>Mã OTP của bạn là:</p>"
             + "<h1 style='color:blue; letter-spacing:5px;'>" + otpCode + "</h1>"
             + "<p>Mã này có hiệu lực trong <b>5 phút</b>.</p>"
             + "<p>Nếu bạn không yêu cầu đăng ký, hãy bỏ qua email này.</p>"
             + "</body></html>";
    }

    public static void sendResetPasswordOTP(String toEmail, String otpCode) {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", String.valueOf(SMTP_PORT));
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USER, SMTP_PASS);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SMTP_USER));
            message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(toEmail));
            message.setSubject("Đặt lại mật khẩu - Mã OTP");

            String htmlContent = "<html><body>"
                + "<h2>Đặt lại mật khẩu</h2>"
                + "<p>Bạn đã yêu cầu đặt lại mật khẩu. Mã OTP của bạn là:</p>"
                + "<h1 style='color:blue; letter-spacing:5px;'>" + otpCode + "</h1>"
                + "<p>Mã này có hiệu lực trong <b>5 phút</b>.</p>"
                + "<p>Nếu bạn không yêu cầu đặt lại mật khẩu, hãy bỏ qua email này.</p>"
                + "</body></html>";
            message.setContent(htmlContent, "text/html; charset=utf-8");

            Transport.send(message);
            System.out.println("Reset password OTP sent to " + toEmail);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Không thể gửi email OTP: " + e.getMessage());
        }
    }
}