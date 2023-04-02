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
public class Profile {
//        accountID INT UNIQUE NOT NULL,
//	firstName nvarchar(50) NULL,
//	lastName nvarchar(50) NULL,
//	avatar nvarchar(200) null,
//	country nvarchar(150) null,
//	address nvarchar(150) null,
//	birthday datetime null,
//	phone nvarchar(15) null,
//	gender bit null,
        private int accountID;
        private String firstName;
        private String  lastName;
        private String avatar;
        private String address;
        private String country;
        private Date birthDay;
        private String phone;
        private int gender;

    public Profile() {
    }

    public Profile(int accountID, String firstName, String lastName, String avatar, String address, String country, Date birthDay, String phone, int gender) {
        this.accountID = accountID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.avatar = avatar;
        this.address = address;
        this.country = country;
        this.birthDay = birthDay;
        this.phone = phone;
        this.gender = gender;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }
    
    public String getFullName() {
        return firstName + " " + lastName;
    }
        
}
