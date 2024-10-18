<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	<div class="page-header">
              <h3 class="fw-bold mb-3">성과관리</h3>
              <ul class="breadcrumbs mb-3">
                <li class="nav-home">
                  <a href="/salary/main">
                    <i class="icon-home"></i>
                  </a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="/salary/salaryBasicInfo">성과관리</a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="#">성과관리(관리자)</a>
                </li>
              </ul>
            </div>
		<form id="submitForm" action="/eval/evalCreate" method="post">
            <div class="row">
              <div class="col-md-11">
                <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <div class="card-title">성과평가 신규등록</div>
                    <div class="card-category">
                      성과유형과 평가대상 성과기간을 설정합니다. <b>기존과 동일한 내역이 있으면 작성되지 않습니다.</b>
                    </div>
                  </div>
                  <div class="card-body">
                    <div class="form">
                      <div class="form-group form-show-notify row">
                        <div class="col-lg-3 col-md-3 col-sm-4 text-end">
                          <label>성과유형 :</label>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-8">
                          <select
                            class="form-select input-fixed"
                            id="notify_placement_from"
                            name="eval_type"
                          >
                            <option value="정기성과">정기평가</option>
                            <option value="특별성과">특별평가</option>
                          </select>
                        </div>
                      </div>
                      
                      <div class="form-group form-show-notify row">
                        <div class="col-lg-3 col-md-3 col-sm-4 text-end">
                          <label>연도 :</label>
                        </div>
                        <div class="col-lg-4 col-md-9 col-sm-8">
                          <select
                            class="form-select input-fixed"
                            id="yearSelect"
                            name="year"
                          >
                          </select>
                        </div>
                      </div>
                      <div class="form-group form-show-notify row" id="branchSelect">
                        <div class="col-lg-3 col-md-3 col-sm-4 text-end">
                          <label>분기 :</label>
                        </div>
                        <div class="col-lg-4 col-md-9 col-sm-8">
                          <select
                            class="form-select input-fixed"
                            id="branch"
                            name="branch"
                          >
                          <option value="1분기">1분기</option>
                          <option value="2분기">2분기</option>
                          <option value="3분기">3분기</option>
                          <option value="4분기">4분기</option>
                          </select>
                        </div>
                      </div>
                      
                      <div class="form-group form-show-notify row">
                        <div class="col-lg-3 col-md-3 col-sm-4 text-end">
                          <label>성과평가명 :</label>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-8">
                          <input type="text" 
				           class="form-control input-fixed" 
				           name="eval_name"
				           placeholder="0000년 0분기 정기성과" 
				           required
				           style="width:300px; margin-bottom: 0px; padding: 5px 14px; border-bottom-width: 1px;">
                        </div>
                      </div>
                      
                    </div>
                  </div>
                  <div class="card-footer">
                    <div class="form">
                      <div class="form-group from-show-notify row">
                        <div class="col-lg-3 col-md-3 col-sm-12">
                          <button type="button" class="btn btn-primary" onclick="history.back()">목록으로</button>
                        </div>
                        <div class="col-lg-4 col-md-9 col-sm-12">
                          <button id="nextBtn" class="btn btn-primary">
                            등록하기
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              </div>
            </div>
            </form>
	
	<script>
        $(document).ready(function() {
        	
            // 현재 연도 구하기
            const currentYear = new Date().getFullYear();
            
            // 최근 10년간의 연도 추가
            for (let year = currentYear; year > currentYear - 3; year--) {
                $('#yearSelect').append(new Option(year, year));  // Option 생성 및 추가
            }
            
         	// 특별성과 선택 시 평가분기 셀렉트 가리기
            $('select[name="eval_type"]').change(function() {
		        if ($(this).val() === '특별성과') {
		          $('#branchSelect').hide();  // div 보이기
		        } else {
		          $('#branchSelect').show();  // div 숨기기
		        }
	      	});
            
            
            
         	
         	
         	
         	
         	
         	
        }); //ready
    </script>
	
	
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
