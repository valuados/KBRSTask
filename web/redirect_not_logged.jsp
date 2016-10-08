<%@ page import="com.ajax.utils.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    {
        User u = (User) session.getAttribute("user");
        if (u == null) {
            response.sendRedirect("/");
            throw new javax.servlet.jsp.SkipPageException();
        }
    }
%>