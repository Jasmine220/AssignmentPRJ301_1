<%-- 
    Document   : login
    Created on : Nov 4, 2022, 8:16:26 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login" method="POST">
            Username: <input type="text" name="username" placeholder="Username"/> <br/>
            Password: <input type="password" name="password" placeholder="Password"/> <br/>
<!--            <button  type="submit">Login</button>-->
<input type="submit" value="Login">
        </form>
    </body>
</html>
