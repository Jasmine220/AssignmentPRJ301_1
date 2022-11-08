

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
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
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
            margin-bottom: 3%;
            
        }
        #campus{
            color: #808080;
        }
        table tr th{
            background-color: #6b90da;
            border: 1px solid gray;
        }
        table tr{
            border: 1px solid graytext;
        }
        .weekdays{
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
         </div>
        </form>
   

    <div class="container">
        <div class="table-responsive">
            <table border="(0.5)px solid lightgray">
                <tr>
                    <th class="weekdays">
                        <strong>WEEKDAYS</strong>

                    </th>
                    <c:forEach items="${requestScope.dates}" var="d">       
                        <th>${helper.getDayNameofWeek(d)}</th>
                        </c:forEach>

                </tr>
                <br>
                <tr>
                    <th class="weekdays" >
                        DAY
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
                                    <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.slot.id eq slot.id)}">
                                        <a href="attandance?id=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                        <br/>
                                        at ${ses.room.name}
                                        <br/>
                                        
                                        <a href="recordattendance?subid=${ses.group.subject.id}&lid=${ses.lecturer.id}&gid=${ses.group.id}">Status</a>
                                        <c:if test="${ses.attanded}">
                                            <div class="attendance attended">
                                                (Attended)
                                            </div>
                                        </c:if>
                                        <c:if test="${!ses.attanded}">
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
