/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.orderdetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import longpn.utils.DBHelper;

public class OrderDetailDAO {

    public boolean saveOrderDetail(OrderDetailsDTO orderDetails) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "insert into Orderdetails(orderID, productID, quantity, price)\n"
                        + "                        values (?, ?, ?, ?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, orderDetails.getOrderID());
                stm.setInt(2, Integer.parseInt(orderDetails.getProductID()));
                stm.setInt(3, orderDetails.getQuantity());
                stm.setFloat(4, orderDetails.getPrice());
                check = stm.executeUpdate() > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<OrderDetailsDTO> getListOrderDetails(String orderID) throws SQLException, NamingException {
        List<OrderDetailsDTO> listDetailsDTO = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "select OrderDetails.orderID, OrderDetails.productID,"
                        + " OrderDetails.quantity, OrderDetails.price, Products.nameProduct\n"
                        + "from OrderDetails \n"
                        + "INNER JOIN Products on OrderDetails.productID = Products.productID\n"
                        + "Where orderID like ? ";

                stm = conn.prepareStatement(sql);
                stm.setString(1, orderID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    int quantity = rs.getInt("quantity");
                    float price = rs.getFloat("price");
                    String nameProduct = rs.getString("nameProduct");
                    OrderDetailsDTO orderDetails = new OrderDetailsDTO(orderID, productID, nameProduct, quantity, price);
                    listDetailsDTO.add(orderDetails);
                    
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return listDetailsDTO;
    }
}
