<%-- 
    Document   : login
    Created on : 22-09-2022, 19:35:52

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="admincss/assets/img/favicon.ico">
        <title>Admin Login</title>
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="admincss/assets/css/style.css">
    </head>

    <body>
        <div class="main-wrapper account-wrapper">
            <div class="account-page">
                <div class="account-center">
                    <div class="account-box">
                        <form action="admin-login" method="post" class="form-signin">
                            <div class="account-logo">
                                <a href="admin-login"><img src="" alt=""></a><!-- admincss/assets/img/logo-website.png -->
                            </div>
                            <c:if test="${requestScope.errorLogin != null}">
                                <div class="form-group">
                                    <h5 style="color: red; text-align: center; font-family: unset">${requestScope.loginError}</h5>
                                </div>
                            </c:if>
                            <div class="form-group">
                                <label>Username or Email</label>
                                <input type="text" name="user" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" name="pass" class="form-control">
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary account-btn">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="admincss/assets/js/jquery-3.2.1.min.js"></script>
        <script src="admincss/assets/js/popper.min.js"></script>
        <script src="admincss/assets/js/bootstrap.min.js"></script>
        <script src="admincss/assets/js/app.js"></script>
    </body>
</html>
