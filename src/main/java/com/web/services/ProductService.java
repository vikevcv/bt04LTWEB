package com.web.services;

import java.util.List;
import com.web.entity.Product;

public interface ProductService {
    void insert(Product product);
    void edit(Product product);
    void delete(int id);
    Product get(int id);
    List<Product> getAll();
    List<Product> getLatest(int limit);
    List<Product> getByPage(int page, int pageSize);
    int countAll();
    List<Product> search(String keyword);
    List<Product> getByCategoryId(int categoryId);
}