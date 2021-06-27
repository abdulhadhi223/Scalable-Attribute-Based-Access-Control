<%-- 
    Document   : AccessRequest
    Created on : Sep 20, 2020, 5:17:36 AM
    Author     : Lenovo
--%>

<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fid = request.getParameter("fid");
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
try {
  int i= st.executeUpdate("Update request set status='Rejected' where id='"+fid+"' ");
    if(i!=0) {
        response.sendRedirect("Access_request.jsp?rejected");
        
    }
       else{
       response.sendRedirect("Access_request.jsp?Failed");
       }
  
} catch(Exception ex) {
    ex.printStackTrace();
}
%>
