<%-- 
    Document   : dashboard
    Created on : 21-09-2022, 11:11:28
    Author     : Phan Hiếu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <!--        <link rel="shortcut icon" type="image/x-icon" href="admincss/assets/img/logo-website.png">-->
        <link rel="shortcut icon" type="image/x-icon" href="admincss/assets/img/favicon.ico">
        <title>Admin Control</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/style.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
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
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-4">
                            <div class="dash-widget">
                                <span class="dash-widget-bg1"><i class="fa fa-user-o" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h2>${totalUser}</h2>

                                    <span class="widget-title1">User <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                        <jsp:useBean id="od" class="dal.OrderDAO"/>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-4">
                            <div class="dash-widget">
                                <span class="dash-widget-bg2"><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h2>${od.getPriceFormat(totalOrder)} Ð</h2>

                                    <form action="" method="get">
                                        <input type="text" name="action" value="totalOrder" hidden>
                                        <select name="month" onchange="this.form.submit()">
                                            <c:forEach begin="1" end="12" var="i">
                                                <option value="${i}" ${i == month ? 'selected' : ''}>Tháng ${i}</option>
                                            </c:forEach>
                                        </select>
                                        
                                        <select name="year" onchange="this.form.submit()">
                                            <c:forEach begin="0" end="4" var="i">
                                                <option value="${curYear - i}" ${year == curYear - i ? 'selected' : ''}>${curYear - i}</option>
                                            </c:forEach>
                                        </select>
                                    </form>
                                    



                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-4">
                            <div class="dash-widget">
                                <span class="dash-widget-bg3"><i class="fa fa-laptop" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h2>${totalProduct}</h2>
                                    <span class="widget-title3">Product <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>                        
                    </div>
                    <div class="row">
                        <div class="col-12 col-md-12 col-lg-12 col-xl-9">
                            <div class="card">
                                <div class="card-body">
                                    <div class="chart-title">
                                        <h4>Order Total</h4>
                                        <span class="float-right"><i class="fa fa-caret-up" aria-hidden="true"></i> 15% Higher than Last Month</span>
                                    </div>	
                                    <canvas id="linegraphs"></canvas>
                                </div>
                            </div>
                        </div>
                        <script>
                            <jsp:useBean id="pd" class="dal.ProductDAO"/>
                            var lineChartData = {
                                labels: [<c:forEach items="${pd.getDataChart(1)}" var="i">'${i.key == 1 ? 'Jan' : ''}${i.key == 2 ? 'Feb' : ''}${i.key == 3 ? 'Mar' : ''}${i.key == 4 ? 'Apr' : ''}${i.key == 5 ? 'May' : ''}${i.key == 6 ? 'Jun' : ''}${i.key == 7 ? 'Junly' : ''}${i.key == 8 ? 'Aug' : ''}${i.key == 9 ? 'Sep' : ''}${i.key == 10 ? 'Oct' : ''}${i.key == 11 ? 'Nov' : ''}${i.key == 12 ? 'Dec' : ''}', </c:forEach>],
                                        datasets: [{
                                                label: "Chelsea Boot",
                                                backgroundColor: "rgba(0, 158, 251, 0.5)",
                                                data: [<c:forEach items="${pd.getDataChart(3)}" var="i">${i.value}, </c:forEach>]
                                            }, {
                                                label: "Combat boot",
                                                backgroundColor: "rgba(255, 188, 53, 0.5)",
                                                fill: true,
                                                data: [<c:forEach items="${pd.getDataChart(4)}" var="i">${i.value}, </c:forEach>]
                                            }
                                            , {
                                                label: "Derby",
                                                backgroundColor: "rgba(1, 255, 255, 1)",
                                                fill: true,
                                                data: [<c:forEach items="${pd.getDataChart(5)}" var="i">${i.value}, </c:forEach>]
                                            }
                                            , {
                                                label: "Harness Boot",
                                                backgroundColor: "rgba(2, 255, 255, 1)",
                                                fill: true,
                                                data: [<c:forEach items="${pd.getDataChart(6)}" var="i">${i.value}, </c:forEach>]
                                            }
                                            , {
                                                label: "Loafer",
                                                backgroundColor: "rgba(3, 255, 255, 1)",
                                                fill: true,
                                                data: [<c:forEach items="${pd.getDataChart(7)}" var="i">${i.value}, </c:forEach>]
                                            }
                                            , {
                                                label: "Oxford",
                                                backgroundColor: "rgba(4, 255, 255, 1)",
                                                fill: true,
                                                data: [<c:forEach items="${pd.getDataChart(8)}" var="i">${i.value}, </c:forEach>]
                                            }
                                            , {
                                                label: "Slipper",
                                                backgroundColor: "rgba(5, 255, 255, 1)",
                                                fill: true,
                                                data: [<c:forEach items="${pd.getDataChart(9)}" var="i">${i.value}, </c:forEach>]
                                            }]
                            };

                            var linectx = document.getElementById('linegraphs').getContext('2d');
                            window.myLine = new Chart(linectx, {
                                type: 'line',
                                data: lineChartData,
                                options: {
                                    responsive: true,
                                    legend: {
                                        display: false,
                                    },
                                    tooltips: {
                                        mode: 'index',
                                        intersect: false,
                                    }
                                }
                            });
                            </script>
                            <div class="col-12 col-md-12 col-lg-3 col-xl-3">
                                <div class="card member-panel">
                                    <div class="card-header bg-white">
                                        <h4 class="card-title mb-0">Account</h4>
                                    </div>
                                    <div class="card-body">
                                        <ul class="contact-list">
                                        <c:forEach items="${listacc}" var="l">
                                            <li>
                                                <div class="contact-cont">
                                                    <div class="float-left user-img m-r-10">
                                                        <c:if test="${l.info.avatar == null}">
                                                            <a href="profile.html" title="John Doe"><img src="admincss/assets/img/user.jpg" alt="" class="w-40 rounded-circle"><span class="status online"></span></a>
                                                            </c:if>
                                                            <c:if test="${l.info.avatar != null}">
                                                            <a href="profile.html" title="John Doe"><img src="${l.info.avatar}" alt="" class="w-40 rounded-circle"><span class="status online"></span></a>
                                                            </c:if>
                                                    </div>
                                                    <div class="contact-info">
                                                        <span class="contact-name text-ellipsis">${l.fullName}</span>
                                                        <c:if test="${l.ADMIN == 1}">
                                                            <span class="contact-date" style="color: red">ADMIN</span>
                                                        </c:if>
                                                        <c:if test="${l.ADMIN != 1}">
                                                            <span class="contact-date" style="color: blue">User</span>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>                                        
                                    </ul>
                                </div>
                                <div class="card-footer text-center bg-white">
                                    <a href="admin-user" class="text-muted">View all Doctors</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title d-inline-block">New Order</h4><a href="admin-transaction" class="btn btn-primary float-right">View all</a> 
                                </div>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <thead class="d-none">
                                                <tr>
                                                    <th>OrderID</th>
                                                    <th>Account ID</th>
                                                    <th>Order Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listOrder}" var="c">
                                                    <tr>
                                                        <td style="min-width: 200px;">                                                           
                                                            <h2><img style="max-width: 30px; min-width: 30px; border-radius: 50%" src="${c.account.info.avatar}">&nbsp;&nbsp; ${c.account.fullName}<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${c.account.info.address}</span></img></h2>
                                                        </td>                 
                                                        <td>
                                                            <h5 class="time-title p-0">${c.createAt}</h5>

                                                        </td>
                                                        <td>
                                                            <h5 class="time-title p-0">${c.priceFormat}&nbspVND</h5>                                                                                                                        
                                                    </tr>
                                                </c:forEach> 
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-4 col-xl-4">

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
        <script src="admincss/assets/js/Chart.bundle.js"></script>
        <script src="admincss/assets/js/chart.js"></script>
        <script src="admincss/assets/js/app.js"></script>

    </body>


    <!-- index22:59-->
</html>
