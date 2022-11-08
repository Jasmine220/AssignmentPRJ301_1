<%-- 
    Document   : recordattendance
    Created on : Oct 31, 2022, 4:38:07 PM
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
    <style>
        body{
            width: 90%;
            height: auto;
            margin-left: 5%;
        }
        /* table thead{
            display:
        } */
        table{
            width: 100%;
            height: auto;
            text-align: center;
            border: 1px solid gray;
        }
        th{
            text-transform: uppercase;
            height: 23px;
            background-color: #6b90da;
            font-weight: normal;
        }
        .slot{
            display: flex;
            gap: 10px;
        }
        td img{
            height: 15px;
            width: 15px;
        }
            .report {
        text-align: center;
        border-collapse: collapse;
    }

    .report th, .report td {
        border: 1px solid gray;
    }

    .report td {
        padding: 0.5rem 0.8rem;
    }
    </style>
    <body>
        <div class="header">
            <c:forEach items="${requestScope.group.sessions}" var="ses" begin="0" end="0">
                <tr>
                    <th>Subject: ${ses.group.subject.name}</th>
                <br/>
                <th>Sem: ${requestScope.group.sem} ${requestScope.group.year}</th>
                <br/>
                <th>Campus: FU-HL</th>
            </tr>
        </c:forEach>

    </div>
    <div class="content">
        <table class="report">
            <thead>
                <tr>
                    <th rowspan="2">NO</th>
                    <th rowspan="2">STUDENT ID</th>
                    <th rowspan="2">STUDENT NAME</th>
                    <th rowspan="2">GROUP NAME</th>
                    <th colspan="${requestScope.group.sessions.size()}">SLOT   
                    <th rowspan="2">SUMMARY</th>
                    <th rowspan="2">PERCENT ABSENT</th>
                </tr>
                <tr>
                    <c:forEach items="${requestScope.group.sessions}" var="ses" varStatus="loop">
                        <th>${loop.index + 1}</th>
                        </c:forEach>
                </tr>
            </thead>
            <tbody>
               
                <c:forEach items="${requestScope.group.students}" var="stu" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${stu.id}</td>
                        <td>${stu.name}</td>
                        <td>${requestScope.group.name}</td>
                        <c:set var="absent" value="0"></c:set>
                        <c:set var="noSessions" value="${requestScope.group.sessions.size()}"></c:set>
                        <c:forEach items="${requestScope.group.sessions}" var="ses">
                            <c:forEach items="${ses.atts}" var="att">
                                <c:if test="${att.student.id eq stu.id}">
                                    <c:choose>
                                        <c:when test="${att.present}">
                                            <td>P</td>

                                        </c:when>
                                        <c:when test="${!att.present}">
                                            <td>A</td>
                                            <c:set var="absent" value="${absent+1}"></c:set>
                                        </c:when> 
                                        <c:when test="${!ses.attanded}">
                                            <td>-</td>
                                        </c:when>
                                    </c:choose>
                                </c:if>
                            </c:forEach>

                        </c:forEach>

                        <td>${absent}/${noSessions}</td>

                        <c:if test="${absent/noSessions >= 0.2}">
                            <td style="color:red">
                                ${absent/noSessions*100}%
                            </td>
                        </c:if>
                        <c:if test="${absent/noSessions < 0.2}">
                            <td style="color:green">
                                ${absent/noSessions*100}%
                            </td>
                        </c:if>


                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
