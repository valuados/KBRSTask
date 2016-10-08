<%@ page import="com.ajax.utils.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    {
        User u = (User) session.getAttribute("user");
        if (u == null || u.type == 0) {
            response.sendRedirect("/you_are_not_admin.jsp");
            throw new javax.servlet.jsp.SkipPageException();
        }
    }
%>