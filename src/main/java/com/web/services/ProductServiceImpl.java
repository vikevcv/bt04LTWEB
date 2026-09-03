package com.web.services;

import java.util.List;
import com.web.dao.ProductDao;
import com.web.dao.ProductDaoImpl;
import com.web.entity.Product;

public class ProductServiceImpl implements ProductService {

    private ProductDao productDao = new ProductDaoImpl();

    @Override
    public void insert(Product product) {
        productDao.insert(product);
    }

    @Override
    public void edit(Product product) {
        productDao.edit(product);
    }

    @Override
    public void delete(int id) {
        productDao.delete(id);
    }

    @Override
    public Product get(int id) {
        return productDao.get(id);
    }

    @Override
    public List<Product> getAll() {
        return productDao.getAll();
    }

    @Override
    public List<Product> getLatest(int limit) {
        return productDao.getLatest(limit);
    }

    @Override
    public List<Product> getByPage(int page, int pageSize) {
        return productDao.getByPage(page, pageSize);
    }

    @Override
    public int countAll() {
        return productDao.countAll();
    }

    @Override
    public List<Product> search(String keyword) {
        return productDao.search(keyword);
    }

    @Override
    public List<Product> getByCategoryId(int categoryId) {
        return productDao.getByCategoryId(categoryId);
    }
}