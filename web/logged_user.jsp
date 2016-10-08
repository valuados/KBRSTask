<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.ajax.utils.Details" %>
<%@ page import="com.ajax.utils.connectionGiver" %>
<%@include file="redirect_not_logged.jsp"%>
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
    User u;
    u = (User) request.getSession().getAttribute("user");
    ArrayList<Details> data=new ArrayList<Details>();
    Connection conn = connectionGiver.getInstance().getConnection();
    try {
        ResultSet rs = conn.createStatement().executeQuery("SELECT det.INVOICE_ID, " +
                "INVOICER_NAME, INVOICER_EMAIL" +
                ", INVOICER_ADDRESS, INVOICE_STATUS, INVOICE_TOTAL" +
                " from details det, invoice inv where det.INVOICE_ID=inv.INVOICE_ID AND det.INVOICER_EMAIL="+u.mail);
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
<h2>Your orders</h2>

    <ol>


            <%
                for(int i =0;i<data.size();i++) {
                    Details detail = data.get(i);
            %>
        <button class="accordion">
            <li>
                <%=detail.getName()%> with email:
                <%=detail.getEmail()%>and with address:
                <%=detail.getAddress()%>
            </li>
        </button>
        <div class="panel">
            <p>Invoice status: <%=detail.getStatus()%>, total price:
                <%=detail.getTotal()%>$.</p>
        </div>
                <%
                }
            %>

    </ol>

</p>
</body>
</html>
