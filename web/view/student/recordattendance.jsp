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
                    <form name="aspnetForm" method="post" action="./ViewAttendstudent.aspx" id="aspnetForm">
                        <h2>View attendance for <span id="ctl00_mainContent_lblStudent">${sessionScope.account.displayname} (${sessionScope.account.username})</span></h2>

                        <td valign="top">
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
                        </td>

                        <td valign='top'><h3>... then see report<br /></h3>
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
                                    <c:set var="noSessions" scope = "session" value="${requestScope.group.sessions.size()}">              
                                    </c:set>
                                    <% int absent = 0;
                            
                                    %>
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
                                                        <%absent++;%>
                                                    </td>
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
                                <tfoot>
                                    <tr>
                                        <td colspan='7'><b>Absent</b>: <%out.print((float)absent/30*100);%>% absent so far (<%out.print(absent);%> absent on 30 total).</td>
                                    </tr>
                                </tfoot> 
                            </table>
                        </td>

                    </form>

                </div>


                </td>
                </tr>
                <tr style="border-bottom: 0 none">
                    <td>
                        <br />
                        <table width="100%" style="border: 1px solid transparent;" id="cssTable">
                            <tr>
                                <td>
                                    <div id="ctl00_divSupport">
                                        <br />
                                        <b>Mọi góp ý, thắc mắc xin liên hệ: </b><span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Phòng dịch vụ sinh viên</span>: Email: <a href="/cdn-cgi/l/email-protection#64000d070c1211170d0a0c120d010a2402014a0100114a120a"><span class="__cf_email__" data-cfemail="b9ddd0dad1cfcccad0d7d1cfd0dcd7f9dfdc97dcddcc97cfd7">[email&#160;protected]</span></a>.
                                        Điện thoại: <span class="style1" style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">(024)7308.13.13 </span>
                                        <br />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="text-align: center">
                                        © Powered by <a href="http://fpt.edu.vn" target="_blank">FPT University</a>&nbsp;|&nbsp;
                                        <a href="http://cms.fpt.edu.vn/" target="_blank">CMS</a>&nbsp;|&nbsp; <a href="http://library.fpt.edu.vn" target="_blank">library</a>&nbsp;|&nbsp; <a href="http://library.books24x7.com" target="_blank">books24x7</a>
                                        <span id="ctl00_lblHelpdesk"></span>
                                    </p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </table>
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
