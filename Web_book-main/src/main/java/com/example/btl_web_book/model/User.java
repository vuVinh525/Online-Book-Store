package com.example.btl_web_book.model;
public class User {
    private int id;
    private String userName;
    private String phoneNumber;
    private String address;
    private String email;
    private String passWord;
    private String role;
    public User(int id, String userName, String phoneNumber, String address, String email, String passWord,String role) {
        this.id = id;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.email = email;
        this.passWord = passWord;
        this.role = role;
    }
    public User(String userName, String phoneNumber, String address, String email, String passWord,String role) {
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.email = email;
        this.passWord = passWord;
        this.role = role;
    }
    public User(int id,String userName, String phoneNumber, String address, String email){
        this.id=id;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.email = email;
    }
    public User() {

    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassWord() {
        return passWord;
    }
    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
