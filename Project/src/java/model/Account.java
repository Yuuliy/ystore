/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Dell
 */
public class Account {

    private int accountID;
    private String userName;
    private String password;
    private double money;
    private String email;
    private int ADMIN;
    private Date registerAt;
    private Profile info;

    public Account() {
    }

    public Account(int accountID, String userName, String password, double money, String email, int ADMIN, Date registerAt, Profile info) {
        this.accountID = accountID;
        this.userName = userName;
        this.password = password;
        this.money = money;
        this.email = email;
        this.ADMIN = ADMIN;
        this.registerAt = registerAt;
        this.info = info;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getADMIN() {
        return ADMIN;
    }

    public void setADMIN(int ADMIN) {
        this.ADMIN = ADMIN;
    }

    public Date getRegisterAt() {
        return registerAt;
    }

    public void setRegisterAt(Date registerAt) {
        this.registerAt = registerAt;
    }

    public Profile getInfo() {
        return info;
    }

    public void setInfo(Profile info) {
        this.info = info;
    }

    public String getFullName() {
        return info.getFirstName() + " " + info.getLastName();
    }

}
