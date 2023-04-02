<%-- 
    Document   : productList
    Created on : Oct 26, 2022, 3:55:02 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


    <!-- expenses23:25-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="admincss/assets/img/favicon.ico">
        <title>Product List</title>
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/style.css">
        <link rel="stylesheet" href="https://code.jquery.com/jquery-3.5.1.js"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"/>

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
                            <li>
                                <a href="admin-home"><i class="fa fa-home" aria-hidden="true"></i> <span>Home</span></a>
                            </li>
                            <li>
                                <a href="admin-user"><i class="fa fa-user" aria-hidden="true"></i> <span>User Management</span></a>
                            </li>                         
                            <li class="submenu active" >
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
                        <div class="col-sm-8 col-5">
                            <h4 class="page-title">Product List</h4>
                        </div>
                        <div class="col-sm-4 col-7 text-right m-b-30">
                            <a href="admin-addproduct" class="btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Product</a>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table id="example" class="table table-striped table-bordered" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th width="5%">ID</th>
                                            <th>Product Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Insurance</th>
                                            <th class="text-center">Status</th>
                                            <th class="text-right" width="5%">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${djtcu}" var="c">
                                            <tr>
                                                <td>${c.productID}</td>
                                                <td>${c.productName}</td>
                                                <td>${c.priceFormat}</td>
                                                <td>${c.quantity}</td>
                                                <td>${c.insurance}</td>
                                                <td class="text-center">
                                                    <div class="dropdown action-label">
                                                        <c:if test="${c.quantity > 0}">
                                                            <a class="custom-badge status-green " href="#" data-toggle="dropdown" aria-expanded="false">
                                                                Stocking
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${c.quantity <= 0}">
                                                            <a class="custom-badge status-red " href="#" data-toggle="dropdown" aria-expanded="false">
                                                                Out of stock
                                                            </a>
                                                        </c:if>
                                                        <!--                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                                                                    <a class="dropdown-item" href="#">Pending</a>
                                                                                                                    <a class="dropdown-item" href="#">Approved</a>
                                                                                                                </div>-->
                                                    </div>
                                                </td>
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action">
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="update-product?id=${c.productID}"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                            <a class="dropdown-item" href="deleteproduct?id=${c.productID}" ><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                        </div>
                                                    </div>
                                                    <div id="delete_expense" class="modal fade delete-modal" role="dialog">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-body text-center">
                                                                    <img src="admincss/assets/img/sent.png" alt="" width="50" height="46">
                                                                    <h3>Are you sure want to delete this expense?</h3>
                                                                    <div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Close</a>
                                                                        <form action="deleteproduct" method="get">
                                                                            <input type="text" name="id" value="${c.productID}" hidden>
                                                                            <button type="submit" class="btn btn-danger">Delete</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>



                                            </tr> 
                                        </c:forEach>
                                    </tbody>
                                </table>
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
        <script src="admincss/assets/js/jquery.dataTables.min.js"></script>
        <script src="admincss/assets/js/dataTables.bootstrap4.min.js"></script>
        <script src="admincss/assets/js/jquery.slimscroll.js"></script>
        <script src="admincss/assets/js/select2.min.js"></script>
        <script src="admincss/assets/js/moment.min.js"></script>
        <script src="admincss/assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="admincss/assets/js/app.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </body>

    <!-- expenses23:26-->
</html>

