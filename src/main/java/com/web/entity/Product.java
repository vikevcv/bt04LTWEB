package com.web.entity;

import java.io.Serializable;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name = "products")
@NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProductId")
    private int productid;

    @Column(name = "ProductName", columnDefinition = "nvarchar(200) not null")
    @NotEmpty(message = "Tên sản phẩm không được rỗng")
    private String productname;

    @Column(name = "Description", columnDefinition = "nvarchar(500)")
    private String description;

    @Column(name = "Image", columnDefinition = "nvarchar(500)")
    private String image;

    @Column(name = "Price")
    private double price;

    @ManyToOne
    @JoinColumn(name = "CategoryId")
    private Category category;

    public Product() {}

    public Product(int productid, String productname, String description, String image, double price, Category category) {
        this.productid = productid;
        this.productname = productname;
        this.description = description;
        this.image = image;
        this.price = price;
        this.category = category;
    }

    public int getProductid() { return productid; }
    public void setProductid(int productid) { this.productid = productid; }

    public String getProductname() { return productname; }
    public void setProductname(String productname) { this.productname = productname; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }
}