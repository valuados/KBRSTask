/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ajax.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectionGiver {
    
    private static connectionGiver instance = new connectionGiver();
    
    public connectionGiver() {
        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException ex) {
            System.err.println("couldn't find Driver. exiting");
            System.exit(1);
        }
    }
    
    public static connectionGiver getInstance() {
        return instance;
    }
    
    public Connection getConnection() {
        Connection cnt = null;
        try {
            cnt = DriverManager.getConnection("jdbc:sqlite:E:/My Programms/Summer 2016/Iba projects/Version 3/Ajax request/web/db/data1.db"
                    ,"root", "");
        } catch (SQLException ex) {
            System.err.println("couldn't create a connection. exiting" + ex);
            System.exit(1);
        }
        return cnt;
    }
    
}
