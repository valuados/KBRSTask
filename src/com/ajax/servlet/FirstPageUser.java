package com.ajax.servlet;

import com.ajax.utils.Details;
import com.ajax.utils.connectionGiver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
 * Created by valua on 10/3/2016.
 */
@WebServlet(name = "Servlet")
public class FirstPageUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String,Object> map;
        System.out.println("IM HERE YOU GEt DAtA NOW");
        map = (HashMap<String,Object>) request.getSession().getAttribute("user");

        ArrayList<Details> data=new ArrayList<>();
        Connection conn = connectionGiver.getInstance().getConnection();
        try {
            ResultSet rs = conn.createStatement().executeQuery("SELECT id, name, email, address from details");
            while(rs.next()){
                Details extra = new Details();
                extra.setId(rs.getInt(1));
                extra.setName(rs.getString(2));
                extra.setEmail(rs.getString(3));
                extra.setAddress(rs.getString(4));
                data.add(extra);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(data.size());
        request.setAttribute("dataToShow", data);
        request.getRequestDispatcher("logged_user.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
