<%-- 
    Document   : login
    Created on : Feb 24, 2020, 8:15:14 PM
    Author     : BinhNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
//   if (session.getAttribute("username")!=null) {
//          String  usern=(String) session.getAttribute("username");
//       }
%>
<!DOCTYPE html>
<html> <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/style.css" />
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id" content="912620741556-58chb0o18k50h03oblr4gr5t8vrqi139.apps.googleusercontent.com">
        <title>AVS</title>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="banner">
            <h1>Welcome to Algorithm Visualize System</h1>
            <h5>The noblest pleasure is the joy of understanding</h5>
        </div>
        <div class="main">
                <form class="box" action="LoginController" method="post">
                    <h1><b>Login</b></h1>
                    <input id="infor" type="text" name="username" placeholder="Username"/></br>
                    <input id="infor" type="password" name="password" placeholder="Password"/></br> 
                    <%if (request.getAttribute("errorMessage") != null) {
                    %>
                    <p> <%=request.getAttribute("errorMessage")%></p>
                    <%
                        }
                    %>
                    <input id="log" type="submit"  value="LOGIN" />
                    <hr>
                    <h4>Or</h4>
                    <div id="gg" class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
                    <hr>
                    <h4>Don't have an account</h4>

                    <input id="sign" type="submit"  value="Register" />
                    <!--  <input type="submit" name="" value="Login">-->
                </form>
            </div>

        <%@include file="footer.jsp" %>
        <script type="text/javascript" src="js/code.js"></script>
    </body>
</html>
