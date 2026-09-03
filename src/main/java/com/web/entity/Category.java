package com.web.entity;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name = "categories")
@NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c")
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CategoryId")
    private int categoryid;

    @Column(name = "CategoryName", columnDefinition = "nvarchar(50) not null")
    @NotEmpty(message = "Không được phép rỗng")
    private String categoryname;

    @Column(name = "Images", columnDefinition = "nvarchar(500) null")
    private String images;

    private int status;

    // bi-directional many-to-one association to Video
    @OneToMany(mappedBy = "category")
    private List<Video> videos;
    
    @OneToMany(mappedBy = "category")
    private List<Product> products;

    // 1. Constructor 
    public Category() {
    }

    // 2. Constructor có tham số
    public Category(int categoryid, String categoryname, String images, int status, List<Video> videos) {
        this.categoryid = categoryid;
        this.categoryname = categoryname;
        this.images = images;
        this.status = status;
        this.videos = videos;
    }

    // 3. Các hàm Getter và Setter
    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<Video> getVideos() {
        return videos;
    }

    public void setVideos(List<Video> videos) {
        this.videos = videos;
    }

    public Video addVideo(Video video) {
        getVideos().add(video);
        video.setCategory(this);
        return video;
    }

    public Video removeVideo(Video video) {
        getVideos().remove(video);
        video.setCategory(null);
        return video;
    }
    
    public List<Product> getProducts() { return products; }
    public void setProducts(List<Product> products) { this.products = products; }
    
//    @Override
//    public String toString() {
//        return "Category [categoryid=" + categoryid + ", categoryname=" + categoryname 
//                + ", images=" + images + ", status=" + status + "]";
//    }
//
//
//    public static void main(String[] args) {
//        // 1. Khởi tạo đối tượng Category
//        Category testCategory = new Category();
//        
//        // 2. Thêm dữ liệu test
//        testCategory.setCategoryid(1);
//        testCategory.setCategoryname("Thể thao");
//        testCategory.setImages("thethao.jpg");
//        testCategory.setStatus(1);
//        
//        // 3. In kết quả ra màn hình Console
//        System.out.println("=== TEST ENTITY CATEGORY ===");
//        System.out.println(testCategory.toString());
//    }
    
}

