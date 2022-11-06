<%-- 
    Document   : home
    Created on : Nov 4, 2022, 9:44:35 PM
    Author     : Administrator
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>LECTURER</h1>
        <c:if test="${sessionScope.account ne null}">
            Hello ${sessionScope.account.displayname} 
            click <a href="logout">here</a> to logout
        </c:if>
        <c:if test="${sessionScope.account eq null}">
            You are not logged in yet
        </c:if>
    </body>
</html>
