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
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/top.css?v=1">
    
<!-- 추가된 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/new_member.css?v=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css">
<!-- 추가된 css -->
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
</head>

<body>
<div id="guideBox" >
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li>AJAX로 약관 내용 출력 </li>
			<li>(js처리) 약관 모두 클릭시 자동으로 전체동의 버튼도 체크되며 하나라도 해지시 전체 동의 버튼도 해지 </li>
		</ul>
	</div>
	<br>
	<div>♣참고 사항
		<ul>
			<li>약관 내용은 파일을 받지 못하여, 온라인에서 찾아온것이기 때문에 내용이 부동산과 관련이 없습니다</li>
		</ul>
	</div>
</div>
<%@ include file="./menu.jsp" %>
    
<!-- 서브 화면 시작 -->
    <label class="mbship_title">
        <p>MEMBER-SHIP</p>
        <ul>
          <li>01. 약관동의</li>
          <li><img src="${pageContext.request.contextPath}/resources/img/step_on.png" /></li>
          <li>02. 정보입력</li>
          <li><img src="${pageContext.request.contextPath}/resources/img/step_off.png" /></li>
          <li>03. 가입완료</li>
        </ul>
      </label>
      <span id="vueBox">
      <form id="f">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <input type="hidden" name="ck" value="no">
      <fieldset class="mbship_box">
        <h3>약관동의</h3>
        <span class="agree_span">
        <label class="mbship_text">
          <input type="checkbox" id="all_agree" @change="all($event)" /> 의 모든 약관을 확인하고 전체 동의 합니다.
          (전체동의, 선택항목도 포함됩니다.)
        </label>
        <label class="mbship_text">
            <input type="checkbox" id="ck1" @change="ck"><font color="red"> (필수)</font>이용약관
        </label>
        <div class="agree_text" id="agree1"></div>
        <label class="mbship_text">
            <input type="checkbox" id="ck2"  @change="ck"><font color="red"> (필수)</font> 개인정보 수집 및 이용
        </label>
        <div class="agree_text" id="agree2"></div>
        </span>
        <button type="button" class="next_btn" @click ="next">다음단계</button>
      </fieldset>
      </form>
      </span>
    
<!-- 서브 화면 종료 -->
<%@ include file="./copywriter.jsp" %>
</body>
<script>
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/join_agree.js?v=<%= today %>"></script>
</html>
