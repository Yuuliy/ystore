<%-- 
    Document   : UserManager
    Created on : Oct 25, 2022, 11:16:01 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
                            <li >
                                <a href="admin-home"><i class="fa fa-home" aria-hidden="true"></i> <span>Home</span></a>
                            </li>
                            <li class="active">
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
                        <div class="col-sm-4 col-3">
                            <h4 class="page-title">Account Manager</h4>
                        </div>
                        <div class="col-sm-8 col-9 text-right m-b-20">
                            <!--                            <a href="add-doctor.html" class="btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i>New Account</a>-->
                        </div>
                    </div>
                    <div class="row doctor-grid">

                        <c:forEach items="${listU}" var="u">
                            <div class="col-md-4 col-sm-4  col-lg-3">
                                <div class="profile-widget">
                                    <div class="doctor-img">
                                        <c:if test="${u.info.avatar != null}">
                                            <a class="avatar"><img alt="" src="${u.info.avatar}"></a>
                                        </c:if>
                                        <c:if test="${u.info.avatar == null}">
                                            <a class="avatar"><img alt="" src="img/avatardefault.png"></a>
                                        </c:if>
                                    </div>


                                    <c:if test="${sessionScope.account.accountID == 1}">

                                        <div class="dropdown profile-action">
                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <c:if test="${u.ADMIN == 0 && u.accountID != 1}">
                                                    <a class="dropdown-item" href="changerole?id=${u.accountID}&role=1"><i class="fa fa-pencil m-r-5"></i>Upgrade To Admin</a>
                                                </c:if>
                                                <c:if test="${u.ADMIN == 1 && u.accountID != 1}">
                                                    <a class="dropdown-item" href="changerole?id=${u.accountID}&role=0"><i class="fa fa-pencil m-r-5"></i>Cancel Admin</a>
                                                </c:if>
                                                
                                                <c:if test="${u.accountID == 1}">
                                                    <a class="dropdown-item" href="admin-profile"><i class="fa fa-pencil m-r-5"></i> View profile</a>
                                                </c:if>
                                            </div>
                                        </div>

                                    </c:if>

                                    <h4 class="doctor-name text-ellipsis"><a href="profile.html">${u.fullName}</a></h4>
                                    <div class="doc-prof">

                                        <p style="color:  ${u.ADMIN == 0?'blue':'red'}">${u.ADMIN == 0?'USER':'ADMIN'}</p>


                                    </div>
                                    <div class="user-country">
                                        <i class="fa fa-map-marker"></i> ${u.info.country}, ${u.info.address} 
                                    </div>
                                </div>
                            </div>
                            <form action="deleteaccount" method="get">
                                <div id="delete_doctor" class="modal fade delete-modal" role="dialog">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body text-center">
                                                <img src="admincss/assets/img/sent.png" alt="" width="50" height="46">
                                                <h3>Are you sure want to delete this Doctor?</h3>
                                                <div class="m-t-20"> <a href="" class="btn btn-white" data-dismiss="modal">Close</a>
                                                    <input type="text" name="id" value="${u.accountID}" hidden/>
                                                    <button type="submit" class="btn btn-danger">Delete</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="see-all">
                                <a class="see-all-btn" href="admin-user">Load More</a>
                            </div>
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
</html>
