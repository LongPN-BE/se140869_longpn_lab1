/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.users;

import java.io.Serializable;

public class UserDTO implements Serializable{
    private String userID;
    private String fullname;
    private String password;
    private String phoneNo;
    private String email;
    private boolean isAdmin;
    private String address;

    public UserDTO(String userID, String fullname, String password, String phoneNo, String email, boolean isAdmin) {
        this.userID = userID;
        this.fullname = fullname;
        this.password = password;
        this.phoneNo = phoneNo;
        this.email = email;
        this.isAdmin = isAdmin;
    }

    public UserDTO(String userID, String fullname, String password, String phoneNo, String email, boolean isAdmin, String address) {
        this.userID = userID;
        this.fullname = fullname;
        this.password = password;
        this.phoneNo = phoneNo;
        this.email = email;
        this.isAdmin = isAdmin;
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
    
}
