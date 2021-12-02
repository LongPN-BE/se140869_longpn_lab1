/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import longpn.utils.DBHelper;

public class ProductDAO {

    public List<ProductDTO> getListProductForUser(String search, int indexPage) throws SQLException, NamingException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "select productID, imageProduct, nameProduct,description, price, quantity, createDate, expirationDate, categoryID, status "
                        + "from Products where nameProduct like ? and status = 'true' and quantity > 0"
                        + " order by price"
                        + " offset ? rows "
                        + " FETCH NEXT 20 rows only";

                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                stm.setInt(2, (indexPage - 1) * 20);
                //(page- 1) * số sản phẩm/1 trang
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String image = rs.getString("imageProduct");
                    String nameProduct = rs.getString("nameProduct");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String expirationDate = rs.getString("expirationDate");
                    int categoryID = rs.getInt("categoryID");
                    boolean status = rs.getBoolean("status");
                    list.add(new ProductDTO(productID, nameProduct, image, description, price, quantity, createDate, expirationDate, categoryID, status));
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
        return list;
    }

    public List<ProductDTO> getListProductForUserCategory(String category, int indexPage) throws SQLException, NamingException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "select productID, imageProduct, nameProduct,description, price, quantity, createDate, expirationDate, categoryID, status "
                        + "from Products where categoryID like ? and status = 'true' and quantity > 0"
                        + " order by price"
                        + " offset ? rows "
                        + " FETCH NEXT 20 rows only";

                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + category + "%");
                stm.setInt(2, (indexPage - 1) * 20);
                //(page- 1) * số sản phẩm/1 trang
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String image = rs.getString("imageProduct");
                    String nameProduct = rs.getString("nameProduct");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String expirationDate = rs.getString("expirationDate");
                    int categoryID = rs.getInt("categoryID");
                    boolean status = rs.getBoolean("status");
                    list.add(new ProductDTO(productID, nameProduct, image, description, price, quantity, createDate, expirationDate, categoryID, status));
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
        return list;
    }

    public List<ProductDTO> getListProductForAdmin(String search, int indexPage) throws SQLException, NamingException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "select productID, imageProduct, nameProduct,description, price, quantity, createDate, expirationDate, categoryID, status from Products where nameProduct like ?"
                        + " order by createDate"
                        + " offset ? rows "
                        + " FETCH NEXT 20 rows only";

                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                stm.setInt(2, (indexPage - 1) * 20);
                //(page- 1) * số sản phẩm/1 trang
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String image = rs.getString("imageProduct");
                    String nameProduct = rs.getString("nameProduct");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String expirationDate = rs.getString("expirationDate");
                    int categoryID = rs.getInt("categoryID");
                    boolean status = rs.getBoolean("status");
                    list.add(new ProductDTO(productID, nameProduct, image, description, price, quantity, createDate, expirationDate, categoryID, status));
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
        return list;
    }

    public boolean insertProduct(ProductDTO productDTO) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "insert into Products(imageProduct, nameProduct, description, price, quantity,createDate, expirationDate,categoryID,status)"
                        + "values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productDTO.getImage());
                stm.setString(2, productDTO.getNameProduct());
                stm.setString(3, productDTO.getDescription());
                stm.setFloat(4, productDTO.getPrice());
                stm.setInt(5, productDTO.getQuantity());
                stm.setString(6, productDTO.getCreateDate());
                stm.setString(7, productDTO.getExpirationDate());
                stm.setInt(8, productDTO.getCategoryID());
                stm.setBoolean(9, true);
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

    public boolean updateProduct(ProductDTO productDTO) throws NamingException, SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "update Products "
                        + "set nameProduct= ?, imageProduct = ?,description = ?, price = ?, quantity = ?, createDate = ? ,expirationDate = ?, categoryID = ?, status = ? "
                        + "where productID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productDTO.getNameProduct());
                stm.setString(2, productDTO.getImage());
                stm.setString(3, productDTO.getDescription());
                stm.setFloat(4, productDTO.getPrice());
                stm.setInt(5, productDTO.getQuantity());
                stm.setString(6, productDTO.getCreateDate());
                stm.setString(7, productDTO.getExpirationDate());
                stm.setInt(8, productDTO.getCategoryID());
                stm.setBoolean(9, productDTO.isStatus());
                stm.setString(10, productDTO.getProductID());
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

    public int getCountAllProduct() throws SQLException, NamingException {
        int count = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            String sql = "Select count(ProductID) as COUNT "
                    + "From Products";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("COUNT");
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
        return count;
    }
    
    public int getCountAllProductByCategory(String category) throws SQLException, NamingException {
        int count = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            String sql = "Select count(ProductID) as COUNT "
                    + " From Products "
                    + " where categoryID = ? ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, category);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("COUNT");
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
        return count;
    }

    public int getOldQuantity(String productID) throws SQLException, NamingException {
        int result = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "Select quantity From Products Where productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("quantity");
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean updateProductQuantity(String productID, int newQuantity) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "update Products set quantity = ? where productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, newQuantity);
                stm.setInt(2, Integer.parseInt(productID));
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
}
