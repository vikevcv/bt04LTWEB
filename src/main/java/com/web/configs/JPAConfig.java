package com.web.configs;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {
    public static EntityManager getEntityManager() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("dataSource");
        return factory.createEntityManager();
    }

//    public static void main(String[] args) {
//        try {
//            System.out.println("Đang kết nối Database và tạo bảng...");
//            EntityManager enma = getEntityManager();
//            
//            System.out.println("Kích hoạt thành công! Hãy mở MySQL kiểm tra xem đã có bảng chưa nhé.");
//            enma.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
}