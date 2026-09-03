package com.web.dao;

import com.web.entity.EmailOTP;

public interface OTPDao {
    void insert(EmailOTP otp);
    void deleteByEmail(String email);
    EmailOTP findByEmail(String email);
}