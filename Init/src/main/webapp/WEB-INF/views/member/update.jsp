<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL-core 라이브러리 추가 -->
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

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

<fieldset style="width: 100%; margin: auto;">
  <legend>회원정보 수정</legend>

	<c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>

  <form action="/member/update" method="post">
    <table border="1" cellspacing="0" cellpadding="10" style="width: 100%; border-collapse: collapse;">
      <thead>
        <tr>
          <th colspan="2" style="background-color: #f2f2f2; text-align: center;">내정보</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td rowspan="15" style="width: 150px; text-align: center; vertical-align: top;">
            <img src="${memberVO.profile}" alt="증명사진" width="150px" height="auto" style="border-radius: 5px;">
          </td>
          <td style="font-weight: bold;">사원번호</td>
          <td><input type="text" name="id" value="${memberVO.id}" readonly style="width: 100%;" readonly></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">비밀번호</td>
          <td><input type="password" name="pw" value="${memberVO.pw}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">성명</td>
          <td><input type="text" name="name" value="${memberVO.name}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">생년월일</td>
          <td><input type="date" name="birth" value="${memberVO.birth}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">성별</td>
          <td>
            <select name="gender" style="width: 100%;">
              <option value="M" ${memberVO.gender == 'M' ? 'selected' : ''}>남성</option>
              <option value="F" ${memberVO.gender == 'F' ? 'selected' : ''}>여성</option>
            </select>
          </td>
        </tr>
        <tr>
          <td style="font-weight: bold;">연락처</td>
          <td><input type="text" name="tel" value="${memberVO.tel}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">이메일</td>
          <td><input type="email" name="email" value="${memberVO.email}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">주소</td>
          <td><input type="text" name="addr" value="${memberVO.addr}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">부서번호</td>
          <td><input type="text" name="dnum" value="${memberVO.dnum}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">직급</td>
          <td><input type="text" name="position" value="${memberVO.position}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">직무</td>
          <td><input type="text" name="job_id" value="${memberVO.job_id}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">재직구분</td>
          <td><input type="text" name="status" value="${memberVO.status}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">지점번호</td>
          <td><input type="text" name="bnum" value="${memberVO.bnum}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">근무형태</td>
          <td><input type="text" name="work_type" value="${memberVO.work_type}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">예금주</td>
          <td><input type="text" name="bank_name" value="${memberVO.account_name}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">계좌번호</td>
          <td><input type="text" name="account_num" value="${memberVO.account_num}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">은행명</td>
          <td><input type="text" name="account_name" value="${memberVO.bank_name}" style="width: 100%;"></td>
        </tr>
        <tr>
          <td style="font-weight: bold;">입사일자</td>
          <td><input type="date" name="start_date" value="${memberVO.start_date}" style="width: 100%;"></td>
        </tr>
      </tbody>
    </table>

    <div style="text-align: center; margin-top: 20px;">
      <input type="submit" value="수정완료" style="padding: 10px 20px; font-size: 16px;">
    </div>
  </form>
</fieldset>

          
          
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