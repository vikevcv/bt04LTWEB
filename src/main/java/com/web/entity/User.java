package com.web.entity;

import java.io.Serializable;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name = "users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "UserId")
    private int id;

    @Column(name = "Username", columnDefinition = "varchar(50) not null unique")
    @NotEmpty(message = "Tên đăng nhập không được rỗng")
    private String username;

    @Column(name = "Password", columnDefinition = "varchar(255) not null")
    @NotEmpty(message = "Mật khẩu không được rỗng")
    private String password;

    @Column(name = "Email", columnDefinition = "varchar(100) unique")
    private String email;

    @Column(name = "FullName", columnDefinition = "nvarchar(100)")
    private String fullname;

    @Column(name = "Role")
    private int role; // Phân quyền: ví dụ 1 là Admin, 2 là User thường

    @Column(name = "Status")
    private int status; // 1: Hoạt động, 0: Khóa

    @Column(name = "Phone", columnDefinition = "varchar(20)")
    private String phone;

    @Column(name = "Images", columnDefinition = "nvarchar(500)")
    private String images;

    // 1. Constructor không tham số
    public User() {
    }

    // 2. Constructor đầy đủ tham số
    public User(int id, String username, String password, String email, String fullname, int role, int status, String phone, String images) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullname = fullname;
        this.role = role;
        this.status = status;
        this.phone = phone;
        this.images = images;
    }

    // 3. Getter và Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

}