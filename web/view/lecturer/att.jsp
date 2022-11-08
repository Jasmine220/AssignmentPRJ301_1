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
            <p>Subject: <span>${requestScope.ses.group.subject.name}</span></p>
            <p>Group: <span>${requestScope.ses.group.name}</span> </p>
            <p>Lecturer: <span>${requestScope.ses.lecturer.name}</span> </p>
            <p>Slot: <span>${requestScope.ses.slot.id}</span> on <span>${requestScope.ses.slot.description}</span> at <span>${requestScope.ses.date} </span>.</p>
            <p>Room: <span>${requestScope.ses.room.name}</span></p>          
            <p>Attended: <span style="color: red;"> ${requestScope.ses.attanded?"Yes":"No"} </span></p>
        </div>

        <div class="container">   
            <form action="attandance" method="POST">
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
                                    <c:if test="${flagDate == 1}">
                                        <input type="radio" disabled="true"
                                           <c:if test="${attendance.present}">
                                               checked="checked"
                                           </c:if>
                                           name="present${attendance.student.id}"
                                           >
                                    <label>Absent</label>
                                    </c:if>
                                    
                                    <c:if test="${flagDate == 0}">
                                        <input type="radio"
                                           <c:if test="${attendance.present}">
                                               checked="checked"
                                           </c:if>
                                           name="present${attendance.student.id}"
                                           value="absent"
                                           >
                                    <label>Absent</label>
                                    </c:if>

                                </td>
                                <td>
                                    <c:if test="${flagDate == 1}">
                                        <input type="radio" disabled="true"
                                           <c:if test="${!attendance.present}">
                                               checked="checked";
                                           </c:if>
                                           name="present${attendance.student.id}"
                                           >
                                    <label>Present</label>
                                    </c:if>
                                    <c:if test="${flagDate == 0}">
                                        <input type="radio"
                                           <c:if test="${!attendance.present}">
                                               checked="checked";
                                           </c:if>
                                           name="present${attendance.student.id}"
                                           value="present"
                                           >
                                    <label>Present</label>
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${flagDate == 1}">
                                        <input disabled="true" type="text" name="description${attendance.student.id}" value="${attendance.description}">
                                    </c:if>
                                    <c:if test="${flagDate == 0}">
                                    <input type="text" name="description${attendance.student.id}" value="${attendance.description}">
                                    </c:if>
                                </td>
                                <td>
                                    ${attendance.session.lecturer.name}
                                </td>
                                <td>
                                    ${attendance.record_time}
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
                <c:if test="${flagDate == 1}">
                    <a href="timetable">Back</a>
                </c:if>
                <c:if test="${flagDate == 0}">
                    <a href="timetable">Back</a>
                    <input type="submit" value="Save"/>
                </c:if>
                
            </form>

        </div>

    </body>
</html>
