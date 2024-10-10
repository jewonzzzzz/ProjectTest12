<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
 <!-- 한글 인코딩 추가 -->


<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/attendanceMain.css" />


 
    


    
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <link
      rel="icon"
      href="${pageContext.request.contextPath }/resources/assets/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    />

    <!-- Fonts and icons -->
    
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["${pageContext.request.contextPath }/resources/assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/demo.css" />
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
<!------------------------------------------------------------------------------------------------------------------>

 
    <div class="frame-4">
        <div class="button">
            <div class="text-">
                출근
            </div>
        </div>
        <div class="picker">
            <div class="title">
                <div class="january">
                    January
                </div>
                <div class="text-2024">
                    2024
                </div>
            </div>
            <div class="date-picker">
                <div class="daypicker-dayrow1">
                    <div class="s">
                        S
                    </div>
                    <div class="m">
                        M
                    </div>
                    <div class="t">
                        T
                    </div>
                    <div class="w">
                        W
                    </div>
                    <div class="t-1">
                        T
                    </div>
                    <div class="f">
                        F
                    </div>
                    <div class="s-1">
                        S
                    </div>
                </div>
                <div class="month">
                    <div class="week-1">
                        <div class="frame-29">
                            <div class="text-29">
                                29
                            </div>
                        </div>
                        <div class="frame-30">
                            <div class="text-30">
                                30
                            </div>
                        </div>
                        <div class="frame-31">
                            <div class="text-31">
                                31
                            </div>
                        </div>
                        <div class="frame-1">
                            <div class="text-1">
                                1
                            </div>
                        </div>
                        <div class="frame-2">
                            <div class="text-2">
                                2
                            </div>
                        </div>
                        <div class="frame-3">
                            <div class="text-3">
                                3
                            </div>
                        </div>
                        <div class="frame-5">
                            <div class="text-4">
                                4
                            </div>
                        </div>
                    </div>
                    <div class="week-2">
                        <div class="frame-6">
                            <div class="text-5">
                                5
                            </div>
                        </div>
                        <div class="frame-7">
                            <div class="text-6">
                                6
                            </div>
                        </div>
                        <div class="frame-8">
                            <div class="text-7">
                                7
                            </div>
                        </div>
                        <div class="frame-9">
                            <div class="text-8">
                                8
                            </div>
                        </div>
                        <div class="frame-10">
                            <div class="text-9">
                                9
                            </div>
                        </div>
                        <div class="frame-11">
                            <div class="text-10">
                                10
                            </div>
                        </div>
                        <div class="frame-12">
                            <div class="text-11">
                                11
                            </div>
                        </div>
                    </div>
                    <div class="week-3">
                        <div class="frame-13">
                            <div class="text-12">
                                12
                            </div>
                        </div>
                        <div class="frame-14">
                            <div class="text-13">
                                13
                            </div>
                        </div>
                        <div class="frame-15">
                            <div class="text-14">
                                14
                            </div>
                        </div>
                        <div class="frame-16">
                            <div class="text-15">
                                15
                            </div>
                        </div>
                        <div class="frame-17">
                            <div class="text-16">
                                16
                            </div>
                            <svg id="123:021772" class="rectangle-173"></svg>
                        </div>
                        <div class="frame-18">
                            <div class="text-17">
                                17
                            </div>
                        </div>
                        <div class="frame-19">
                            <div class="text-18">
                                18
                            </div>
                        </div>
                    </div>
                    <div class="week-4">
                        <div class="frame-20">
                            <div class="text-19">
                                19
                            </div>
                        </div>
                        <div class="frame-21">
                            <div class="text-20">
                                20
                            </div>
                        </div>
                        <div class="frame-22">
                            <div class="text-21">
                                21
                            </div>
                        </div>
                        <div class="frame-23">
                            <div class="text-22">
                                22
                            </div>
                        </div>
                        <div class="frame-24">
                            <div class="text-23">
                                23
                            </div>
                        </div>
                        <div class="frame-25">
                            <div class="text-24">
                                24
                            </div>
                        </div>
                        <div class="frame-26">
                            <div class="text-25">
                                25
                            </div>
                        </div>
                    </div>
                    <div class="week-5">
                        <div class="frame-27">
                            <div class="text-26">
                                26
                            </div>
                        </div>
                        <div class="frame-28">
                            <div class="text-27">
                                27
                            </div>
                        </div>
                        <div class="frame-32">
                            <div class="text-28">
                                28
                            </div>
                        </div>
                        <div class="frame-39">
                            <div class="text-32">
                                29
                            </div>
                        </div>
                        <div class="frame-40">
                            <div class="text-33">
                                30
                            </div>
                        </div>
                        <div class="frame-41">
                            <div class="text-34">
                                1
                            </div>
                        </div>
                        <div class="frame-33">
                            <div class="text-35">
                                2
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="text--30---">
            &lt;나의 30일 근무 현황 달력표&gt;
        </div>
        <div class="button-1">
            <div class="text---">
                <div><span>근태 결재 </span><span>신청</span><span> </span></div>
            </div>
        </div>
        <div class="button-2">
            <div class="text----">
                나의 근태 이력 조회
            </div>
        </div>
        <div class="button-3">
            <div class="text--">
                휴직 신청
            </div>
        </div>
        <div class="button-4">
            <div class="text----1">
                근무제 결재 신청
            </div>
        </div>
        <div class="list">
            <div class="cell">
                <div class="icon">
                </div>
                <div class="text">
                    <div class="text---1">
                        - 고정 근무
                    </div>
                    <div class="text--0900-1800">
                        ㄴ 09:00 ~18:00
                    </div>
                </div>
                <svg id="123:021595" class="icon-1"></svg>
            </div>
            <svg id="123:021566" class="divider"></svg>
            <div class="cell-1">
                <div class="icon-2">
                </div>
                <div class="text-36">
                    <div class="text---2">
                        - 선택 근무
                    </div>
                    <div class="text--1400-1800">
                        ㄴ 14:00 ~18:00
                    </div>
                </div>
                <svg id="123:021610" class="icon-3"></svg>
            </div>
            <svg id="123:021564" class="divider-1"></svg>
            <div class="cell-2">
                <div class="icon-4">
                </div>
                <div class="text-37">
                    <div class="text---3">
                        - 야간 근무
                    </div>
                    <div class="text--2200-0700">
                        ㄴ 22:00 ~07:00
                    </div>
                </div>
                <svg id="123:021569" class="icon-5"></svg>
            </div>
            <svg id="123:021562" class="divider-2"></svg>
            <div class="cell-3">
                <div class="icon-6">
                </div>
                <div class="text-38">
                    <div class="text---4">
                        - 특별 근무
                    </div>
                    <div class="text--0900-1801">
                        ㄴ 09:00 ~18:00
                    </div>
                </div>
                <svg id="123:021613" class="icon-7"></svg>
            </div>
        </div>
        <div class="profile">
            <div class="navigation-bar">
                <div class="icon-8">
                </div>
                <div class="icons">
                    <div class="icon-9">
                    </div>
                    <svg id="123:039532" class="icon-10"></svg>
                </div>
            </div>
            <div class="profile-contents">
                <div class="avatar">
                    <img src="https://image-resource.creatie.ai/140658751204418/140658751204420/53f2f16fc321bb84025e76c3953fca73.jpeg" class="image" />
                    <div class="username">
                        <div class="james-john">
                            James John
                        </div>
                        <svg id="123:039549" class="icon-11"></svg>
                    </div>
                </div>
            </div>
            <div class="text------------">
                <div><span> - 사원 번호 :<div class="_p"></div>
                        <div class="_p"></div> - 부서 : <div class="_p"></div>
                        <div class="_p"></div> - 직책:<div class="_p"></div>
                        <div class="_p"></div> - 출근시간 :<div class="_p"></div>
                        <div class="_p"></div> - 퇴근시간 :<div class="_p"></div>
                        <div class="_p"></div> - 근무한시간 :
                    </span></div>
            </div>
        </div>
        <div class="button-5">
            <div class="text--1">
                퇴근
            </div>
        </div>
        <div class="button-6">
            <div class="text--2">
                복귀
            </div>
        </div>
        <div class="button-7">
            <div class="text--3">
                외근
            </div>
        </div>
    </div>

















<!------------------------------------------------------------------------------------------------------------------>
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
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- Chart JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

    <!-- Chart Circle -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/datatables/datatables.min.js"></script>

    <!-- Bootstrap Notify -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <!-- jQuery Vector Maps -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jsvectormap/world.js"></script>

    <!-- Sweet Alert -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/kaiadmin.min.js"></script>

    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/setting-demo.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/demo.js"></script>
    <script>
      $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#177dff",
        fillColor: "rgba(23, 125, 255, 0.14)",
      });

      $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#f3545d",
        fillColor: "rgba(243, 84, 93, .14)",
      });

      $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#ffa534",
        fillColor: "rgba(255, 165, 52, .14)",
      });
    </script>
  </body>
</html>
