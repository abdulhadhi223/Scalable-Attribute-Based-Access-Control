<%-- 
    Document   : DO_login
    Created on : 9 Mar, 2021, 5:34:14 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>A Scalable Attribute-Based Access Control Scheme</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="assets/css/demo.css" rel="stylesheet" />
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar" data-color="blue">
                <!--
            Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
    
            Tip 2: you can also add an image using data-image tag
                -->
                <div class="sidebar-wrapper">
                    <div class="logo">
                    </div>
                    <ul class="nav">
                        <li>
                            <a class="nav-link" href="DU_Home.jsp">
                                <i class="nc-icon nc-app"></i>
                                <p>Home</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="user_files.jsp">
                                <i class="nc-icon nc-zoom-split"></i>
                                <p>Access Files</p>
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="req_files.jsp">
                                <i class="nc-icon nc-single-copy-04"></i>
                                <p>Requested Files</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="downloaded_files.jsp">
                                <i class="fa fa-download"></i>
                                <p>Downloaded Files</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="index.html">
                                <i class="nc-icon nc-button-power"></i>
                                <p>Logout</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse justify-content-end" id="navigation">
                            <center><h3> A Scalable Attribute-Based Access Control
                                    Scheme with Flexible Delegation cum Sharing of
                                    Access Privileges for Cloud Storage</h3></center>
                        </div>
                    </div>
                </nav>
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <br><br>
                                <div class="card strpied-tabled-with-hover">
                                    <div class="card-header ">
                                        <center><h4 class="card-title">Requested Files</h4></center>
                                    </div>
                                    <div class="card-body table-full-width table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                            <td class="text-center"><b>File ID</b></td>
                                            <td class="text-center"><b>File Name</b></td>
                                            <td class="text-center"><b>Status</b></td>
                                            <td class="text-center"><b>Uploaded Time</b></td>
                                            <td class="text-center"><b>Action</b></td>
                                            </thead>
                                            <%
                                                String uid = (String) session.getAttribute("duid");

                                                Connection con = SQLconnection.getconnection();
                                                Statement st = con.createStatement();
                                                try {
                                                    ResultSet rs = st.executeQuery("Select * from request where uid = '" + uid + "'");
                                                    while (rs.next()) {
                                            %>
                                            <tbody>
                                                <tr>
                                                    <td class="center"><%=rs.getString("id")%> </td>
                                                    <td class="center"><%=rs.getString("filename")%> </td>
                                                    <td class="center"><%=rs.getString("status")%> </td>
                                                    <td class="center"><%=rs.getString("time")%> </td>
                                                    <td><a href="view_requested.jsp?fid=<%=rs.getString("fid")%>&time=<%=rs.getString("time")%>" class="btn btn-primary btn-fill" >Download</a></td>
                                                </tr>
                                            </tbody>
                                            <%                                        }
                                                } catch (Exception ex) {
                                                    ex.printStackTrace();
                                                }

                                            %>
                                        </table>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
                </body>
                <!--   Core JS Files   -->
                <script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
                <script src="assets/js/core/popper.min.js" type="text/javascript"></script>
                <script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
                <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
                <script src="assets/js/plugins/bootstrap-switch.js"></script>
                <!--  Google Maps Plugin    -->
                <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
                <!--  Chartist Plugin  -->
                <script src="assets/js/plugins/chartist.min.js"></script>
                <!--  Notifications Plugin    -->
                <script src="assets/js/plugins/bootstrap-notify.js"></script>
                <!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
                <script src="assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
                <!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
                <script src="assets/js/demo.js"></script>
                <script type="text/javascript">
                    $(document).ready(function () {
                        // Javascript method's body can be found in assets/js/demos.js
                        demo.initDashboardPageCharts();


                    });
                </script>

                </html>
