package com.web.services;

import com.web.dao.UserDao;
import com.web.dao.UserDaoImpl;
import com.web.entity.User;

public class UserServiceImpl implements UserService {
    
    private UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        User user = userDao.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    @Override
    public boolean register(String username, String password, String email, String fullname) {
        if (userDao.checkExistUsername(username)) {
            return false; // Trùng tên đăng nhập
        }
        
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password); // Nên mã hóa trước khi lưu ở đây
        newUser.setEmail(email);
        newUser.setFullname(fullname);
        newUser.setRole(2); // Mặc định role = 2 (User thường)
        newUser.setStatus(0); // Mặc định status = 0 (Chưa kích hoạt)
        
        userDao.insert(newUser);
        return true;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }
    
    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public void updateStatus(User user) {
        userDao.update(user);
    }

    @Override
    public void updatePassword(String email, String newPassword) {
        User user = userDao.findByEmail(email);
        if (user != null) {
            user.setPassword(newPassword);
            userDao.update(user);
        }
    }
}