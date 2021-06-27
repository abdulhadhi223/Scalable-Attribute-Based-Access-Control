<%-- 
    Document   : DO_login
    Created on : 9 Mar, 2021, 5:34:14 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <a class="nav-link" href="index.html">
                                <i class="nc-icon nc-app"></i>
                                <p>Home</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="DO_login.jsp">
                                <i class="nc-icon nc-layers-3"></i>
                                <p>Data Owner</p>
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="DU_login.jsp">
                                <i class="nc-icon nc-circle-09"></i>
                                <p>Data User</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="TTP_login.jsp">
                                <i class="nc-icon nc-caps-small"></i>
                                <p>TTP</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="CA_login.jsp">
                                <i class="nc-icon nc-settings-gear-64"></i>
                                <p>Central Authority</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="Domain_login.jsp">
                                <i class="nc-icon nc-atom"></i>
                                <p>Domain Authority</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="Cloud_login.jsp">
                                <i class="nc-icon nc-globe-2"></i>
                                <p>Cloud Server</p>
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
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-8">
                                <div class="card ">
                                    <div class="card-header ">
                                        <center> <h3 class="card-title">Data User Register</h3></center><br><br>
                                    </div>
                                    <div class="card-body">
                                        <form method="post" action="du_reg">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label><b>Name :</b></label><br>
                                                        <input type="text" name="username" class="form-control" placeholder="Enater Your Name" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label><b>DOB :</b></label><br>
                                                        <input type="date" name="dob" class="form-control" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label><b>Email ID :</b></label><br>
                                                        <input type="email" name="email" class="form-control" placeholder="Enater Your Email ID" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label><b>Gender :</b></label><br>
                                                        <select name="gender" class="form-control" required="required">
                                                            <option value="">Select Your Gender</option>
                                                            <option>Male</option>
                                                            <option>Female</option>
                                                            <option>Others</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label><b>Phone No :</b></label><br>
                                                        <input type="text" name="phone" class="form-control" placeholder="Enater Your Phone No" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label><b>Address :</b></label><br>
                                                        <input type="text" name="address" class="form-control" placeholder="Enater Your Address" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label><b>Password :</b></label><br>
                                                        <input type="password" name="pass" class="form-control" placeholder="Enater Your Password" required="required"><br>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary btn-fill">Sign Up</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
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
