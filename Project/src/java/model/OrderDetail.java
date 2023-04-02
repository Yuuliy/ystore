/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dell
 */
public class OrderDetail {
//    [orderID]
//      ,[productID]
//      ,[quantity]
//      ,[color]
//      ,[size]
//      ,[price]
        private int quantity;
        private String color;
        private String Size;
        private Product p;

    public OrderDetail() {
    }

    public OrderDetail(int quantity, String color, String Size, Product p) {
        this.quantity = quantity;
        this.color = color;
        this.Size = Size;
        this.p = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }
        
}
