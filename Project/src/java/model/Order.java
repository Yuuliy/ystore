/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author Dell
 */
public class Order {

    private int orderID;
    private double total;
    private Date createAt;
    private String status;
    private String deliveryAddress;
    private Account account;

    public Order() {
    }

    public Order(int orderID, double total, Date createAt, String status, String deliveryAddress, Account account) {
        this.orderID = orderID;
        this.total = total;
        this.createAt = createAt;
        this.status = status;
        this.deliveryAddress = deliveryAddress;
        this.account = account;
    }
    public String getPriceFormat(){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(getTotal());
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
    
    
    
}
