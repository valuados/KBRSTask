package com.ajax.utils;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Andrey on 08.10.2016.
 */
public class User {
    public int id;
    public String name;
    public String password;
    public String mail;
    public int type;
    public User(){}
    public User(ResultSet rs) {
        try {
            this.id = rs.getInt(1);
            this.name = rs.getString(2);
            this.password = rs.getString(3);
            this.mail = rs.getString(4);
            this.type = rs.getInt(5);
        } catch(SQLException e ){}
    }
}
