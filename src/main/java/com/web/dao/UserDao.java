package com.web.dao;

import com.web.entity.User;

public interface UserDao {
    void insert(User user);
    User findByUsername(String username);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    User findByEmail(String email);
    void update(User user);
}