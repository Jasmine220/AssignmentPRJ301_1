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
        <link rel="Stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" type="text/css" />
        <link rel="Stylesheet" href="../fu.css" type="text/css" />
        <link rel="Stylesheet" href="../JavaScript/jquery.css" type="text/css" />
        <link rel="Stylesheet" href="../JavaScript/jquery-ui.css" type="text/css" />
        <link rel="Stylesheet" href="../JavaScript/jquery.alerts.css" type="text/css" />

        <link rel="Stylesheet" href="../Content/bootstrap.css" type="text/css" />
        <link rel="Stylesheet" href="../Content/bootstrap.min.css" type="text/css" />
        <link rel="Stylesheet" href="../Content/bootstrap-theme.min.css" type="text/css" />
        <style type="text/css">
            .style1 {
                font-weight: bold;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <!--            <div class="row">
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
                        </div>-->

            <div class="row">
                <div class="col-md-12">
                    <form name="aspnetForm" method="post" action="./ViewAttendstudent.aspx" id="aspnetForm">
                                                <div>
                                                    <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTczMjcwMjg4Mw9kFgJmD2QWAgIDD2QWCAIBDxYCHgdWaXNpYmxlZxYEAgEPDxYCHgRUZXh0BQ90cmFuZ2R0aGUxNjE4MDRkZAIDDw8WAh8BBRggQ0FNUFVTOiBGUFRVLUjDsmEgTOG6oWNkZAIDDw8WAh8BBQ08Yj4mbmJzcDs8L2I+ZGQCBQ9kFgoCAQ8PFgIfAQUmxJDhurduZyBUaHXhu7MgVHJhbmcgKFRyYW5nRFRIRTE2MTgwNClkZAIFDxYCHglpbm5lcmh0bWwFLTx0YWJsZT48dHI+PHRkPjxiPkZVLUhMPC9iPjwvdGQ+PC90cj48L3RhYmxlPmQCBw8WAh8CBaYJPHRhYmxlPjx0cj48dGQ+PGEgaHJlZj0iP2lkPUhFMTYxODA0JmNhbXB1cz0zJnRlcm09MTgiPlN1bW1lcjIwMTc8L2E+PC90ZD48L3RyPjx0cj48dGQ+PGEgaHJlZj0iP2lkPUhFMTYxODA0JmNhbXB1cz0zJnRlcm09MTkiPkZhbGwyMDE3PC9hPjwvdGQ+PC90cj48dHI+PHRkPjxhIGhyZWY9Ij9pZD1IRTE2MTgwNCZjYW1wdXM9MyZ0ZXJtPTIwIj5TcHJpbmcyMDE4PC9hPjwvdGQ+PC90cj48dHI+PHRkPjxhIGhyZWY9Ij9pZD1IRTE2MTgwNCZjYW1wdXM9MyZ0ZXJtPTIxIj5TdW1tZXIyMDE4PC9hPjwvdGQ+PC90cj48dHI+PHRkPjxhIGhyZWY9Ij9pZD1IRTE2MTgwNCZjYW1wdXM9MyZ0ZXJtPTIyIj5GYWxsMjAxODwvYT48L3RkPjwvdHI+PHRyPjx0ZD48YSBocmVmPSI/aWQ9SEUxNjE4MDQmY2FtcHVzPTMmdGVybT0yMyI+U3ByaW5nMjAxOTwvYT48L3RkPjwvdHI+PHRyPjx0ZD48YSBocmVmPSI/aWQ9SEUxNjE4MDQmY2FtcHVzPTMmdGVybT0yNCI+U3VtbWVyMjAxOTwvYT48L3RkPjwvdHI+PHRyPjx0ZD48YSBocmVmPSI/aWQ9SEUxNjE4MDQmY2FtcHVzPTMmdGVybT0yNSI+RmFsbDIwMTk8L2E+PC90ZD48L3RyPjx0cj48dGQ+PGEgaHJlZj0iP2lkPUhFMTYxODA0JmNhbXB1cz0zJnRlcm09MjYiPlNwcmluZzIwMjA8L2E+PC90ZD48L3RyPjx0cj48dGQ+PGEgaHJlZj0iP2lkPUhFMTYxODA0JmNhbXB1cz0zJnRlcm09MjciPlN1bW1lcjIwMjA8L2E+PC90ZD48L3RyPjx0cj48dGQ+PGEgaHJlZj0iP2lkPUhFMTYxODA0JmNhbXB1cz0zJnRlcm09MjgiPkZhbGwyMDIwPC9hPjwvdGQ+PC90cj48dHI+PHRkPjxhIGhyZWY9Ij9pZD1IRTE2MTgwNCZjYW1wdXM9MyZ0ZXJtPTI5Ij5TcHJpbmcyMDIxPC9hPjwvdGQ+PC90cj48dHI+PHRkPjxhIGhyZWY9Ij9pZD1IRTE2MTgwNCZjYW1wdXM9MyZ0ZXJtPTMwIj5TdW1tZXIyMDIxPC9hPjwvdGQ+PC90cj48dHI+PHRkPjxhIGhyZWY9Ij9pZD1IRTE2MTgwNCZjYW1wdXM9MyZ0ZXJtPTMxIj5GYWxsMjAyMTwvYT48L3RkPjwvdHI+PHRyPjx0ZD48YSBocmVmPSI/aWQ9SEUxNjE4MDQmY2FtcHVzPTMmdGVybT0zMiI+U3ByaW5nMjAyMjwvYT48L3RkPjwvdHI+PHRyPjx0ZD48YSBocmVmPSI/aWQ9SEUxNjE4MDQmY2FtcHVzPTMmdGVybT0zMyI+U3VtbWVyMjAyMjwvYT48L3RkPjwvdHI+PHRyPjx0ZD48Yj5GYWxsMjAyMjwvYj48L3RkPjwvdHI+PC90YWJsZT5kAgkPFgIfAgWEBTx0YWJsZT48dHI+PHRkPjxiPlN0YXRpc3RpY3MgYW5kIFByb2JhYmlsaXR5KE1BUzI5MSkoU0UxNjQzLHN0YXJ0IDA1LzA5LzIwMjIpPC9iPjwvdGQ+PC90cj48dHI+PHRkPjxhIGhyZWY9Ij9pZD1IRTE2MTgwNCZjYW1wdXM9MyZ0ZXJtPTM3JmNvdXJzZT0yNzQxOSI+SmF2YSBXZWIgQXBwbGljYXRpb24gRGV2ZWxvcG1lbnQoUFJKMzAxKTwvYT4oU0UxNjQzLHN0YXJ0IDA1LzA5LzIwMjIpPC90ZD48L3RyPjx0cj48dGQ+PGEgaHJlZj0iP2lkPUhFMTYxODA0JmNhbXB1cz0zJnRlcm09MzcmY291cnNlPTI3NTIxIj5FbGVtZW50YXJ5IEphcGFuZXNlIDEtQTEuMihKUEQxMjMpPC9hPihTRTE2NDMsc3RhcnQgMDYvMDkvMjAyMik8L3RkPjwvdHI+PHRyPjx0ZD48YSBocmVmPSI/aWQ9SEUxNjE4MDQmY2FtcHVzPTMmdGVybT0zNyZjb3Vyc2U9MjgwODQiPkludHJvZHVjdGlvbiB0byBTb2Z0d2FyZSBFbmdpbmVlcmluZyhTV0UyMDFjKTwvYT4oU0UxNjM5LHN0YXJ0IDE3LzA5LzIwMjIpPC90ZD48L3RyPjx0cj48dGQ+PGEgaHJlZj0iP2lkPUhFMTYxODA0JmNhbXB1cz0zJnRlcm09MzcmY291cnNlPTI3NzAwIj5JbnRlcm5ldCBvZiBUaGluZ3MoSU9UMTAyKTwvYT4oU0UxNjQzLHN0YXJ0IDEwLzEwLzIwMjIpPC90ZD48L3RyPjwvdGFibGU+ZAILDxYCHwIFrD0gPHRkIHZhbGlnbj0ndG9wJz48aDM+Li4uIHRoZW4gc2VlIHJlcG9ydDxiciAvPjxiciAvPjwvaDM+PHRhYmxlIGNsYXNzPSd0YWJsZSB0YWJsZS1ib3JkZXJlZCB0YWJsZTEnPjx0cj48dGhlYWQ+IDx0aD5Oby48L3RoPjx0aD5EYXRlPC90aD48dGg+U2xvdDwvdGg+PHRoPlJvb208L3RoPjx0aD5MZWN0dXJlcjwvdGg+PHRoPkdyb3VwIE5hbWU8L3RoPjx0aD5BdHRlZGFuY2Ugc3RhdHVzPC90aD48dGg+TGVjdHVyZXIncyBjb21tZW50PC90aD48L3RyPjwvdGhlYWQ+PHRib2R5Pjx0cj48dGQ+MTwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1wcmltYXJ5Jz5Nb25kYXkgMDUvMDkvMjAyMjwvc3Bhbj48L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtZGFuZ2VyJz4zXygxMDo1MC0xMjoyMCk8L3NwYW4+PC90ZD48dGQ+REUtQzIwNTwvdGQ+PHRkPkFuaE5WNjQ8L3RkPjx0ZD5TRTE2NDM8L3RkPjx0ZD48Zm9udCBjb2xvcj1ncmVlbj5QcmVzZW50PC9mb250PjwvdGQ+PHRkPjwvdGQ+PC90cj48dHI+PHRkPjI8L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtcHJpbWFyeSc+V2VkbmVzZGF5IDA3LzA5LzIwMjI8L3NwYW4+PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLWRhbmdlcic+M18oMTA6NTAtMTI6MjApPC9zcGFuPjwvdGQ+PHRkPkRFLUMyMDU8L3RkPjx0ZD5BbmhOVjY0PC90ZD48dGQ+U0UxNjQzPC90ZD48dGQ+PGZvbnQgY29sb3I9Z3JlZW4+UHJlc2VudDwvZm9udD48L3RkPjx0ZD48L3RkPjwvdHI+PHRyPjx0ZD4zPC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLXByaW1hcnknPkZyaWRheSAwOS8wOS8yMDIyPC9zcGFuPjwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1kYW5nZXInPjNfKDEwOjUwLTEyOjIwKTwvc3Bhbj48L3RkPjx0ZD5ERS1DMjA1PC90ZD48dGQ+QW5oTlY2NDwvdGQ+PHRkPlNFMTY0MzwvdGQ+PHRkPjxmb250IGNvbG9yPWdyZWVuPlByZXNlbnQ8L2ZvbnQ+PC90ZD48dGQ+PC90ZD48L3RyPjx0cj48dGQ+NDwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1wcmltYXJ5Jz5Nb25kYXkgMTIvMDkvMjAyMjwvc3Bhbj48L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtZGFuZ2VyJz4zXygxMDo1MC0xMjoyMCk8L3NwYW4+PC90ZD48dGQ+REUtQzIwNTwvdGQ+PHRkPkFuaE5WNjQ8L3RkPjx0ZD5TRTE2NDM8L3RkPjx0ZD48Zm9udCBjb2xvcj1ncmVlbj5QcmVzZW50PC9mb250PjwvdGQ+PHRkPjwvdGQ+PC90cj48dHI+PHRkPjU8L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtcHJpbWFyeSc+V2VkbmVzZGF5IDE0LzA5LzIwMjI8L3NwYW4+PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLWRhbmdlcic+M18oMTA6NTAtMTI6MjApPC9zcGFuPjwvdGQ+PHRkPkRFLUMyMDU8L3RkPjx0ZD5BbmhOVjY0PC90ZD48dGQ+U0UxNjQzPC90ZD48dGQ+PGZvbnQgY29sb3I9Z3JlZW4+UHJlc2VudDwvZm9udD48L3RkPjx0ZD48L3RkPjwvdHI+PHRyPjx0ZD42PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLXByaW1hcnknPkZyaWRheSAxNi8wOS8yMDIyPC9zcGFuPjwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1kYW5nZXInPjNfKDEwOjUwLTEyOjIwKTwvc3Bhbj48L3RkPjx0ZD5ERS1DMjA1PC90ZD48dGQ+QW5oTlY2NDwvdGQ+PHRkPlNFMTY0MzwvdGQ+PHRkPjxmb250IGNvbG9yPWdyZWVuPlByZXNlbnQ8L2ZvbnQ+PC90ZD48dGQ+PC90ZD48L3RyPjx0cj48dGQ+NzwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1wcmltYXJ5Jz5Nb25kYXkgMTkvMDkvMjAyMjwvc3Bhbj48L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtZGFuZ2VyJz4zXygxMDo1MC0xMjoyMCk8L3NwYW4+PC90ZD48dGQ+REUtQzIwNTwvdGQ+PHRkPkFuaE5WNjQ8L3RkPjx0ZD5TRTE2NDM8L3RkPjx0ZD48Zm9udCBjb2xvcj1ncmVlbj5QcmVzZW50PC9mb250PjwvdGQ+PHRkPjwvdGQ+PC90cj48dHI+PHRkPjg8L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtcHJpbWFyeSc+V2VkbmVzZGF5IDIxLzA5LzIwMjI8L3NwYW4+PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLWRhbmdlcic+M18oMTA6NTAtMTI6MjApPC9zcGFuPjwvdGQ+PHRkPkRFLUMyMDU8L3RkPjx0ZD5BbmhOVjY0PC90ZD48dGQ+U0UxNjQzPC90ZD48dGQ+PGZvbnQgY29sb3I9Z3JlZW4+UHJlc2VudDwvZm9udD48L3RkPjx0ZD48L3RkPjwvdHI+PHRyPjx0ZD45PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLXByaW1hcnknPkZyaWRheSAyMy8wOS8yMDIyPC9zcGFuPjwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1kYW5nZXInPjNfKDEwOjUwLTEyOjIwKTwvc3Bhbj48L3RkPjx0ZD5ERS1DMjA1PC90ZD48dGQ+QW5oTlY2NDwvdGQ+PHRkPlNFMTY0MzwvdGQ+PHRkPjxmb250IGNvbG9yPWdyZWVuPlByZXNlbnQ8L2ZvbnQ+PC90ZD48dGQ+PC90ZD48L3RyPjx0cj48dGQ+MTA8L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtcHJpbWFyeSc+TW9uZGF5IDI2LzA5LzIwMjI8L3NwYW4+PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLWRhbmdlcic+M18oMTA6NTAtMTI6MjApPC9zcGFuPjwvdGQ+PHRkPkRFLUMyMDU8L3RkPjx0ZD5BbmhOVjY0PC90ZD48dGQ+U0UxNjQzPC90ZD48dGQ+PGZvbnQgY29sb3I9Z3JlZW4+UHJlc2VudDwvZm9udD48L3RkPjx0ZD48L3RkPjwvdHI+PHRyPjx0ZD4xMTwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1wcmltYXJ5Jz5XZWRuZXNkYXkgMjgvMDkvMjAyMjwvc3Bhbj48L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtZGFuZ2VyJz4zXygxMDo1MC0xMjoyMCk8L3NwYW4+PC90ZD48dGQ+REUtQzIwNTwvdGQ+PHRkPkFuaE5WNjQ8L3RkPjx0ZD5TRTE2NDM8L3RkPjx0ZD48Zm9udCBjb2xvcj1ncmVlbj5QcmVzZW50PC9mb250PjwvdGQ+PHRkPjwvdGQ+PC90cj48dHI+PHRkPjEyPC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLXByaW1hcnknPkZyaWRheSAzMC8wOS8yMDIyPC9zcGFuPjwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1kYW5nZXInPjNfKDEwOjUwLTEyOjIwKTwvc3Bhbj48L3RkPjx0ZD5ERS1DMjA1PC90ZD48dGQ+QW5oTlY2NDwvdGQ+PHRkPlNFMTY0MzwvdGQ+PHRkPjxmb250IGNvbG9yPWdyZWVuPlByZXNlbnQ8L2ZvbnQ+PC90ZD48dGQ+PC90ZD48L3RyPjx0cj48dGQ+MTM8L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtcHJpbWFyeSc+TW9uZGF5IDAzLzEwLzIwMjI8L3NwYW4+PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLWRhbmdlcic+M18oMTA6NTAtMTI6MjApPC9zcGFuPjwvdGQ+PHRkPkRFLUMyMDU8L3RkPjx0ZD5BbmhOVjY0PC90ZD48dGQ+U0UxNjQzPC90ZD48dGQ+PGZvbnQgY29sb3I9Z3JlZW4+UHJlc2VudDwvZm9udD48L3RkPjx0ZD48L3RkPjwvdHI+PHRyPjx0ZD4xNDwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1wcmltYXJ5Jz5XZWRuZXNkYXkgMDUvMTAvMjAyMjwvc3Bhbj48L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtZGFuZ2VyJz4zXygxMDo1MC0xMjoyMCk8L3NwYW4+PC90ZD48dGQ+REUtQzIwNTwvdGQ+PHRkPkFuaE5WNjQ8L3RkPjx0ZD5TRTE2NDM8L3RkPjx0ZD48Zm9udCBjb2xvcj1ncmVlbj5QcmVzZW50PC9mb250PjwvdGQ+PHRkPjwvdGQ+PC90cj48dHI+PHRkPjE1PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLXByaW1hcnknPkZyaWRheSAwNy8xMC8yMDIyPC9zcGFuPjwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1kYW5nZXInPjNfKDEwOjUwLTEyOjIwKTwvc3Bhbj48L3RkPjx0ZD5ERS1DMjA1PC90ZD48dGQ+QW5oTlY2NDwvdGQ+PHRkPlNFMTY0MzwvdGQ+PHRkPjxmb250IGNvbG9yPWdyZWVuPlByZXNlbnQ8L2ZvbnQ+PC90ZD48dGQ+PC90ZD48L3RyPjx0cj48dGQ+MTY8L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtcHJpbWFyeSc+TW9uZGF5IDEwLzEwLzIwMjI8L3NwYW4+PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLWRhbmdlcic+M18oMTA6NTAtMTI6MjApPC9zcGFuPjwvdGQ+PHRkPkRFLUMyMDU8L3RkPjx0ZD5BbmhOVjY0PC90ZD48dGQ+U0UxNjQzPC90ZD48dGQ+PGZvbnQgY29sb3I9Z3JlZW4+UHJlc2VudDwvZm9udD48L3RkPjx0ZD48L3RkPjwvdHI+PHRyPjx0ZD4xNzwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1wcmltYXJ5Jz5XZWRuZXNkYXkgMTIvMTAvMjAyMjwvc3Bhbj48L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtZGFuZ2VyJz4zXygxMDo1MC0xMjoyMCk8L3NwYW4+PC90ZD48dGQ+REUtQzIwNTwvdGQ+PHRkPkFuaE5WNjQ8L3RkPjx0ZD5TRTE2NDM8L3RkPjx0ZD48Zm9udCBjb2xvcj1ncmVlbj5QcmVzZW50PC9mb250PjwvdGQ+PHRkPjwvdGQ+PC90cj48dHI+PHRkPjE4PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLXByaW1hcnknPkZyaWRheSAxNC8xMC8yMDIyPC9zcGFuPjwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1kYW5nZXInPjNfKDEwOjUwLTEyOjIwKTwvc3Bhbj48L3RkPjx0ZD5ERS1DMjA1PC90ZD48dGQ+QW5oTlY2NDwvdGQ+PHRkPlNFMTY0MzwvdGQ+PHRkPjxmb250IGNvbG9yPWdyZWVuPlByZXNlbnQ8L2ZvbnQ+PC90ZD48dGQ+PC90ZD48L3RyPjx0cj48dGQ+MTk8L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtcHJpbWFyeSc+TW9uZGF5IDE3LzEwLzIwMjI8L3NwYW4+PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLWRhbmdlcic+M18oMTA6NTAtMTI6MjApPC9zcGFuPjwvdGQ+PHRkPkRFLUMyMDU8L3RkPjx0ZD5BbmhOVjY0PC90ZD48dGQ+U0UxNjQzPC90ZD48dGQ+PGZvbnQgY29sb3I9Z3JlZW4+UHJlc2VudDwvZm9udD48L3RkPjx0ZD48L3RkPjwvdHI+PHRyPjx0ZD4yMDwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1wcmltYXJ5Jz5XZWRuZXNkYXkgMTkvMTAvMjAyMjwvc3Bhbj48L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtZGFuZ2VyJz4zXygxMDo1MC0xMjoyMCk8L3NwYW4+PC90ZD48dGQ+REUtQzIwNTwvdGQ+PHRkPkFuaE5WNjQ8L3RkPjx0ZD5TRTE2NDM8L3RkPjx0ZD48Zm9udCBjb2xvcj1ncmVlbj5QcmVzZW50PC9mb250PjwvdGQ+PHRkPjwvdGQ+PC90cj48dHI+PHRkPjIxPC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLXByaW1hcnknPkZyaWRheSAyMS8xMC8yMDIyPC9zcGFuPjwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1kYW5nZXInPjNfKDEwOjUwLTEyOjIwKTwvc3Bhbj48L3RkPjx0ZD5ERS1DMjA1PC90ZD48dGQ+QW5oTlY2NDwvdGQ+PHRkPlNFMTY0MzwvdGQ+PHRkPjxmb250IGNvbG9yPWdyZWVuPlByZXNlbnQ8L2ZvbnQ+PC90ZD48dGQ+PC90ZD48L3RyPjx0cj48dGQ+MjI8L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtcHJpbWFyeSc+TW9uZGF5IDI0LzEwLzIwMjI8L3NwYW4+PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLWRhbmdlcic+M18oMTA6NTAtMTI6MjApPC9zcGFuPjwvdGQ+PHRkPkRFLUMyMDU8L3RkPjx0ZD5BbmhOVjY0PC90ZD48dGQ+U0UxNjQzPC90ZD48dGQ+PGZvbnQgY29sb3I9Z3JlZW4+UHJlc2VudDwvZm9udD48L3RkPjx0ZD48L3RkPjwvdHI+PHRyPjx0ZD4yMzwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1wcmltYXJ5Jz5XZWRuZXNkYXkgMjYvMTAvMjAyMjwvc3Bhbj48L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtZGFuZ2VyJz4zXygxMDo1MC0xMjoyMCk8L3NwYW4+PC90ZD48dGQ+REUtQzIwNTwvdGQ+PHRkPkFuaE5WNjQ8L3RkPjx0ZD5TRTE2NDM8L3RkPjx0ZD48Zm9udCBjb2xvcj1ncmVlbj5QcmVzZW50PC9mb250PjwvdGQ+PHRkPjwvdGQ+PC90cj48dHI+PHRkPjI0PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLXByaW1hcnknPkZyaWRheSAyOC8xMC8yMDIyPC9zcGFuPjwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1kYW5nZXInPjNfKDEwOjUwLTEyOjIwKTwvc3Bhbj48L3RkPjx0ZD5ERS1DMjA1PC90ZD48dGQ+QW5oTlY2NDwvdGQ+PHRkPlNFMTY0MzwvdGQ+PHRkPjxmb250IGNvbG9yPWdyZWVuPlByZXNlbnQ8L2ZvbnQ+PC90ZD48dGQ+PC90ZD48L3RyPjx0cj48dGQ+MjU8L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtcHJpbWFyeSc+TW9uZGF5IDMxLzEwLzIwMjI8L3NwYW4+PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLWRhbmdlcic+M18oMTA6NTAtMTI6MjApPC9zcGFuPjwvdGQ+PHRkPkRFLUMyMDU8L3RkPjx0ZD5BbmhOVjY0PC90ZD48dGQ+U0UxNjQzPC90ZD48dGQ+PGZvbnQgY29sb3I9Z3JlZW4+UHJlc2VudDwvZm9udD48L3RkPjx0ZD48L3RkPjwvdHI+PHRyPjx0ZD4yNjwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1wcmltYXJ5Jz5XZWRuZXNkYXkgMDIvMTEvMjAyMjwvc3Bhbj48L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtZGFuZ2VyJz4zXygxMDo1MC0xMjoyMCk8L3NwYW4+PC90ZD48dGQ+REUtQzIwNTwvdGQ+PHRkPkFuaE5WNjQ8L3RkPjx0ZD5TRTE2NDM8L3RkPjx0ZD48Zm9udCBjb2xvcj1ncmVlbj5QcmVzZW50PC9mb250PjwvdGQ+PHRkPjwvdGQ+PC90cj48dHI+PHRkPjI3PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLXByaW1hcnknPkZyaWRheSAwNC8xMS8yMDIyPC9zcGFuPjwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1kYW5nZXInPjNfKDEwOjUwLTEyOjIwKTwvc3Bhbj48L3RkPjx0ZD5ERS1DMjA1PC90ZD48dGQ+QW5oTlY2NDwvdGQ+PHRkPlNFMTY0MzwvdGQ+PHRkPjxmb250IGNvbG9yPWdyZWVuPlByZXNlbnQ8L2ZvbnQ+PC90ZD48dGQ+PC90ZD48L3RyPjx0cj48dGQ+Mjg8L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtcHJpbWFyeSc+TW9uZGF5IDA3LzExLzIwMjI8L3NwYW4+PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLWRhbmdlcic+M18oMTA6NTAtMTI6MjApPC9zcGFuPjwvdGQ+PHRkPkRFLUMyMDU8L3RkPjx0ZD5BbmhOVjY0PC90ZD48dGQ+U0UxNjQzPC90ZD48dGQ+PGZvbnQgY29sb3I9Z3JlZW4+UHJlc2VudDwvZm9udD48L3RkPjx0ZD48L3RkPjwvdHI+PHRyPjx0ZD4yOTwvdGQ+PHRkPjxzcGFuIGNsYXNzPSdsYWJlbCBsYWJlbC1wcmltYXJ5Jz5XZWRuZXNkYXkgMDkvMTEvMjAyMjwvc3Bhbj48L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtZGFuZ2VyJz4zXygxMDo1MC0xMjoyMCk8L3NwYW4+PC90ZD48dGQ+REUtQzIwNTwvdGQ+PHRkPkFuaE5WNjQ8L3RkPjx0ZD5TRTE2NDM8L3RkPjx0ZD48Zm9udCBjb2xvcj1ibGFjaz5GdXR1cmU8L2ZvbnQ+PC90ZD48dGQ+PC90ZD48L3RyPjx0cj48dGQ+MzA8L3RkPjx0ZD48c3BhbiBjbGFzcz0nbGFiZWwgbGFiZWwtcHJpbWFyeSc+RnJpZGF5IDExLzExLzIwMjI8L3NwYW4+PC90ZD48dGQ+PHNwYW4gY2xhc3M9J2xhYmVsIGxhYmVsLWRhbmdlcic+M18oMTA6NTAtMTI6MjApPC9zcGFuPjwvdGQ+PHRkPkRFLUMyMDU8L3RkPjx0ZD5BbmhOVjY0PC90ZD48dGQ+U0UxNjQzPC90ZD48dGQ+PGZvbnQgY29sb3I9YmxhY2s+RnV0dXJlPC9mb250PjwvdGQ+PHRkPjwvdGQ+PC90cj48L3Rib2R5Pjx0Zm9vdD48dHI+PHRkIGNvbHNwYW49JzcnPjxiPkFic2VudDwvYj46IDAlIGFic2VudCBzbyBmYXIgKDAgYWJzZW50IG9uIDMwIHRvdGFsKS48L3RkPjwvdHI+PC90Zm9vdD4gPC90YWJsZT48L3RkZAIHDxYCHwBnZGR/2pvxIQUiATAA5VEztn8V/nkFXgJEgmLuKeMkoOvVgg==" /> 
                                                </div>
                        
                                                <div>
                                                    <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="6AEC5B00" />
                                                </div>
                                                <div id="ctl00_divUser" style="float: right; margin-right: 16px;">
                                                    <a href="?view=user">
                                                        <span id="ctl00_lblLogIn" class="label label-success">${account.username}</span></a> | 
                                                        <a href="home" class="label label-success">home</a> | 
                                                        <a href="?logout=true" class="label label-success">logout</a> 
                        
                                                </div>
                                                <ol class="breadcrumb">
                                                    <li>
                                                        <span id="ctl00_lblNavigation"><b>&nbsp;</b></span></li>
                                                </ol>
                        <table>
                            <tr style="border-bottom: 0 none">

                            <div>
                                <h2>View attendance for <span id="ctl00_mainContent_lblStudent">${sessionScope.account.displayname} (${sessionScope.account.username})</span></h2>
                                <font style="font-weight: bold"> </font>

                                <table>
                                    <tbody>
                                        <tr>
                                            <td valign="top"><h3>Select a  course ...</h3>
                                                <table summary='Select a course'>
                                                    <thead>
                                                        <tr>

                                                            <th scope='col'>Term</th>
                                                            <th scope='col'>Course</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>           
                                                            <td valign='top'>
                                                                <div >
                                                                    <table>
                                                                        

                                                                            <c:forEach items="${requestScope.groups}" var="g">
                                                                                <tr>
                                                                                <td>${g.sem}${g.year}</td>

                                                                                <td><a href="recordattendance?subid=${g.subject.id}&stdid=${account.id}">${g.subject.name}<br> 
                                                                                    </a>
                                                                                </td>  
                                                                                </tr>
                                                                            </c:forEach>

                                                                        


                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>

                                            <td valign='top'><h3>... then see report<br /></h3>
                                                <table>
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
                                                            <td colspan='7'><b>Absent</b>: 0% absent so far (0 absent on 30 total).</td>
                                                        </tr>
                                                    </tfoot> 
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>                                           
                            </div>
                            </td>
                            </tr>
<!--                                                        <tr style="border-bottom: 0 none">
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
                                                        </tr>-->
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
