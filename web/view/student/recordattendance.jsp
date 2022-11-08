<%-- 
    Document   : recordattendance
    Created on : Nov 7, 2022, 7:56:53 PM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style >
            .style1 {
                font-weight: bold;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h1><span>FPT University Academic Portal</span></h1>
                </div>
                <div class="col-md-4">
                    <table>
                        <tr>
                            <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                        </tr>
                        <tr>
                            <td><a href="https://apps.apple.com/app/id1527723314">
                                    <img src="https://fap.fpt.edu.vn/images/app-store.svg" style="width: 120px; height: 40px" alt="apple store" /></a></td>
                            <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                    <img src="https://fap.fpt.edu.vn/images/play-store.svg" style="width: 120px; height: 40px" alt="google store" /></a></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="row">

                <div class="col-md-12">
                    <h2>View attendance for <span id="ctl00_mainContent_lblStudent">${sessionScope.account.displayname} (${sessionScope.account.username})</span></h2>
                    <h3>Select a  course ...</h3>
                    <table summary='Select a course'>
                        <thead>
                            <tr>
                                <th scope='col'>Term</th>
                                <th scope='col'>Course</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach items="${requestScope.groups}" var="g">
                                <tr>  
                                    <td>${g.sem}${g.year}</td>
                                    <td ><a style="display: block" href="recordattendance?subid=${g.subject.id}&stdid=${account.id}">${g.subject.name}<br> 
                                        </a>
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <h3>... then see report<br /></h3>
                    <table class="report">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Date</th>
                                <th>Slot</th>
                                <th>Room</th>
                                <th>Lecturer</th>
                                <th>Group Name</th>
                                <th>Attendance status</th>
                                <th>Lecturer's comment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="absent" value="0"></c:set>
                            <c:set var="noSessions" value="${requestScope.sessions.size()}"></c:set>
                            <c:forEach items="${requestScope.sessions}" var="ses" varStatus="loop">
                                <tr>
                                    <td>${loop.index+1}</td>
                                    <td><span class='label label-primary'>${ses.date}</span></td>
                                    <td>
                                        <span class='label label-danger'>${ses.slot.id}_(${ses.slot.description})</span>
                                    </td>
                                    <td>${ses.room.name}</td>
                                    <td>${ses.lecturer.name}</td>
                                    <td>${ses.group.name}</td>

                                    <c:if test="${ses.attanded}">
                                        <c:if test="${ses.atts.get(0).present}">
                                            <td>
                                                <font color="green">Present</font>
                                            </td>
                                        </c:if>
                                        <c:if test="${!ses.atts.get(0).present}">
                                            <td>
                                                <font color="red">Absent</font>
                                            </td>
                                            <c:set var="absent" value="${absent+1}"></c:set>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${ses.attanded eq false}">
                                        <td>
                                            <font color="black">Future</font>
                                        </td>
                                    </c:if>
                                    <td>${ses.atts.get(0).description}</td>
                                </tr>
                            </c:forEach>

                        </tbody>


                    </table>
                    <div colspan='7'>
                        <b>Absent</b>:
                        <c:if test="${absent/noSessions >= 0.2}">

                            <div style="color:red" >
                                ${absent/noSessions*100}%
                            </div>
                        </c:if>
                        <c:if test="${absent/noSessions < 0.2}">
                            <div style="color:green" >
                                ${absent/noSessions*100}%
                            </div>
                        </c:if> % absent so far (${absent} absent on ${noSessions} total).
                    </div>
                </div>
            </div>
        </div>
    </body>

    <style>
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
</html>
