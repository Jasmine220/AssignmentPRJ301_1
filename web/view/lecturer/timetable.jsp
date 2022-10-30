<%-- 
    Document   : timetable
    Created on : Oct 15, 2022, 9:30:31 AM
    Author     : Ngo Tung Son
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>

        .header{
            text-align: center;
            margin-top: 1rem;
        }
        table{
            margin-left: 2%;
            width: 95%;
            height: 100%;
        }
        #campus{
            color: #808080;
        }
        .table tr th{
            background-color: #6b90da;
            border: 1px solid white;
        }
        .table tr{
             border: 1px solid graytext;
        }
        .week{
            display: flex;
        }
        .container {
            margin-top: 1rem;
        }
        .attendance{
            display: flex;
        }
        .attended{
            color: #1a8a25;
        }
        /* .not-yet{
         color: red;
         } */
        .attendance input{
            border: 0px;
            color: white;
            background-color: #5bc0de;
            border-radius: 4px;
        }
        .time-slot input{
            background-color:#5cbc6a;
            border: 0px;
            color: white;
            border-radius: 4px;
        }
        .swp input{
            background-color: #337ab7;
        }
        table tr td a{
            text-decoration: none;
            color: #348fcf;
            height: auto;
            width: 30% ;
        }
        body{
            margin: 0;
            height: 100% ;
            width: 100% ;
        }
    </style>
    <body>
        <form action="timetable" method="GET">
            <div class="header">
                <!-- <div class="campus"> -->
                <label for="">Campus:</label>
                <select name="campus" id="campus">
                    <option value="select-campus">Select Campus</option>
                    <option value="fu-hl">FU-HL</option>
                    <option value="fu-hcm">FU-HCM</option>
                    <option value="fu-dn">FU-DN</option>
                    <option value="fu-ct">FU-CT</option>
                    <option value="fu-qn">FU-QN</option>
                </select>
                <br />
                <!-- </div> -->
                <!-- <div class="lecturer"> -->
                <label for="">Lecturer:</label>
                <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/>
                <input type="hidden" name="lid" value="${param.lid}"/>
                <label for="">From:</label>
                <input type="date" name="from" value="${requestScope.from}"/>
                <label for="">To:</label>
                <input type="date" name="to" value="${requestScope.to}"/>
                <input type="submit" value="View" />
                <!-- </div> -->
        </form>
    </div>

    <div class="container">
        <div class="table-responsive">
            <table class="table">
                <tr>
                    <th class="year">
                        <strong>YEAR:</strong>
                        <select>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                        </select>
                    </th>
                    <c:forEach items="${requestScope.dates}" var="d">       
                        <th>${helper.getDayNameofWeek(d)}</th>
                        </c:forEach>

                </tr>
                <br>
                <tr>
                    <th class="week" >
                        WEEK:<select>
                            <option value="17/01-to-23/01">17/01 To 23/01</option>
                            <option value="25/01-to-31/1">25/01 To 31/01</option>
                            <option value="02/02-to-08/02">02/02 To 08/02</option>
                            <option value="10/02-to-16/02">10/02 To 16/02</option>
                            <option value="17/02-to-23/02">17/02 To 23/02</option>
                        </select>
                    </th>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <th>
                            <fmt:formatDate pattern="dd-MM" value="${d}"/>
                        </th>
                    </c:forEach>
                </tr>

                <c:forEach items="${requestScope.slots}" var="slot">
                    <tr>
                        <td>Slot${slot.id}
                            <div class="time-slot">
                                <input type="button" value="${slot.description}" />
                            </div>
                        </td>
                        <c:forEach items="${requestScope.dates}" var="d">
                            <td>
                                <c:forEach items="${requestScope.sessions}" var="ses" >
                                    <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                        <a href="att?id=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                        <br/>
                                        ${ses.room.name}
                                        <c:if test="${ses.attandated}">
                                            <div class="attendance attended">
                                                (Attended)
                                            </div>
                                        </c:if>
                                        <c:if test="${!ses.attandated}">
                                            <div class="attendance not-yet">
                                                (<font color="red">Not yet</font>)
                                            </div>
                                        </c:if>
                                    </c:if>

                                </c:forEach>
                            </td>
                            

                        </c:forEach>
                    </tr>
                </c:forEach>              
            </table>
        </div>
    </div>

    <!-- JavaScript Bundle with Popper -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"
    ></script>
</body>
</html>
