<%-- 
    Document   : header
    Created on : Feb 25, 2020, 12:33:11 PM
    Author     : Jisoo
--%>

<%@page import="Entity.User"%>
<%@page import="Model.UserModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>Header</title>
    </head>
    <body>
        <div class="header">
            <ul>
                <li><img src="images\avs_logo.png" /></li>
                <li id="hover" onclick="document.location = '/AVS/HomeController'">Home</li>
                <li id="hover">News</li>
                <li>
                    <form id="account">
                        <% String usern = "";
                            if (session.getAttribute("username") != null) {
                                usern = (String) session.getAttribute("username");
                                UserModel useracountmanagement = new UserModel();
                                User users = useracountmanagement.getUserByUsername(usern);
                                usern = users.getUsername();
                        %>
                        <a id="userName">Hello,<%=usern%></a><img  src="images\user.png" />

                        <button id="logout" onclick="document.location = '/AVS/LogoutController';return false">Log out</button>
                        <!--                        <div class="dropdown">
                                                    <p>Hello,<span><%=usern%></span></p>
                                                    <a href="JavaScript:myFunction()"> <img class="dropbtn"  src="images\user.png" /></a>
                                                    <div id="myDropdown" class="dropdown-content">
                                                        <a href="#">Link 1</a>
                                                        <a href="#">Link 2</a>
                                                        <a href="#">Link 3</a>
                                                    </div>
                                                </div>-->
                        <%} else {%>
                        <button onclick="document.location = '/AVS/LoginController';return false">Sign in</button>
                        <button>Sign Up</button><%}%>
                    </form>
                </li>
                <li id="loginButton">
                    <form id="search">
                        <input type="text" placeholder="  Search.." name="search">
                        <button type="submit">Submit</button>
                    </form>
                </li>
            </ul>
        </div>
    </body>
</html>
