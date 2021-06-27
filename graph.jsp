<%-- 
    Document   : DO_login
    Created on : 9 Mar, 2021, 5:34:14 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.Gson"%>
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
                            <a class="nav-link" href="Cloud_Home.jsp">
                                <i class="nc-icon nc-app"></i>
                                <p>Home</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="Cloud_files.jsp">
                                <i class="fa fa-cloud"></i>
                                <p>Cloud Files</p>
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="graph.jsp">
                                <i class="nc-icon nc-chart-bar-32"></i>
                                <p>Graph</p>
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
                                        <center><h4 class="card-title">Analysis</h4></center>
                                    </div>
                                    <div class="card-body">
                                        <%
                                            String val1 = "", val2 = "", val3 = "";
                                            String val11 = "", val22 = "", val33 = "";
                                            int i = 0;

                                            try {
                                                Connection con = SQLconnection.getconnection();

                                                Statement st1 = con.createStatement();
                                                ResultSet rs2 = st1.executeQuery("SELECT  AVG(enc_time) FROM  do_files ");
                                                rs2.next();
                                                {
                                                    val2 = rs2.getString("AVG(enc_time)");
                                                }
                                                rs2.close();
                                                Statement st2 = con.createStatement();
                                                ResultSet rs3 = st2.executeQuery("SELECT  AVG(decrypt_time) FROM  download ");
                                                rs3.next();
                                                {
                                                    val3 = rs3.getString("AVG(decrypt_time)");
                                                }
                                                System.out.println("count------------------> " + val2);
                                                System.out.println("count------------------> " + val3);

                                            } catch (Exception ex) {
                                                ex.printStackTrace();
                                            }

                                        %>
                                        <script type="text/javascript">
                                            window.onload = function () {

                                                var chart = new CanvasJS.Chart("chartContainer", {
                                                    animationEnabled: true,
                                                    exportEnabled: true,
                                                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                                                    title: {
                                                        text: ""
                                                    },
                                                    axisY: {
                                                        title: "Time in MS"
                                                    },
                                                    data: [{
                                                            type: "column",
                                                            showInLegend: true,
                                                            legendMarkerColor: "grey",
                                                            legendText: "Entities",
                                                            dataPoints: [
                                                                {y: <%=val2%>, label: "Avg Encryption_Time in MS"},
                                                                {y: <%=val3%>, label: "Avg Decryption_Time in MS"}

                                                            ]
                                                        }]
                                                });
                                                chart.render();
                                            }
                                        </script>
                                        <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
                </body>
                <script type="text/javascript" src="assets/js/custom.js"></script>
                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                <!-- About us Skills Circle progress  -->
                <script>
                                            // First circle
                                            new Circlebar({
                                                element: "#circle-1",
                                                type: "progress",
                                                maxValue: "90"
                                            });

                                            // Second circle
                                            new Circlebar({
                                                element: "#circle-2",
                                                type: "progress",
                                                maxValue: "84"
                                            });

                                            // Third circle
                                            new Circlebar({
                                                element: "#circle-3",
                                                type: "progress",
                                                maxValue: "60"
                                            });

                                            // Fourth circle
                                            new Circlebar({
                                                element: "#circle-4",
                                                type: "progress",
                                                maxValue: "74"
                                            });

                </script>
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
