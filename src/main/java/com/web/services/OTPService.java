package com.web.services;

public interface OTPService {
    void generateOTP(String email);
    void generateResetPasswordOTP(String email);
    boolean verifyOTP(String email, String otpCode);
}