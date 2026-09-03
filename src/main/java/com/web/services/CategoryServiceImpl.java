package com.web.services;

import java.io.File;
import java.util.List;
import com.web.dao.CategoryDao;
import com.web.dao.CategoryDaoImpl;
import com.web.entity.Category;
import com.web.utils.Constant; 

public class CategoryServiceImpl implements CategoryService {
    
    private CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public void insert(Category category) {
        categoryDao.insert(category);
    }

    @Override
    public void edit(Category newCategory) {
        Category oldCategory = categoryDao.get(newCategory.getCategoryid());
        
        // Cập nhật các trường
        oldCategory.setCategoryname(newCategory.getCategoryname());
        oldCategory.setStatus(newCategory.getStatus());
        
        // Xử lý cập nhật ảnh (images)
        if (newCategory.getImages() != null) {
            String fileName = oldCategory.getImages();
            if (fileName != null && !fileName.isEmpty() && !fileName.equals("avatar.png")) {
                File file = new File(Constant.DIR + "/" + fileName);
                if (file.exists()) {
                    file.delete();
                }
            }
            oldCategory.setImages(newCategory.getImages());
        }
        
        categoryDao.edit(oldCategory);
    }

    @Override
    public void delete(int id) {
        categoryDao.delete(id);
    }

    @Override
    public Category get(int id) {
        return categoryDao.get(id);
    }

    @Override
    public Category get(String name) {
        return categoryDao.get(name);
    }

    @Override
    public List<Category> getAll() {
        return categoryDao.getAll();
    }

    @Override
    public List<Category> search(String keyword) {
        return categoryDao.search(keyword);
    }
}