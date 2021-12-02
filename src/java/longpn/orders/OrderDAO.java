package longpn.orders;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import longpn.utils.DBHelper;



public class OrderDAO implements Serializable {

    public boolean saveOrder(OrderDTO orderDTO) throws NamingException, SQLException {
        boolean check = false;
        Connection conn = DBHelper.getConnection();
        PreparedStatement stm = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "insert into orders(orderID, fullname, phone, email, address, dateOrder, total) \n"
                        + "values (?, ?,?,? ,?,getdate(),?);";
                stm = conn.prepareStatement(sql);
                stm.setString(1, orderDTO.getOrderID());
                stm.setString(2, orderDTO.getFullname());
                stm.setString(3, orderDTO.getPhoneNumber());
                stm.setString(4, orderDTO.getEmail());
                stm.setString(5, orderDTO.getAddress());
                stm.setFloat(6, orderDTO.getTotal());

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

    public boolean saveOrderForLogin(OrderDTO orderDTO) throws NamingException, SQLException {
        boolean check = false;
        Connection conn = DBHelper.getConnection();
        PreparedStatement stm = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "insert into orders(orderID, fullname, phone, email, address, dateOrder, total, userID) \n"
                        + "values (?, ?,?,? ,?,getdate(),?,?);";
                stm = conn.prepareStatement(sql);
                stm.setString(1, orderDTO.getOrderID());
                stm.setString(2, orderDTO.getFullname());
                stm.setString(3, orderDTO.getPhoneNumber());
                stm.setString(4, orderDTO.getEmail());
                stm.setString(5, orderDTO.getAddress());
                stm.setFloat(6, orderDTO.getTotal());
                stm.setString(7, orderDTO.getUserID());
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

    public int getOrderID(String userID) throws SQLException, NamingException {
        int orderID = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "select orderID "
                        + "from Orders "
                        + "where userID= ? and orderID =(select max(orderID) from Orders)";
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
        return orderID;
    }

    public boolean checkOrderIdIsExist(String orderID) throws SQLException, NamingException {

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "select orderID "
                        + "from Orders "
                        + "where orderID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, orderID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return true;
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
        return false;
    }

    public List<OrderDTO> getListOrder(String userID) throws SQLException, NamingException {
        List<OrderDTO> listOrder = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "Select orderID, fullname, phone, email, address, dateOrder,total \n"
                        + "from Orders \n"
                        + "Where userID like ?";

                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String dateOrder = rs.getString("dateOrder");
                    float total = rs.getFloat("total");
                    OrderDTO orderDTO = new OrderDTO(orderID, fullname, phone, email, address, dateOrder, total, userID);
                    listOrder.add(orderDTO);
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
        return listOrder;
    }

    public List<OrderDTO> getListOrderAdmin() throws SQLException, NamingException {
        List<OrderDTO> listOrderAdmin = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "Select orderID, fullname, phone, email, address,dateOrder,total\n"
                        + "from Orders";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String dateOrder = rs.getString("dateOrder");
                    float total = rs.getFloat("total");
                    OrderDTO orderDTO = new OrderDTO(orderID, fullname, phone, email, address, dateOrder, total);
                    listOrderAdmin.add(orderDTO);
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
        return listOrderAdmin;
    }
}
