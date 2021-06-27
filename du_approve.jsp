<%-- 
    Document   : set_attribute
    Created on : Sep 29, 2020, 2:15:45 PM
    Author     : Lenovo
--%>

<%@page import="Networks.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    String role = request.getParameter("role");
    String mail = request.getParameter("email");

    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("update du_reg set status='Approved' , role='" + role + "' where id='" + id + "' ");
        System.out.println("test print==" + id);
        if (i != 0) {
            ResultSet rs = st.executeQuery(" SELECT * from du_reg where id = '" + id + "' ");
            if (rs.next()) {
                String msggg = "Data User Account has been Activated \nYour user role is " + role;
                Mail ma = new Mail();
                ma.secretMail(msggg, "Account_Activated", mail);
                String msg = "Account Activated:" + msggg;
                System.out.println("success");
                System.out.println("success");
                response.sendRedirect("du_req.jsp?Approved");
            } else {

                System.out.println("failed");
                response.sendRedirect("du_req.jsp?Failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
