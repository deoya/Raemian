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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/new_member.css?v=26">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css">
<!-- 추가된 css -->
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
</head>

<body>
<div id="guideBox" >
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li>인증번호는 회원가입과 동일</li>
		</ul>
	</div>
	<br>
	<div>♣참고 사항
		<ul>
			<li>계정찾기 페이지는 원본파일엔 없었지만 직접 추가한것이므로, 디자인이 어색할 수 있습니다 </li>
		</ul>
	</div>
</div>
<%@ include file="./menu.jsp" %>
    
<!-- 서브 화면 시작 -->
    <label class="mbship_title">
        <p>아이디 / 패스워드 찾기</p>
        <ul>
          <li style="color: #000;">로그인하시면, 회원 별 다양한 맞춤 서비스를 이용하실 수 있습니다.</li>
        </ul>
      </label>
      <span id="vueBox">
      <form id="f">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <input type="hidden" name="cri">
      
      
      <fieldset class="mbship_box">
        <h3>아이디/비밀번호 찾기 <span style="display: inline-block; font-size: 12px; vertical-align: 5px; float: right;">■ 표시는 필수 입력 항목입니다.</span></h3>
        <span class="agree_span">
        <ol class="mbinfos">
        <li><em class="ck_font">■</em> 이름</li>
        <li><input type="text" name="cname" class="mbinput1" placeholder="이름을 입력하세요"></li>
        <li><em class="ck_font">■</em> 휴대전화번호</li>
        <li>
        <input type="hidden" name="tel_save">
        <input type="text" class="mbinput2" name="ctel" maxlength="11" placeholder="숫자만 입력하세요">
        <button type="button" class="mb_btn1" @click="accreditation">인증발송</button>
        </li>
        <li><em class="ck_font">■</em> 인증번호</li>
        <li>
        <input type="text" class="mbinput2" name="acc_num_ck" placeholder="숫자 6자리를 입력하세요" maxlength="6">
        <button type="button" id="mb_btn1" class="mb_btn1" style="display:none;" @click="accreditation_ck">인증완료</button>
        </li>
        <li><em class="ck_font"></em> 아이디</li>
        <li>
        <input type="text" class="mbinput2" name="cid" maxlength="12" placeholder="6~12자의 아이디를 입력하세요">
        <button type="button" class="mb_btn1" @click="idck">아이디 확인</button><span style="color:red;">&nbsp&nbsp※ 비밀번호를 찾을시에만 입력해주세요</span>
        </li>
        </ol>
        </span>
        <span class="span_buttons">
        <button type="button" class="next_btn1_1" @click="idSearch">아이디 찾기</button>
        <button type="button" class="next_btn1_1"  @click="pwdSearch">비밀번호 변경하기</button>
        </span>
      </fieldset>
      </span>
      
      
<!-- 서브 화면 종료 -->
<%@ include file="./copywriter.jsp" %>
</body>
<script>
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/search.js?v=<%=today%>"></script>
</html>
