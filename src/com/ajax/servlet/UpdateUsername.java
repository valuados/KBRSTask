package com.ajax.servlet;

import com.ajax.utils.User;
import com.ajax.utils.connectionGiver;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by valua on 9/2/2016.
 */
public class UpdateUsername extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateUsername(){
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = connectionGiver.getInstance().getConnection();
        String sw;
        sw = (String) request.getParameter("id");
        ArrayList<Map<String,Object>> arr;
        Map<String,Object>map;
        String userName;
        String userPassword;

        switch(sw){
            case "user":

                userName=request.getParameter("username");
                arr=new ArrayList<>();
                try {
                    ResultSet rs = conn.createStatement().executeQuery("SELECT * from details");
                    while(rs.next()){
                        map=new HashMap<>();
                        map.put("name",rs.getString(2));
                        map.put("email",rs.getString(3));
                        map.put("address",rs.getString(4));

                        arr.add(map);

                        //rs.next();

                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
       /* Map<String,Object> mapp = new HashMap();
        boolean isValid = false;

        if(username != null && username.trim().length() !=0){
            isValid=true;
            mapp.put("username",username);
        }
        mapp.put("isValid", isValid);
        write(response,mapp);*/
                write(response,arr);

                break;
            case "log":

                userName = request.getParameter("login");
                userPassword = request.getParameter("pass");

                arr=new ArrayList<>();
                try {
                    ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM user WHERE user_name = '"+
                            userName+"' AND user_password = '"+ userPassword+ "';");
                    User u = null;
                    if(rs.next()){
                        u = new User(rs);
                        map= new HashMap<>();
                        map.put("userName", rs.getString(2));
                        map.put("userEmail", rs.getString(4));
                        map.put("userType", rs.getBoolean(5));
                        arr.add(map);

                    } else {
                        map= new HashMap<>();
                        arr.add(map);
                    }
                    request.getSession().setAttribute("user", u);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                write(response,arr);


                break;
        }

    }

    private void write(HttpServletResponse response, ArrayList<Map<String, Object>> arr) throws IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
        String json = gson.toJson(arr);
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
