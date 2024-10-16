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
<%-- ${eduHisListInfoBase } --%>

<div class="page-header">
              <h3 class="fw-bold mb-3">교육이력관리(관리자)</h3>
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
                  <a href="/salary/salaryBasicInfo">교육</a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="#">교육이력관리(관리자)</a>
                </li>
              </ul>
            </div>
            
            <div class="row">
              <div class="col-md-11">
              <div class="form">
                      <div style="display: flex; margin-bottom: 10px; gap:5px; justify-content: flex-end;">
                          <select
                            class="form-select input-fixed"
                            id="typeSelect"
                          >
                          	<option value="edu_name">교육명</option>
                            <option value="emp_id">사원번호</option>
                            <option value="emp_name">사원이름</option>
                          </select>
                          <div style="width: 200px;">
                          <input
                              type="text"
                              class="form-control input-full"
                              id="eduInfo"
                              placeholder="필요한 정보를 입력하세요"
                            />
                           </div>
                          <button type="button" class="btn btn-primary" id="inquiryBtn"> 조회하기 </button>
                    </div>
                <div class="card">
                  <div class="card-header">
                    <div class="card-title">교육이력관리(관리자)</div>
                  </div>
                  
                  <div class="card-body">
                    <div class="table-responsive">
                      <table
                        id="basic-datatables"
                        class="display table table-striped table-hover"
                      >
                        <thead>
                          <tr>
                          <th>선택</th>
                          <th>사번</th>
                          <th>이름</th>
                          <th>교육명</th>
                          <th>접수마감일</th>
                          <th>교육시작일</th>
                          <th>교육종료일</th>
                          <th>상태</th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="list" items="${eduHisListInfoBase }">
                        	<tr>
                       		<td><input type="checkbox" data-id="edu_his_id" name="edu_his_id" value="${list.edu_his_id }"></td>
                      		<td>${list.emp_id }</td>
                      		<td>${list.emp_name }</td>
                      		<td>${list.edu_name }</td>
                      		<td>${list.edu_apply_end }</td>
                      		<td>${list.edu_start_date }</td>
                      		<td>${list.edu_end_date }</td>
                      		<td>${list.edu_status }</td>
                        	</tr>
                        </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              
              	
            </div>
            </div>
            
            <script>
        $(document).ready(function() {
            
         	// 조회 버튼 시 연/월/사번가지고 조회하기
            $('#inquiryBtn').click(function(event){
            	var checkSalaryInfo = [];
            	checkSalaryInfo.push($('#typeSelect').val());
            	checkSalaryInfo.push($('#eduInfo').val());
            	$.ajax({
            		url:'/edu/eduInquiryForManage',
            		type: 'POST',
            		data: JSON.stringify(checkSalaryInfo),
            		contentType: 'application/json',
            		success: function(response) {
            			swal("Success!", "직원 급여정보 조회완료", "success");
                        $('#basic-datatables tbody').empty();
            			response.forEach(function(data){
                        	var row = '<tr>' +
                            '<td style="text-align: center;"><input type="checkbox" data-id="edu_his_id" name="edu_his_id" value="' + data.edu_his_id + '"></td>' +
                            '<td style="text-align: center;">' + data.emp_id + '</td>' +
                            '<td style="text-align: center;">' + data.emp_name + '</td>' +
                            '<td style="text-align: center;">' + data.edu_name + '</td>' +
                            '<td style="text-align: center;">' + data.edu_apply_end + '</td>' +
                            '<td style="text-align: center;">' + data.edu_start_date + '</td>' +
                            '<td style="text-align: center;">' + data.edu_end_date + '</td>' +
                            '<td style="text-align: center;">' + data.edu_status + '</td>' +
                            '</tr>';
                            $('#basic-datatables tbody').append(row);
                        });
            		},
            		error: function(xhr, status, error) {
                        swal("Error!", "실패", "error");
                    }
            	});
            });
            
            $("#basic-datatables").DataTable({
            	pageLength: 7,
            	drawCallback: function() { //가운대 정렬
        			$('#basic-datatables th, #basic-datatables td').css({
        	            'text-align': 'center',
        	            'vertical-align': 'middle'
        	        });
        		}
            });
        });
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