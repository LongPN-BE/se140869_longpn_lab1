/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.orders;

import java.io.Serializable;

public class OrderDTO implements Serializable{

    private String orderID;
    private String fullname;
    private String phoneNumber;
    private String email;
    private String address;
    private String dateOrder;
    private float total;
    private String userID;

    public OrderDTO(String orderID, String fullname, String phoneNumber, String email, String address, String dateOrder, float total) {
        this.orderID = orderID;
        this.fullname = fullname;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.dateOrder = dateOrder;
        this.total = total;
    }
    
    

    public OrderDTO(String orderID, String fullname, String phoneNumber, String email, String address, String dateOrder, float total, String userID) {
        this.orderID = orderID;
        this.fullname = fullname;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.dateOrder = dateOrder;
        this.total = total;
        this.userID = userID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

}
