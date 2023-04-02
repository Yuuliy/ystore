<%-- 
    Document   : profile
    Created on : 16-10-2022, 15:06:39
    Author     : phanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <!-- profile22:59-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="admincss/assets/img/favicon.ico">
        <title>Preclinic - Medical & Hospital - Bootstrap 4 Admin Template</title>
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/style.css">
    </head>

    <body>
        <c:set var="account" value="${sessionScope.account}"/>
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
                        <div class="col-sm-7 col-6">
                            <h4 class="page-title">My Profile</h4>
                        </div>

                        <div class="col-sm-5 col-6 text-right m-b-30">
                            <a href="admin-changeprofile" class="btn btn-primary btn-rounded"><i class="fa fa-plus"></i> Edit Profile</a>
                        </div>
                    </div>
                    <div style="padding-bottom: 65px" class="card-box profile-header">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="profile-view">
                                    <div class="profile-img-wrap">
                                        <div class="profile-img">
                                            <a href="#">
                                                <c:if test="${sessionScope.account.info.avatar == ''}">
                                                    <img class="avatar" src="" alt="">
                                                </c:if> 
                                                <c:if test="${sessionScope.account.info.avatar != '  '}">
                                                    <img  class="avatar" src="${sessionScope.account.info.avatar}" alt="">
                                                </c:if>

                                            </a>
                                        </div>
                                    </div>
                                    <div class="profile-basic">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="profile-info-left">
                                                    <h3 class="user-name m-t-0 mb-0">${account.info.fullName}</h3>
                                                    <small class="text-muted">
                                                        <c:if test="${account.ADMIN == 1}">
                                                            Admin 1
                                                        </c:if>
                                                        <c:if test="${account.ADMIN == 2}">
                                                            Admin 2
                                                        </c:if><c:if test="${account.ADMIN == 3}">
                                                            Admin 3
                                                        </c:if>

                                                    </small>
                                                    <div class="staff-id">ID : #TH-${account.accountID}</div>
                                                    <div class="staff-msg"><a href="chat.html" ></a></div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>                        
                            </div>
                        </div>
                    </div>
                    <div class="profile-tabs">
                        <div class="tab-content">
                            <div class="tab-pane show active" id="bottom-tab2">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card-box">
                                            <h3 class="card-title">Contact Informations</h3>
                                            <div class="experience-box">
                                                <ul class="experience-list">
                                                    <li>
                                                        <div class="experience-user">
                                                            <div class="before-circle"></div>
                                                        </div>
                                                        <div class="experience-content">
                                                            <div class="timeline-content">
                                                                <a href="#/" class="name">Email</a>
                                                                <div>${account.email}</div>

                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="experience-user">
                                                            <div class="before-circle"></div>
                                                        </div>
                                                        <div class="experience-content">
                                                            <div class="timeline-content">
                                                                <a href="#/" class="name">Phone</a>
                                                                <div>${account.info.phone}</div>

                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
<!--                                        <div class="card-box mb-0">
                                            <h3 class="card-title">Quyền</h3>
                                            <div class="experience-box">
                                                <ul class="experience-list">
                                                    <li>
                                                        <div class="experience-user">
                                                            <div class="before-circle"></div>
                                                        </div>
                                                        <div class="experience-content">
                                                            <div class="timeline-content">
                                                                <a href="#/" class="name">Consultant Gynecologist</a>
                                                                <span class="time">Jan 2014 - Present (4 years 8 months)</span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="experience-user">
                                                            <div class="before-circle"></div>
                                                        </div>
                                                        <div class="experience-content">
                                                            <div class="timeline-content">
                                                                <a href="#/" class="name">Consultant Gynecologist</a>
                                                                <span class="time">Jan 2009 - Present (6 years 1 month)</span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="experience-user">
                                                            <div class="before-circle"></div>
                                                        </div>
                                                        <div class="experience-content">
                                                            <div class="timeline-content">
                                                                <a href="#/" class="name">Consultant Gynecologist</a>
                                                                <span class="time">Jan 2004 - Present (5 years 2 months)</span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>-->
                                    </div>
                                </div>
                            </div>
                            <!--                            <div class="tab-pane" id="bottom-tab3">
                                                            Tab content 3
                                                        </div>-->
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


    <!-- profile23:03-->
</html>
