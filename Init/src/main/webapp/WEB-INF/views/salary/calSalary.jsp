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

<div class="page-header">
              <h3 class="fw-bold mb-3">급여산출</h3>
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
                  <a href="/salary/salaryBasicInfo">급여관리</a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="#">급여산출</a>
                </li>
              </ul>
            </div>
        <div class="row">
              <div class="col-md-10">
                <div class="card">
                  <div class="card-header">
                    <div class="card-title">급여산출내역</div>
                  </div>
                  	<div style="margin-left: 15px; margin-bottom: 10px; padding-top: 10px;">
                    	<a href="/salary/calSalaryStep1"><button class="btn btn-primary">신규생성</button></a>
                    	
                    	<form id="deleteSubmit" action="/salary/deleteSalaryInfo" method="post" style="display: inline-block;">
                    		<input type="hidden" id="inputForDelete" name="sal_list_id">
                    		<button type="submit" class="btn btn-primary" id="deleteBtn" disabled>삭제하기</button>
                    	</form>
                    	
                   		<button
	                        class="btn btn-primary"
	                        id = "signBtn"
	                        data-bs-toggle="modal"
	                        data-bs-target="#addRowModal"
	                      	>
	                        결재요청
                        </button>
                    	
                    	<form id="confirmSubmit" action="/salary/confirmSalaryList" method="post" style="display: inline-block;">
                    		<input type="hidden" id="inputForConfirm" name="sal_list_id">
                    		<button type="submit" class="btn btn-primary" id="confirmBtn" disabled>최종확정</button>
                    	</form>
                    	
                  	</div>
                  <div class="card-body" style="padding-top: 10px;">
                    <table id="basic-datatables"
                        class="display table table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">구분</th>
                          <th scope="col">연도</th>
                          <th scope="col">월</th>
                          <th scope="col">급여형태</th>
                          <th scope="col">제목</th>
                          <th scope="col">상태</th>
                          <th scope="col">최종작성일</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="list" items="${calSalaryListInfo }">
                      	<tr>
                      		<td><input type="checkbox" data-id="sal_list_id" name="sal_list_id" value="${list.sal_list_id }"></td>
                      		<td>${list.year }</td>
                      		<td>${list.month }</td>
                      		<td>${list.sal_type }</td>
                      		<td><a href="/salary/calSalaryView?sal_list_id=${list.sal_list_id }">${list.sal_list_subject }</a></td>
                      		<td>${list.sal_list_status }</td>
                      		<td>${list.sal_list_date }</td>
                      	</tr>
                      </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- 모달  -->
            <div
                      class="modal fade"
                      id="addRowModal"
                      tabindex="-1"
                      role="dialog"
                      aria-hidden="true"
                    >
                      <div class="modal-dialog" role="document" style="max-width: 1000px; margin-top: 100px;">
                        <div class="modal-content" style="width: 1000px;">
                        <div style="display: flex;">
                        <div class="col-6">
                        <div class="modal-header border-0">
                            <h5 class="modal-title">
                              <span class="fw-mediumbold"> New</span>
                              <span class="fw-light"> Row </span>
                            </h5>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <p class="small">
                              Create a new row using this form, make sure you
                              fill them all
                            </p>
                            <form>
                              <div class="row">
                                <div class="col-sm-12">
                                  <div class="form-group form-group-default">
                                    <label>Name</label>
                                    <input id="addName" type="text" class="form-control" placeholder="fill name">
                                  </div>
                                </div>
                                <div class="col-md-6 pe-0">
                                  <div class="form-group form-group-default">
                                    <label>Position</label>
                                    <input id="addPosition" type="text" class="form-control" placeholder="fill position">
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <div class="form-group form-group-default">
                                    <label>Office</label>
                                    <input id="addOffice" type="text" class="form-control" placeholder="fill office">
                                  </div>
                                </div>
                              </div>
                            </form>
                          </div>
                          <div class="modal-footer border-0">
                            <button type="button" id="addRowButton" class="btn btn-primary">
                              Add
                            </button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                              Close
                            </button>
                          </div>
                        </div>
                        <div>
                        <div class="modal-header border-0">
                            <h5 class="modal-title">
                              <span class="fw-mediumbold"> New</span>
                              <span class="fw-light"> Row </span>
                            </h5>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <p class="small">
                              Create a new row using this form, make sure you
                              fill them all
                            </p>
                            <form>
                              <div class="row">
                                <div class="col-sm-12">
                                  <div class="form-group form-group-default">
                                    <label>Name</label>
                                    <input id="addName" type="text" class="form-control" placeholder="fill name">
                                  </div>
                                </div>
                                <div class="col-md-6 pe-0">
                                  <div class="form-group form-group-default">
                                    <label>Position</label>
                                    <input id="addPosition" type="text" class="form-control" placeholder="fill position">
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <div class="form-group form-group-default">
                                    <label>Office</label>
                                    <input id="addOffice" type="text" class="form-control" placeholder="fill office">
                                  </div>
                                </div>
                              </div>
                            </form>
                          </div>
                          <div class="modal-footer border-0">
                            <button type="button" id="addRowButton" class="btn btn-primary">
                              Add
                            </button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                              Close
                            </button>
                          </div>
                        </div>
                        </div>
                        
                        
                        
                          
                        </div>
                    </div>
           </div>
            
            <script>
        $(document).ready(function() {
        	//데이터테이블 설정
        	$("#basic-datatables").DataTable({
        		pageLength: 8,
        	});
        	
        	// 체크박스 체크여부에 다른 동작 분리(삭제버튼 활성화, 다중체크방지)
        	$('input[type="checkbox"]').click(function() {
                if ($(this).is(':checked')) {
                    // 체크박스가 체크되면 버튼 활성화
                    $('#deleteBtn').prop('disabled', false);
                    // 하나만 체크할 수 있도록 하는 기능
                    $('input[type="checkbox"]').not(this).prop('checked', false);
                } else {
                    // 체크박스가 해제되면 버튼 비활성화
                    $('#deleteBtn').prop('disabled', true);
                }
            });
        	
        	// 체크여부에 따라 최종확정 버튼 활성화
        	$('input[type="checkbox"]').click(function() {
        		var tdText = $(this).closest('tr').find('td:eq(5)').text();
	        	if($(this).is(':checked') && tdText === '결재완료') {
	            	// 체크되고 '결재완료'일때만 활성화
	                $('#confirmBtn').prop('disabled', false);
	        	} else {
                    // 체크박스가 해제되면 버튼 비활성화
                    $('#confirmBtn').prop('disabled', true);
                }
        	});
        	
        	// 테이블 가운대 정렬
        	$('table th, table td').css('text-align', 'center');
        	
        	// 삭제버튼 시 리스트id 가지고 이동하기
            $('#deleteBtn').click(function(event){
            	event.preventDefault();
            	swal({
     	              title: "삭제하시겠습니까?",
     	              text: "삭제 후에는 신규작성을 통해 다시 작성하셔야 됩니다.",
     	              type: "warning",
     	              buttons: {
     	                cancel: {
     	                  visible: true,
     	                  text: "취소하기",
     	                  className: "btn btn-danger",
     	                },
     	                confirm: {
     	                  text: "삭제하기",
     	                  className: "btn btn-success",
     	                },
     	              },
     	            }).then(function(willDelete) {  // 일반 함수 문법으로 변경
     	             if (willDelete) {
     	            	$('#inputForDelete').val($('input[name="sal_list_id"]:checked').val());
     	            	swal({
     	            	    title: "Success!",
     	            	    text: "삭제완료",
     	            	    icon: "success",
     	            	    buttons: "OK", 
     	            	}).then(function() {
     	            		$('#deleteSubmit').submit();
                        });
   	             	}
                    });
     	     	 });
        	
        	
        	 
        	
        	// 결재요청 버튼 시 워크플로우 모달팝업 초기화
        	$('#signBtn').click(function(){
        		$('#modalInputText').val('');
         		$('#modalContent').show();     
            	$('#modalNextContent').hide();   
        	});
        	
        	
        	
         	// 최종확정버튼 시 리스트id 가지고 이동하기
        	$('#confirmBtn').click(function(event){
        		event.preventDefault();
        		$('#inputForConfirm').val($('input[name="sal_list_id"]:checked').val());
        		swal({
	            	    title: "Success!",
	            	    text: "최종확정되었습니다.",
	            	    icon: "success",
	            	    buttons: "OK", 
            	}).then(function() {
            		$('#confirmSubmit').submit();
                });
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
