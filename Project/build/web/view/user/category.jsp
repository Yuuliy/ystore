<%-- 
    Document   : category
    Created on : Oct 16, 2022, 11:02:04 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="usercss/img/fav.png">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
        <title>YStore</title>

        <!--
            CSS
            ============================================= -->
        <link rel="stylesheet" href="usercss/css/linearicons.css">
        <link rel="stylesheet" href="usercss/css/owl.carousel.css">
        <link rel="stylesheet" href="usercss/css/font-awesome.min.css">
        <link rel="stylesheet" href="usercss/css/themify-icons.css">
        <link rel="stylesheet" href="usercss/css/nice-select.css">
        <link rel="stylesheet" href="usercss/css/nouislider.min.css">
        <link rel="stylesheet" href="usercss/css/bootstrap.css">
        <link rel="stylesheet" href="usercss/css/main.css">
    </head>

    <body id="category">
        <!-- Start Header Area -->
        <header class="header_area sticky-header">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light main_box">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="index.html"><img src="" alt=""></a><!-- usercss/img/logo.png -->
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                            <ul class="nav navbar-nav menu_nav ml-auto">
                                <li class="nav-item active"><a class="nav-link" href="home">Home</a></li>
                                <li class="nav-item submenu dropdown">
                                    <a a class="nav-link" href="category">Shop</a>
                                </li>
                                <li class="nav-item submenu dropdown">                                    
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false">
                                        <c:if test="${account == null}">
                                            Pages
                                        </c:if>
                                        <c:if test="${account != null}">
                                            <img style="max-width: 30px; min-width: 30px; border-radius: 50%" src="${account.info.avatar}"/>

                                            <c:if test="${account.info.avatar == null || account.info.avatar == ''  }">
                                                <img style="max-width: 30px; min-width: 30px; border-radius: 50%" src="img/avatardefault.png"/>
                                            </c:if>    

                                        </c:if>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <c:if test="${account == null}">
                                            <li class="nav-item"><a class="nav-link" href="login">Login</a></li>
                                            </c:if> 
                                            <c:if test="${account == null}">
                                            <li class="nav-item"><a class="nav-link" href="register">Register</a></li>
                                            </c:if> 
                                            <c:if test="${account.ADMIN == 1}">
                                            <li class="nav-item"><a class="nav-link" href="admin-home">Admin page</a></li>
                                            </c:if>  
                                            <c:if test="${account != null}">
                                            <li class="nav-item"><a class="nav-link" href="profile">Profile</a></li>
                                            <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                                            </c:if>
                                            <c:if test="${account != null}">
                                            <li class="nav-item"><a class="nav-link" href="Change Password">Change Password</a></li>
                                            </c:if>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="nav-item"><a href="cart" class="cart"><span class="ti-bag"></span></a></li>
                                <li class="nav-item">
                                    <button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="search_input" id="search_input_box">
                <div class="container">
                    <form class="d-flex justify-content-between" action="category" method="get">
                        <input type="text" class="form-control" id="search_input" placeholder="Search Here" name="search">
                        <button type="submit" class="btn"></button>
                        <span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
                    </form>
                </div>
            </div>
        </header>
        <!-- End Header Area -->

        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Shop Category page</h1>
                        <nav class="d-flex align-items-center">
                            <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
                            <a href="category.html">Fashon Category</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-4 col-md-5">
                    <div class="sidebar-categories">
                        <div class="head">Browse Categories</div>
                        <ul class="main-categories">
                            <c:forEach items="${requestScope.listcategory}" var="c">
                                <li class="main-nav-list"><a ${c.categoryID == 15 || c.categoryID == 16? '' : 'data-toggle="collapse"'}  href="${c.categoryID == 1 ? '#giaynam':''}${c.categoryID == 2 ? '#giaynu':''}${c.categoryID == 17 ? '#totebag':''}${c.categoryID == 15 ?'category?cid=':''}${c.categoryID == 15 ?c.categoryID:''}${c.categoryID == 16 ?'category?cid=':''}${c.categoryID == 16 ?c.categoryID:''}" 
                                                                                                                                         aria-expanded="${categoryCheck != null ? 'true' : 'false'}" aria-controls="fruitsVegetable"><span
                                            class="lnr lnr-arrow-right"></span>${c.categoryName}</a>

                                    <c:if test="${c.categoryID == 1}">
                                        <ul class="collapse ${categoryCheck != null ? 'show' : ''}" id="giaynam" data-toggle="collapse" aria-expanded="false" aria-controls="fruitsVegetable">                                    

                                            <form action="">
                                                <c:forEach begin="0" end="${subCategoryCID1.size() - 1}" var="i">
                                                    <li class="filter-list">
                                                        <input class="pixel-checkbox" value="${subCategoryCID1.get(i).categoryID}" type="checkbox" id="apple" name="cid" 
                                                               onclick="this.form.submit()" ${categoryCheck[i] ? 'checked' : ''}> 
                                                        <label for="apple">${subCategoryCID1.get(i).categoryName}</label>
                                                    </li>


                                                </c:forEach>
                                            </form>
                                        </ul>
                                    </c:if>

                                    <c:if test="${c.categoryID == 2}">
                                        <ul class="collapse ${categoryCheck2 != null ? 'show' : ''}" id="giaynu" data-toggle="collapse" aria-expanded="false" aria-controls="fruitsVegetable">                                    
                                            <form action="">
                                                <c:forEach begin="0" end="${subCategoryCID2.size() - 1}" var="i">
                                                    <li class="filter-list">
                                                        <input class="pixel-checkbox" value="${subCategoryCID2.get(i).categoryID}" type="checkbox" id="apple" name="cid" 
                                                               onclick="this.form.submit()" ${categoryCheck2[i] ? 'checked' : ''}> 
                                                        <label for="apple">${subCategoryCID2.get(i).categoryName}</label>
                                                    </li>


                                                </c:forEach>
                                            </form> 
                                        </ul>
                                    </c:if>
                                    <c:if test="${c.categoryID == 17}">
                                        <ul class="collapse" id="totebag" data-toggle="collapse" aria-expanded="false" aria-controls="fruitsVegetable">                                    
                                            <form action="">
                                                <c:forEach begin="0" end="${subCategorytotebag.size() - 1}" var="i">
                                                    <li class="filter-list">
                                                        <input class="pixel-checkbox" value="${subCategorytotebag.get(i).categoryID}" type="checkbox" id="apple" name="cid" 
                                                               onclick="this.form.submit()" ${categoryCheck17[i] ? 'checked' : ''}> 
                                                        <label for="apple">${subCategorytotebag.get(i).categoryName}</label>
                                                    </li>
                                                </c:forEach>
                                            </form>
                                        </ul>
                                    </c:if>
                                </li>       
                            </c:forEach>              
                        </ul>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-8 col-md-7">
                    <!-- Start Filter Bar -->
                    <div class="filter-bar d-flex flex-wrap align-items-center">
                        <div class="sorting">
                            <form action="" method="get">
                                <select name="sort" onchange="this.form.submit()">
                                    <option value="default">Default</option>
                                    <option value="name" ${sort == 'name' ? 'selected' : ''}>A - Z</option>
                                    <option value="price" ${sort == 'price' ? 'selected' : ''}>Price Down</option>
                                    <option value="price1" ${sort == 'price1' ? 'selected' : ''}>Price Up</option>
                                </select>


                            </form>
                        </div>
                        <div class="sorting mr-auto">
                        </div>
                        <div class="pagination">
                            <c:if test="${numberPage > 6}">
                                <a href="category?page=${page == 1 ? page : page - 1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>

                                <a href="category?page=${1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="${page == 1 ? 'active' : ''}">${1}</a>
                                <a href="category?page=${2}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="${page == 2 ? 'active' : ''}">${2}</a>
                                <a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
                                <a href="category?page=${numberPage - 1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="${page == numberPage - 1 ? 'active' : ''}">${numberPage - 1}</a>
                                <a href="category?page=${numberPage}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="${page == numberPage ? 'active' : ''}">${numberPage}</a>
                                <a href="category?page=${page >= numberPage ? page : page + 1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                </c:if>
                                <c:if test="${numberPage <= 6}">
                                <a href="category?page=${page == 1 ? page : page - 1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                                    <c:forEach begin="1" end="${numberPage}" var="i">
                                    <a href="category?page=${i}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}${search != null ? "&search=" : ""}${search != null ? search : ""}" class="${page == i ? 'active' : ''}">${i}</a>
                                </c:forEach>
                                <a href="category?page=${page >= numberPage ? page : page + 1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                </c:if>
                        </div>
                    </div>
                    <!-- End Filter Bar -->
                    <!-- Start Best Seller -->
                    <section class="lattest-product-area pb-40 category-list">
                        <c:if test="${listByPage.size() == 0}">
                                
                                    <h3 class="text-center font-italic" style="color: red" >NO THING TO DISPLAY</h3>
                                

                        </c:if>
                        <div class="row">
                            <!-- single product -->
                            <c:if test="${listByPage.size() > 0}">
                                <c:forEach items="${listByPage}" var="c">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="single-product">
                                            <img class="img-fluid" src="${c.images.image1}" alt="">
                                            <div class="product-details">
                                                <a href="single-product?id=${c.productID}"><h6>${c.productName}</h6></a>
                                                <div class="price">
                                                    <h6>${c.priceFormat}&nbspVND</h6>

                                                </div>
                                                <div class="prd-bottom">

                                                    <a href="addtocarthome?id=${c.productID}&quantity=1&color=default&size=default" class="social-info">
                                                        <span class="ti-bag"></span>
                                                        <p class="hover-text">add to bag</p>
                                                    </a>


                                                    <a href="single-product?id=${c.productID}" class="social-info">
                                                        <span class="lnr lnr-move"></span>
                                                        <p class="hover-text">view more</p>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </c:if>
                            
                        </div>
                        <!-- single product -->

                    </section>
                    <!-- End Best Seller -->
                    <!-- Start Filter Bar -->
                    <div class="filter-bar d-flex flex-wrap align-items-center">
                        <div class="sorting mr-auto">

                        </div>
                        <div class="pagination">
                            <c:if test="${numberPage > 6}">
                                <a href="category?page=${page == 1 ? page : page - 1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>

                                <a href="category?page=${1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="${page == 1 ? 'active' : ''}">${1}</a>
                                <a href="category?page=${2}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="${page == 2 ? 'active' : ''}">${2}</a>
                                <a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
                                <a href="category?page=${numberPage - 1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="${page == numberPage - 1 ? 'active' : ''}">${numberPage - 1}</a>
                                <a href="category?page=${numberPage}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="${page == numberPage ? 'active' : ''}">${numberPage}</a>
                                <a href="category?page=${page >= numberPage ? page : page + 1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                </c:if>
                                <c:if test="${numberPage <= 6}">
                                <a href="category?page=${page == 1 ? page : page - 1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                                    <c:forEach begin="1" end="${numberPage}" var="i">
                                    <a href="category?page=${i}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}${search != null ? "&search=" : ""}${search != null ? search : ""}" class="${page == i ? 'active' : ''}">${i}</a>
                                </c:forEach>
                                <a href="category?page=${page >= numberPage ? page : page + 1}${cS != null ? "&cid=" : ""}${cS != null ? cS : ""}" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                </c:if>
                        </div>
                    </div>
                    <!-- End Filter Bar -->
                </div>
            </div>
        </div>

        <!-- Start related-product Area -->
        <section class="related-product-area section_gap">

        </section>
        <!-- End related-product Area -->

        <!-- start footer Area -->
        <footer class="footer-area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>About Us</h6>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore
                                magna aliqua.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>Newsletter</h6>
                            <p>Stay update with our latest</p>
                            <div class="" id="mc_embed_signup">

                                <form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                      method="get" class="form-inline">

                                    <div class="d-flex flex-row">

                                        <input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '"
                                               required="" type="email">


                                        <button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                                        <div style="position: absolute; left: -5000px;">
                                            <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                                        </div>

                                        <!-- <div class="col-lg-4 col-md-4">
                                                                        <button class="bb-btn btn"><span class="lnr lnr-arrow-right"></span></button>
                                                                </div>  -->
                                    </div>
                                    <div class="info"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget mail-chimp">
                            <h6 class="mb-20">Instragram Feed</h6>
                            <ul class="instafeed d-flex flex-wrap">
                                <li><img src="usercss/img/i1.jpg" alt=""></li>
                                <li><img src="usercss/img/i2.jpg" alt=""></li>
                                <li><img src="usercss/img/i3.jpg" alt=""></li>
                                <li><img src="usercss/img/i4.jpg" alt=""></li>
                                <li><img src="usercss/img/i5.jpg" alt=""></li>
                                <li><img src="usercss/img/i6.jpg" alt=""></li>
                                <li><img src="usercss/img/i7.jpg" alt=""></li>
                                <li><img src="usercss/img/i8.jpg" alt=""></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>Follow Us</h6>
                            <p>Let us be social</p>
                            <div class="footer-social d-flex align-items-center">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-behance"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
                    <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </footer>
        <!-- End footer Area -->

        <!-- Modal Quick Product View -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="container relative">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <div class="product-quick-view">
                        <div class="row align-items-center">
                            <div class="col-lg-6">
                                <div class="quick-view-carousel">
                                    <div class="item" style="background: url(usercss/css/img/organic-food/q1.jpg);">

                                    </div>
                                    <div class="item" style="background: url(usercss/css/img/organic-food/q1.jpg);">

                                    </div>
                                    <div class="item" style="background: url(usercss/css/img/organic-food/q1.jpg);">

                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="quick-view-content">
                                    <div class="top">
                                        <h3 class="head">Mill Oil 1000W Heater, White</h3>
                                        <div class="price d-flex align-items-center"><span class="lnr lnr-tag"></span> <span class="ml-10">$149.99</span></div>
                                        <div class="category">Category: <span>Household</span></div>
                                        <div class="available">Availibility: <span>In Stock</span></div>
                                    </div>
                                    <div class="middle">
                                        <p class="content">Mill Oil is an innovative oil filled radiator with the most modern technology. If you are
                                            looking for something that can make your interior look awesome, and at the same time give you the pleasant
                                            warm feeling during the winter.</p>
                                        <a href="#" class="view-full">View full Details <span class="lnr lnr-arrow-right"></span></a>
                                    </div>
                                    <div class="bottom">
                                        <div class="color-picker d-flex align-items-center">Color:
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                        </div>
                                        <div class="quantity-container d-flex align-items-center mt-15">
                                            Quantity:
                                            <input type="text" class="quantity-amount ml-15" value="1" />
                                            <div class="arrow-btn d-inline-flex flex-column">
                                                <button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
                                                <button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
                                            </div>

                                        </div>
                                        <div class="d-flex mt-20">
                                            <a href="#" class="view-btn color-2"><span>Add to Cart</span></a>
                                            <a href="#" class="like-btn"><span class="lnr lnr-layers"></span></a>
                                            <a href="#" class="like-btn"><span class="lnr lnr-heart"></span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <script src="usercss/js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.usercss/js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
        <script src="usercss/js/vendor/bootstrap.min.js"></script>
        <script src="usercss/js/jquery.ajaxchimp.min.js"></script>
        <script src="usercss/js/jquery.nice-select.min.js"></script>
        <script src="usercss/js/jquery.sticky.js"></script>
        <script src="usercss/js/nouislider.min.js"></script>
        <script src="usercss/js/jquery.magnific-popup.min.js"></script>
        <script src="usercss/js/owl.carousel.min.js"></script>
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="usercss/js/gmaps.min.js"></script>
        <script src="usercss/js/main.js"></script>
    </body>
</html>
