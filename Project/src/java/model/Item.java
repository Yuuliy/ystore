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
public class Item {
    private Product product;
    private double unitPrice;
    private int quantity;
    private String color;
    private String size;

    public Item() {
    }

    public Item(Product product, double unitPrice, int quantity, String color, String size) {
        this.product = product;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.color = color;
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

   

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getTotalFormat(){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(getTotalMoney());
    }
    
    public String getPriceFormat(){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(getUnitPrice());
    }
    
    public double getTotalMoney(){
        return ( unitPrice  * quantity )  ;
    }
}
