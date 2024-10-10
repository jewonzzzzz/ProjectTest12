<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/kaiadmin/favicon.ico" type="image/x-icon" />

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- FullCalendar -->
    <link href="${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.main.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.main.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/fullcalendar/ko.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                locale: "ko",
                initialView: 'dayGridMonth',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                },
                googleCalendarApiKey: 'AIzaSyC-qHIObhsgU8dv5h5pbrxc2E7zzX0qrkQ',
                events: {
                    googleCalendarId: 'dd70016109c0cb346e3df957330eb4d232a31d31cc70eba29d0754ee944f0c53@group.calendar.google.com',
                    className: 'gcal-event' // an option!
                },
                eventClick: function(info) {
                    let start_year = info.event.start.getUTCFullYear();
                    let start_month = info.event.start.getMonth() + 1;
                    let start_date = info.event.start.getUTCDate();
                    let start_hour = info.event.start.getHours();
                    let end_hour = info.event.end.getHours();

                    let start = start_year + "-" + start_month + "-" + start_date + " " + start_hour + "시 ~ " + end_hour + "시";

                    let attends = "";
                    info.event.extendedProps.attachments.forEach(function(item) {
                        attends += "<div><a href='" + item.fileUrl + "' target='_blank'>[첨부파일]</a></div>";
                    });

                    if (!info.event.extendedProps.description) {
                        info.event.extendedProps.description = "";
                    }
                    let contents = `
                        <div style='font-weight:bold; font-size:20px; margin-bottom:30px; text-align:center'>
                            ${start}
                        </div>
                        <div style='font-size:18px; margin-bottom:20px'>
                            제목: ${info.event.title}
                        </div>
                        <div style='width:500px'>
                            ${info.event.extendedProps.description}
                            ${attends}
                        </div>
                    `;

                    $("#popup").html(contents);
                    $("#popup").bPopup({
                        speed: 650,
                        transition: 'slideIn',
                        transitionClose: 'slideBack',
                        position: [($(document).width() - 500) / 2, 30] //x, y
                    });
                    info.jsEvent.stopPropagation();
                    info.jsEvent.preventDefault();
                }
            });
            calendar.render();
        });
    </script>
    
    <!-- FullCalendar -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/kaiadmin.min.css" />
</head>
<body>
    <div class="wrapper">
        <%@ include file="/resources/assets/inc/sidebar.jsp" %> <!-- sidebar -->
        <div class="main-panel">
            <div class="main-header">
                <%@ include file="/resources/assets/inc/logo_header.jsp" %> <!-- Logo Header -->
                <%@ include file="/resources/assets/inc/navbar.jsp" %> <!-- Navbar Header -->
            </div>
            <div class="container">
                <div class="page-inner">
                    <div id='calendar'></div>
                    <div id='popup' style="width:500px; height:600px; display:none; background-color:white; padding:20px; border-radius:14px; border:2px solid #eeeeee"></div>
                </div>
                <!-- page-inner -->
            </div>
            <!-- container -->
            <%@ include file="/resources/assets/inc/footer.jsp" %>
        </div>
        <!-- main-panel -->
    </div>
    <!-- main-wrapper -->

    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/kaiadmin.min.js"></script>
</body>
</html>
