<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.ajax.utils.Details" %>
<%@ page import="com.ajax.utils.connectionGiver" %>
<%@ page import="com.ajax.utils.User" %>
<%@include file="redirect_not_logged.jsp"%>
<%@include file="redirect_not_admin.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <title>Ajax request</title>

    <script src="javascript/jquery-3.1.0.js"></script>
    <script type="text/javascript" src="javascript/accordion.js"></script>


    <link rel="stylesheet" href="css/accordion.css" type="text/css">
    <style>

    </style>
</head>
<body>
<%
    Connection conn = connectionGiver.getInstance().getConnection();

    String id = (String) request.getParameter("new_admin_id");

    if(id != null) {
        conn.createStatement().executeUpdate("UPDATE user set USER_TYPE=1 WHERE USER_ID="+id);
    }

    id = (String) request.getParameter("remove_admin_id");

    if(id != null) {
        conn.createStatement().executeUpdate("UPDATE user set USER_TYPE=0 WHERE USER_ID="+id);
    }
    conn.close();
    conn = connectionGiver.getInstance().getConnection();
    ArrayList<User> data=new ArrayList<User>();
    try {
        ResultSet rs = conn.createStatement().executeQuery("SELECT * from user");
        while(rs.next()){
            data.add(new User(rs));
        }
        conn.close();
    } catch (Exception e) {
        System.out.println(e.toString());
        e.printStackTrace();
    }
    conn = connectionGiver.getInstance().getConnection();

%>
<p class="display-user-data">
<h2>Users</h2>
<ol>
    <%
        for(User u : data) {
    %>
    <li>
        <form method="POST">
            <div class="userInfo">

                Name: <%=u.name%>
                Email: <%=u.mail%>
                Type: <%=u.type==0?"Not admin":"Admin"%>
            </div>
            <%if(u.type == 0){%>
                <button class="make-admin-btn" type="submit" name="new_admin_id" value="<%=u.id%>">
                   Make <%=u.name%> Admin
                </button>
            <%}%>
            <%if(u.type == 1){%>
            <button class="make-admin-btn" type="submit" name="remove_admin_id" value="<%=u.id%>">
                Unmake <%=u.name%> Admin
            </button>
            <%}%>
        </form>
    </li>
    <%
        }
    %>
</ol>

</p>
</body>
</html>
