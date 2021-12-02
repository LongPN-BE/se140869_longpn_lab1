/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.users;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import longpn.utils.DBHelper;

public class UserDAO implements Serializable {

    public UserDTO checkLogin(String username, String password) throws NamingException, SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "select fullname, phoneNo, email, isAdmin, address "
                        + "from Users "
                        + "where userID =? and password =? ";
                pst = conn.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if(rs.next()){
                    String fullname=rs.getString("fullname");
                    Boolean isAdmin =rs.getBoolean("isAdmin");
                    String phoneNo = rs.getString("phoneNo");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    user =new UserDTO(username, fullname, "", phoneNo, email, isAdmin, address);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
}
