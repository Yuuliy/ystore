<%-- 
    Document   : single-product
    Created on : Oct 18, 2022, 4:49:17 PM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/fav.png">
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
        <link rel="stylesheet" href="usercss/css/font-awesome.min.css">
        <link rel="stylesheet" href="usercss/css/themify-icons.css">
        <link rel="stylesheet" href="usercss/css/bootstrap.css">
        <link rel="stylesheet" href="usercss/css/owl.carousel.css">
        <link rel="stylesheet" href="usercss/css/nice-select.css">
        <link rel="stylesheet" href="usercss/css/nouislider.min.css">
        <link rel="stylesheet" href="usercss/css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="usercss/css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="usercss/css/main.css">
    </head>

    <body>

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
                        <h1>Product Details Page</h1>
                        <nav class="d-flex align-items-center">
                            <a href="home">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
                            <a href="single-product.html">product-details</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Single Product Area =================-->
        <div class="product_image_area">
            <div class="container">
                <div class="row s_product_inner">
                    <div class="col-lg-6">

                        <div class="single-prd-item">
                            <img class="img-fluid" src="${SingleProduct.images.image1}" alt="">
                        </div> 

                    </div>
                    <div class="col-lg-5 offset-lg-1">
                        <div class="s_product_text">
                            <h3>${SingleProduct.productName}</h3>
                            <h2>${SingleProduct.price}</h2>
                            <ul class="list">
                                <li><a class="active" href="#"><span>Category</span> : ${SingleProduct.categories.categoryName}</a></li>
                                <!--                                <li><a href="#"><span>Availibility</span> : In Stock</a></li>-->
                            </ul>
                            <p>${SingleProduct.categories.describe}</p>

                            <div class="card_area d-flex align-items-center">
                                <a class="primary-btn" href="addtocarthome?id=${SingleProduct.productID}&quantity=1&color=default&size=default">Add to Cart</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--================End Single Product Area =================-->

        <!--================Product Description Area =================-->
        <section class="product_description_area">
            <div class="container">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    Specification

                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>
                                            <h5>Type</h5>
                                        </td>
                                        <td>
                                            <h5>${SingleProduct.categories.categoryName}</h5>
                                        </td>
                                    </tr>                        
                                    <tr>
                                        <td>
                                            <h5>For</h5>
                                        </td>
                                        <td>
                                            <h5>${SingleProduct.categories.describe}</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Size</h5>
                                        </td>
                                        <td>
                                            <h5>${SingleProduct.size.size1} - ${SingleProduct.size.size4}</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Insurance</h5>
                                        </td>
                                        <td>
                                            <h5>${SingleProduct.insurance} month</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Producer</h5>
                                        </td>
                                        <td>
                                            <h5>${SingleProduct.producer.producerName}</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>From</h5>
                                        </td>
                                        <td>
                                            <h5>${SingleProduct.producer.country}</h5>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                    </div>

                </div>
            </div>
        </section>
        <!--================End Product Description Area =================-->

        <section class="related-product-area section_gap_bottom">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 text-center">
                        <div class="section-title">
                            <h1>Anorther Product</h1>                            
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="ctg-right">
                            <a href="#" target="_blank">
                                <img class="img-fluid d-block mx-auto" src="" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="row">
                            <c:forEach items="${list1}" var="c">
                                <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                    <div class="single-related-product d-flex">
                                        <a href="#"><img src="${c.images.image1}" style="width: 70px;height: 70px;" alt=""></a>
                                        <div class="desc">
                                            <a href="single-product?id=${c.productID}" class="title">${c.productName}</a>
                                            <div class="price">
                                                <h6>${c.priceFormat}&nbspVND</h6>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-lg-1">
                        <div class="ctg-right">
                            <a href="#" target="_blank">
                                <img class="img-fluid d-block mx-auto" src="" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
                                <li><img src="img/i1.jpg" alt=""></li>
                                <li><img src="img/i2.jpg" alt=""></li>
                                <li><img src="img/i3.jpg" alt=""></li>
                                <li><img src="img/i4.jpg" alt=""></li>
                                <li><img src="img/i5.jpg" alt=""></li>
                                <li><img src="img/i6.jpg" alt=""></li>
                                <li><img src="img/i7.jpg" alt=""></li>
                                <li><img src="img/i8.jpg" alt=""></li>
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

        <script src="usercss/js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
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
