<%-- 
    Document   : att
    Created on : Oct 16, 2022, 3:08:10 PM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;
            height: auto;
            width: 90%;
            margin-left: 5%;

        }
        h1{
            font-size: 40px;
            font-weight: lighter;
        }
        span{
            font-weight: bold;
        }
        table{
            height: 100%;
            width: 100%;
        }
        tr{
            vertical-align: top;
        }

        th{
            border-right: 1px solid #fff;
            text-align: left;
            padding: 2px;
            text-transform: uppercase;
            height: 23px;
            background-color: #6b90da;
            font-weight: normal;
        }
        img{
            height: 146px;
            width: 111px;
            border-width: 0px;
        }

        .image{
            display: flex;
            justify-content: center;
        }
        .group, .name{
            color: blue;
        }
        .code, .taker{
            color: #2F5597;
        }
    </style>
    <body>
        <div class="header">
            <h1>Single activity Attendance</h1>
            <p>
                Attendance for <span>${requestScope.ses.group.name}</span> with lecturer <span>${requestScope.ses.lecturer.id}</span> at
                slot ${requestScope.ses.slot.id} on ${requestScope.ses.slot.description} ${requestScope.ses.date}. Spring2022, in room ${requestScope.ses.room.id} at FU-HL
            </p>
            <p>Attended: <span style="color: red;"> ${requestScope.ses.attanded?"Yes":"No"} </span></p>
        </div>

        <div class="container">   
            <form action="takeatt" method="POST">
                <input type="hidden" name="sesid" value="${param.id}"/>
                <table>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>GROUP</th>
                            <th>CODE</th>
                            <th>NAME</th>
                            <th>IMAGE</th>
                            <th colspan="2">STATUS</th>
                            <th>COMMENT</th>
                            <th>TAKER</th>
                            <th>RECORD TIME</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${requestScope.ses.atts}" var="attendance" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td class="group">${attendance.session.group.id}</td>
                                <td class="code">${attendance.student.id}
                                    <input type="hidden" name="stdid" value="${attendance.student.id}"/>
                                </td>

                                <td class="name">${attendance.student.name}</td>
                                <td class="image"><img src="" alt=""></td>
                                <td>
                                    <input type="radio" 
                                           <c:if test="${attendance.present}">
                                               checked="checked"
                                           </c:if>
                                           name="present${attendance.student.id}"
                                           >
                                    <label>Absent</label>

                                </td>
                                <td>
                                    <input type="radio"
                                           <c:if test="${!attendance.present}">
                                               checked="checked";
                                           </c:if>
                                           name="present${attendance.student.id}"
                                           >
                                    <label>Present</label>
                                </td>
                                <td>
                                    <input type="text" name="description${attendance.student.id}" value="${attendance.description}">
                                </td>
                                <td>
                                    ${attendance.session.lecturer.id}
                                </td>
                                <td>
                                    ${attendance.record_time}
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
                <input type="submit" value="Save"/>
            </form>

        </div>

    </body>
</html>
