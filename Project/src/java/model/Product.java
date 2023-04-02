/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author Dell
 */
public class Product {

    private int productID;
    private int categoryID;
    private int producerID;
    private String productName;
    private double price;
    private int quantity;
    private color color;
    private int insurance;/*tinh theo thang*/
    private size size;
    private img images;
    private Category categories;
    private Producer producer;

    public Product() {
    }

    public Product(int productID, int categoryID, int producerID, String productName, double price, int quantity, color color, int insurance, size size, img images, Category categories, Producer producer) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.producerID = producerID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.insurance = insurance;
        this.size = size;
        this.images = images;
        this.categories = categories;
        this.producer = producer;
    }

    

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getProducerID() {
        return producerID;
    }

    public void setProducerID(int producerID) {
        this.producerID = producerID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public color getColor() {
        return color;
    }

    public void setColor(color color) {
        this.color = color;
    }

    public int getInsurance() {
        return insurance;
    }

    public void setInsurance(int insurance) {
        this.insurance = insurance;
    }

    public size getSize() {
        return size;
    }

    public void setSize(size size) {
        this.size = size;
    }

    public img getImages() {
        return images;
    }

    public void setImages(img images) {
        this.images = images;
    }

    public Category getCategories() {
        return categories;
    }

    public void setCategories(Category categories) {
        this.categories = categories;
    }

    public Producer getProducer() {
        return producer;
    }

    public void setProducer(Producer producer) {
        this.producer = producer;
    } 
    
    public String getPriceFormat(){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(price);
    }
}
