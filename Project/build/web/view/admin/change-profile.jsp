<%-- 
    Document   : change-profile
    Created on : Oct 20, 2022, 1:16:08 PM
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
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/style.css">
        <!--        <link rel="stylesheet" type="text/css" href="admincss/assets/js/ckeditor">-->
        <script src="admincss/assets/js/ckeditor/ckeditor.js"></script>
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
                            <h3 class="page-title">Change Profile</h3>
                            <form action="admin-changeprofile" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-3" style="margin-right: 2.5rem ">
                                        <img style="max-width: 200px; min-width: 200px; border-radius: 50%" id="output" src="${sessionScope.account.info.avatar}"/>
                                        <input type="file" name="avatar" accept=".jpg, .png" onchange="loadFile(event)" >    
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group form-focus">
                                                    <label class="focus-label">First Name</label>
                                                    <input type="text" class="form-control floating" value="${account.info.firstName}" name="firstName">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group form-focus">
                                                    <label class="focus-label">Last Name</label>
                                                    <input type="text" class="form-control floating" value="${account.info.lastName}" name="lastName">
                                                </div>
                                            </div>
                                        </div><br/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group form-focus">
                                                    <label class="focus-label">Birth Of Date</label>                                       
                                                    <input class="form-control floating datetimepicker" type="date" value="${account.info.birthDay}" name="dob">                                        
                                                </div>
                                            </div>  

                                        </div><br/>

                                        <div class="row">
                                            <div class=" col-md-2">
                                                <input type="radio" id="male" name="gender" ${account.info.gender==1? 'checked':''} value="1">
                                                    <label for="html">Male</label><br>
                                            </div>
                                            <div class=" col-md-2">
                                                <input type="radio" id="femal" name="gender" ${account.info.gender==0? 'checked':''} value="0">
                                                  <label for="css">Female</label><br>
                                            </div>
                                        </div><br/> 
                                        <div class="row">

                                            <div class="col-sm-6 col-md-6 col-lg-9">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input name="address" class="form-control" value="${account.info.address}" type="text">
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-md-6 col-lg-3">
                                                <div class="form-group">
                                                    <label>Country</label>
                                                    <input name="country" class="form-control" value="${account.info.country}" type="text">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input name="email" class="form-control" value="${account.email}" type="email">
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label>Phone Number</label>
                                                    <input name="phone" class="form-control" value="${account.info.phone}" type="text">
                                                </div>
                                            </div>
                                        </div>
<!--                                        <div>
                                            <label>More Detail</label>
                                            <textarea name="summary" id="editor1" rows="100" cols="150">
                                                                                        
                                            </textarea>
                                            <script>
                                                // Replace the <textarea id="editor1"> with a CKEditor 4
                                                // instance, using default configuration.
                                                CKEDITOR.replace('editor1');
                                            </script>
                                        </div>-->
                                        <div class="row">
                                            <div class="col-sm-12 text-center m-t-20">
                                                <input type="submit" class="btn btn-primary submit-btn" value="Save"/>
                                            </div>
                                        </div>
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
        <script src="assets/js/popper.min.js"></script>
        <script src="admincss/assets/js/bootstrap.min.js"></script>
        <script src="admincss/assets/js/jquery.slimscroll.js"></script>
        <script src="admincss/assets/js/select2.min.js"></script>
        <script src="admincss/assets/js/app.js"></script>
        <script>
                                                var loadFile = function (event) {
                                                    var output = document.getElementById('output');
                                                    output.src = URL.createObjectURL(event.target.files[0]);
                                                    output.onload = function () {
                                                        URL.revokeObjectURL(output.src) // free memory
                                                    }
                                                };
        </script>
    </body>
</html>
