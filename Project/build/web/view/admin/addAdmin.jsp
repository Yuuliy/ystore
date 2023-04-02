<%-- 
    Document   : addAdmin
    Created on : 23-09-2022, 23:27:52
    Author     : phanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


    <!-- edit-doctor24:06-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="admincss/assets/img/favicon.ico">
        <title>Preclinic - Medical & Hospital - Bootstrap 4 Admin Template</title>
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/style.css">
        <!--[if lt IE 9]>
                    <script src="admincss/assets/js/html5shiv.min.js"></script>
                    <script src="admincss/assets/js/respond.min.js"></script>
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
                    <div id="sidebar-menu" class="sidebar-menu">
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
                            <li >
                                <a href="admin-transaction"><i class="fa fa-money"></i><span> Order </span></a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <h4 class="page-title">Add Admin</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <form>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>First Name <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" value="${requestScope.account.information.firstName}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <input class="form-control" type="text" value="${requestScope.account.information.lastName}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Username <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" value="${requestScope.account.userName}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Email <span class="text-danger">*</span></label>
                                            <input class="form-control" type="email" value="${requestScope.account.email}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Date of Birth</label>
                                            <div class="cal-icon">
                                                <input type="text" class="form-control datetimepicker" value="${requestScope.account.information.birthDay}" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group gender-select">
                                            <label class="gen-label">Gender:</label>
                                            <div class="form-check-inline">
                                                <label class="form-check-label">
                                                    <input type="radio" name="gender" class="form-check-input" ${requestScope.account.information.gender == 1 ? 'checked' : ''}>Male
                                                </label>
                                            </div>
                                            <div class="form-check-inline">
                                                <label class="form-check-label">
                                                    <input type="radio" name="gender" class="form-check-input" ${requestScope.account.information.gender == 0 ? 'checked' : ''}>Female
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text" class="form-control" value="${requestScope.account.information.address}" disabled>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-md-6 col-lg-5">
                                                <label>Country</label>
                                                <input type="text" class="form-control" value="${requestScope.account.information.country}" disabled>
                                            </div>
                                            <div class="col-sm-6 col-md-6 col-lg-7">
                                                <div class="form-group">
                                                    <label>Phone </label>
                                                    <input class="form-control" type="text" value="${requestScope.account.information.phone}" disabled>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Your avatar:</label>
                                            <div class="profile-upload">
                                                <div class="upload-img">
                                                    <img alt="avt" src="${requestScope.account.information.avatar}">
                                                </div>
                                                <div class="upload-input">
                                                    <input type="file" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="display-block">Action Of Admin</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="status" id="doctor_active" value="${requestScope.account.action.insertProduct}" ${requestScope.account.action.insertProduct == 1 ? 'checked' : ''}>
                                        <label class="form-check-label" for="doctor_active">
                                            Insert Product
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="status" id="doctor_active" value="${requestScope.account.action.updateProduct}" ${requestScope.account.action.updateProduct == 1 ? 'checked' : ''}>
                                        <label class="form-check-label" for="doctor_active">
                                            Update Product
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="status" id="doctor_active" value="${requestScope.account.action.deleteProduct}" ${requestScope.account.action.deleteProduct == 1 ? 'checked' : ''}>
                                        <label class="form-check-label" for="doctor_active">
                                            Delete Product
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="status" id="doctor_inactive" value="${requestScope.account.action.viewProduct}" ${requestScope.account.action.viewProduct == 1 ? 'checked' : ''}>
                                        <label class="form-check-label" for="doctor_inactive">
                                            View Product
                                        </label>
                                    </div><br/>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="status" id="doctor_inactive" value="${requestScope.account.action.updateAccount}" ${requestScope.account.action.updateAccount == 1 ? 'checked' : ''}>
                                        <label class="form-check-label" for="doctor_inactive">
                                            Update Account
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="status" id="doctor_inactive" value="${requestScope.account.action.deleteAccount}" ${requestScope.account.action.deleteAccount == 1 ? 'checked' : ''}>
                                        <label class="form-check-label" for="doctor_inactive">
                                            Delete Account
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="status" id="doctor_inactive" value="${requestScope.account.action.updateAction}" ${requestScope.account.action.updateAction == 1 ? 'checked' : ''}>
                                        <label class="form-check-label" for="doctor_inactive">
                                            Update Action
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="status" id="doctor_inactive" value="${requestScope.account.action.viewAccount}" ${requestScope.account.action.viewAccount == 1 ? 'checked' : ''}>
                                        <label class="form-check-label" for="doctor_inactive">
                                            View Account
                                        </label>
                                    </div>
                                </div>
                                <div class="m-t-20 text-center">
                                    <button class="btn btn-primary submit-btn">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="notification-box">
                    <div class="msg-sidebar notifications msg-noti">
                        <div class="topnav-dropdown-header">
                            <span>Messages</span>
                        </div>
                        <div class="drop-scroll msg-list-scroll" id="msg_list">
                            <ul class="list-box">
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">R</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Richard Miles </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item new-message">
                                            <div class="list-left">
                                                <span class="avatar">J</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">John Doe</span>
                                                <span class="message-time">1 Aug</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">T</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Tarah Shropshire </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">M</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Mike Litorus</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">C</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Catherine Manseau </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">D</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Domenic Houston </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">B</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Buster Wigton </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">R</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Rolland Webber </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">C</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author"> Claire Mapes </span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">M</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Melita Faucher</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">J</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Jeffery Lalor</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">L</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Loren Gatlin</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="chat.html">
                                        <div class="list-item">
                                            <div class="list-left">
                                                <span class="avatar">T</span>
                                            </div>
                                            <div class="list-body">
                                                <span class="message-author">Tarah Shropshire</span>
                                                <span class="message-time">12:28 AM</span>
                                                <div class="clearfix"></div>
                                                <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="topnav-dropdown-footer">
                            <a href="chat.html">See all messages</a>
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
        <script src="admincss/assets/js/select2.min.js"></script>
        <script src="admincss/assets/js/moment.min.js"></script>
        <script src="admincss/assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="admincss/assets/js/app.js"></script>
    </body>


    <!-- edit-doctor24:06-->
</html>


