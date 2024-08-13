<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Date today = new Date(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<meta property="og:type" content="website">
<meta property="og:title" content="인천검단 레미안">
<title>인천검단 레미안</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/normalize.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cal-style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dadmin/css/sweetalert.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/top.css?v=2">
    
<!-- 추가된 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/new_member.css?v=26">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css">
<!-- 추가된 css -->
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
</head>

<body>
<div id="guideBox">
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li> AJAX로 확인하여 예약 미등록시 등록 페이지로 자동 이동</li>
			<li> AJAX로 확인하여 이미 변경을 완료 한 경우, 취소 페이지로 자동이동 </li>
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>
<div class="sub_title">
<section class="sub_image">
<span>
최적의 입주환경을 준비하는 입주 전 서비스<br>
두근두근 설레는 마음, 레미안 입주를 앞둔 고객님을 위한 사전방문 예약 입니다.</span>
</section>    
</div>    
    
<!-- 예약확인 화면 시작 -->
    <label class="mbship_title">
        <p>RESERVATION CONFIRM</p>
        <ul>
          <li style="color: red;">※ 예약수정은 1회 변경 가능 합니다.</li>
        </ul>
      </label>
    <span id="vueBox">
    <form id="f">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	  <input type="hidden" name="cidx" value="<sec:authentication property='principal.dao.cidx'/>">
      <fieldset class="mbship_box">
        <h3>예약확인 <span style="display: inline-block; font-size: 12px; vertical-align: 5px; float: right;">■ 표시는 필수 입력 항목입니다.</span></h3>
        <span class="agree_span">
        <ol class="mbinfos">
        <li><em class="ck_font">■</em> 아이디</li>
        <li>
        <input type="text" name="cid" class="mbinput1" value="<sec:authentication property='principal.dao.cid'/>" readonly>
        </li>
        <li><em class="ck_font">■</em> 고객명</li>
        <li>
        <input type="text" name="cname" class="mbinput2" value="<sec:authentication property='principal.dao.cname'/>" readonly>
        </li>
        <li><em class="ck_font">■</em> 예약일자</li>
        <li>
        <input type="date" name="date" class="mbinput1">
        </li>
        <li><em class="ck_font">■</em> 예약시간</li>
        <li>
        <select class="mbinput1" name="time">
        <option>시간선택</option>    
        <option>09:00</option>        
        <option>10:00</option>
        <option>11:00</option>
        <option>14:00</option>
        <option>15:00</option>
        <option>16:00</option>
        <option>17:00</option>
        </select>
        </li>
        <li><em class="ck_font">■</em> 휴대전화번호</li>
        <li>
        <input type="text" name="ctel" class="mbinput2" value="<sec:authentication property='principal.dao.ctel'/>" readonly>
        </li>
        <li><em class="ck_font">■</em> 인원수</li>
        <li>
        <label class="ck_label">
        <input type="radio" name="rpersonnel" value="1" class="ck_label"> 1명
        </label>
        <label class="ck_label">
        <input type="radio" name="rpersonnel" value="2" class="ck_label"> 2명
        </label>
        </li>
        </ol>
        </span>
        <span class="span_buttons">
        	<button id="btn" type="button" class="next_btn1_1" @click="update" style="display:none;">예약수정</button>
        	<div style="margin-bottom:30px;"></div>
        </span>
      </fieldset>
    </form>
    </span>
<!-- 예약확인 화면 종료 -->
<%@ include file="../copywriter.jsp" %>
</body>
<script>
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/reservation_ck.js?v=<%= today%>"></script>
</html>
