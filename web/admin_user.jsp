<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.ajax.utils.Details" %>
<%@ page import="com.ajax.utils.connectionGiver" %>
<%@include file="redirect_not_logged.jsp"%>
<%@include file="redirect_not_admin.jsp"%>
<%

    Connection conn = connectionGiver.getInstance().getConnection();
    String dltDetail = (String) request.getParameter("delete_detail_id");
    if(dltDetail != null) {
        conn.createStatement().executeUpdate("DELETE from details where invoice_id="+dltDetail);
        conn.createStatement().executeUpdate("DELETE from invoice where invoice_id="+dltDetail);
    }
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Ajax request</title>

    <script src="javascript/jquery-3.1.0.js"></script>
    <script type="text/javascript" src="javascript/accordion.js"></script>


    <link rel="stylesheet" href="css/accordion.css" type="text/css">

</head>
<body>
<%
    ArrayList<Details> data=new ArrayList<Details>();
    try {
        ResultSet rs = conn.createStatement().executeQuery("SELECT det.INVOICE_ID, " +
                "INVOICER_NAME, INVOICER_EMAIL" +
                ", INVOICER_ADDRESS, INVOICE_STATUS, INVOICE_TOTAL" +
                " from details det, invoice inv where det.INVOICE_ID=inv.INVOICE_ID");
        while(rs.next()){
            Details extra = new Details();
            extra.setId(rs.getInt(1));
            extra.setName(rs.getString(2));
            extra.setEmail(rs.getString(3));
            extra.setAddress(rs.getString(4));
            extra.setStatus(rs.getString(5));
            extra.setTotal(rs.getDouble(6));
            data.add(extra);
        }
    } catch (Exception e) {
        System.out.println(e.toString());
        e.printStackTrace();
    }
%>
<p class="display-user-data">
<h2>Orders</h2>

<ol>


    <%
        for(int i =0;i<data.size();i++) {
            Details detail = data.get(i);
    %>
    <li>
    <table>
        <td>
            <tr>
                <button class="accordion">

        <%=detail.getName()%> with email:
        <%=detail.getEmail()%>and with address:
        <%=detail.getAddress()%>

                </button>
                <div class="panel">
                    <p>Invoice status: <%=detail.getStatus()%>, total price:
                        <%=detail.getTotal()%>$.</p>
                </div>
            </tr>
            <tr>
                <form method="POST"><button class="delete" name="delete_detail_id" value="<%=detail.getId()%>">DELETE</button></form>
            </tr>
        </td>
    </table>
    </li>

    <%
        }
    %>
</ol>
<a href="/users_for_admin.jsp">Proceed to Users Control Page</a>
</p>
</body>
</html>
