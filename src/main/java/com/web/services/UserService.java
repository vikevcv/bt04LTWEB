package com.web.services;

import com.web.entity.User;

public interface UserService {
    User login(String username, String password);
    boolean register(String username, String password, String email, String fullname);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    User findByUsername(String username);
    User findByEmail(String email);
    void updateStatus(User user);
    void updatePassword(String email, String newPassword);
}