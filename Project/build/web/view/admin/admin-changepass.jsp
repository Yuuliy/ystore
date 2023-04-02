<%-- 
    Document   : admin-changepass
    Created on : Oct 20, 2022, 1:06:38 PM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="admincss/assets/img/favicon.ico">
        <title>Preclinic - Medical & Hospital - Bootstrap 4 Admin Template</title>
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/style.css">
        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
    </head>
    <body>
        <div class="main-wrapper">
            <div class="header">
                <a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
                <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
                <div class="header-left">
                    <a href="admin-home" class="logo">
                        <span>Admin System</span>
                    </a>
                </div>
                <ul class="nav user-menu float-right">
                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                            <span class="user-img">
<!--                                <img class="rounded-circle" src="admincss/assets/img/user.jpg" width="24" alt="Admin">
                                -->
                                <c:if test="${account != null}">
                                    <img style="max-width: 30px; min-width: 30px; border-radius: 50%" src="${account.info.avatar}"/>
                                    <span class="status online"></span>
                                    <c:if test="${account.info.avatar == null || account.info.avatar == ''  }">
                                        <img style="max-width: 30px; min-width: 30px; border-radius: 50%" src="img/avatardefault.png"/>
                                    </c:if>    

                                </c:if>
                            </span>
                            <span>Admin</span>

                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="admin-profile">My Profile</a>
                            <a class="dropdown-item" href="admin-changepass">Change Password</a>                            
                            <a class="dropdown-item" href="admin-logout">Logout</a>
                        </div>
                    </li>
                </ul>
                <div class="dropdown mobile-user-menu float-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="admin-profile">My Profile</a>

                        <a class="dropdown-item" href="settings.html">Settings</a>
                        <a class="dropdown-item" href="admin-logout">Logout</a>
                        <a class="dropdown-item" href="admin-changepass">Change Password</a>
                    </div>
                </div>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div class="sidebar-menu">                      
                        <ul>
                            <li class="menu-title">Main</li>
                            <li class="active">
                                <a href="admin-home"><i class="fa fa-home" aria-hidden="true"></i> <span>Home</span></a>
                            </li>
                            <li>
                                <a href="admin-user"><i class="fa fa-user" aria-hidden="true"></i> <span>User Management</span></a>
                            </li>                         
                            <li class="submenu">
                                <a href="#"><i class="fa fa-refresh" aria-hidden="true"></i> <span> Product </span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="admin-productlist">Product List</a></li>
                                    <li><a href="admin-category">Category List</a></li>
                                    <li><a href="producer-list">Producer List</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="admin-transaction"><i class="fa fa-money"></i><span> Order </span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-md-6 offset-md-3">
                            <h4 class="page-title">Change Password</h4>
                            <input type="password" id="password" value="${sessionScope.account.password}" hidden/>

                            <form action="admin-changepass" method="post">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Old password</label>
                                            <input onchange="oldPass()" id="oldpass" type="password" class="form-control" name="oldpass">
                                            <h5 style="color: red" id="showErrorOld" hidden>Password incorrect</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>New password</label>
                                            <input onchange="newPass()" id="newpass" name="newpass" type="password" class="form-control">
                                            <h5 style="color: red" id="showErrorOld2" hidden>The new password cannot be the same as the old password</h5>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Confirm password</label>
                                            <input onchange="rePass()" id="repass" name="repass" type="password" class="form-control">
                                            <h5 style="color: red" id="showErrorOld3" hidden>The re-password must be the same as the new password</h5>
                                        </div>
                                    </div>
                                </div>
                                <script type="text/javascript">

                                    function oldPass() {
                                        var password = document.getElementById('password').value;
                                        var oldpass = document.getElementById('oldpass').value;

                                        if (oldpass === "" || oldpass != password) {
                                            document.getElementById('showErrorOld').hidden = false;

                                        } else {
                                            document.getElementById('showErrorOld').hidden = true;

                                        }

                                    }
                                </script>
                                <script type="text/javascript">

                                    function newPass() {
                                        var oldpass = document.getElementById('oldpass').value;
                                        var newpass = document.getElementById('newpass').value;

                                        if (newpass === "" || newpass == oldpass) {
                                            document.getElementById('showErrorOld2').hidden = false;

                                        } else {
                                            document.getElementById('showErrorOld2').hidden = true;

                                        }

                                    }
                                </script>
                                <script type="text/javascript">

                                    function rePass() {
                                        var newpass = document.getElementById('newpass').value;
                                        var repass = document.getElementById('repass').value;

                                        if (repass === "" || repass != newpass) {
                                            document.getElementById('showErrorOld3').hidden = false;

                                        } else {
                                            document.getElementById('showErrorOld3').hidden = true;

                                        }

                                    }
                                </script>
                                <div class="row">
                                    <div class="col-sm-12 text-center m-t-20">
                                        <button type="submit" class="btn btn-primary submit-btn">Update Password</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="sidebar-overlay" data-reff=""></div>
        <script src="admincss/assets/js/jquery-3.2.1.min.js"></script>
        <script src="admincss/assets/js/popper.min.js"></script>
        <script src="admincss/assets/js/bootstrap.min.js"></script>
        <script src="admincss/assets/js/jquery.slimscroll.js"></script>
        <script src="admincss/assets/js/app.js"></script>

    </body>
</html>
