/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.lastupdate;

import java.io.Serializable;


public class LastUpdateDTO implements Serializable{
    private String username;
    private String action;
    private String lastDate;

    public LastUpdateDTO(String username, String action, String lastDate) {
        this.username = username;
        this.action = action;
        this.lastDate = lastDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getLastDate() {
        return lastDate;
    }

    public void setLastDate(String lastDate) {
        this.lastDate = lastDate;
    }
    
}
