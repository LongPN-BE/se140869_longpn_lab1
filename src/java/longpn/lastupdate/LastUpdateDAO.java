/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.lastupdate;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import longpn.utils.DBHelper;

public class LastUpdateDAO implements Serializable {

    

    public boolean insertLastUpdate(LastUpdateDTO lastUpdateDTO) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "insert into LastUpdate(username, action, lastDate) \n"
                        + "          values (? ,? ,getdate());";
                stm = conn.prepareStatement(sql);
                stm.setString(1, lastUpdateDTO.getUsername());
                stm.setString(2, lastUpdateDTO.getAction());
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

    public LastUpdateDTO getLastUpdateUser() throws SQLException, NamingException {
        LastUpdateDTO lastUpdate = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.getConnection();
            if (conn != null) {
                String sql = "SELECT username, action, lastDate \n"
                        + "FROM LastUpdate\n"
                        + "WHERE lastDate IN (\n"
                        + "  SELECT MAX(lastDate) \n"
                        + "  FROM lastUpdate\n"
                        + " );";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if(rs.next()){
                    String user = rs.getString("username");
                    String action = rs.getString("action");
                    String lastDate = rs.getString("lastDate");
                    lastUpdate = new LastUpdateDTO(user, action, lastDate);
                }
            }

        } finally {
            if(rs != null){
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return lastUpdate;
    }
}
