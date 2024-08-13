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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
<div id="guideBox" >
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li>약관동의를 건너뛰고 직접 join_member를 주소창에 입력해서 들어온 경우 자동으로 약관동의 화면으로 리다이렉트 됨(input의 hidden값 활용) </li>
			<li>실제 핸드폰으로 인증번호 발송 가능(coolsms API활용)</li>
			<li>인증번호 발송후 잘못입력했을 때를 대비하여 발송후 바로 readOnly 처리 하지 않고,
				hiden값에 따로 저장후 인증확인 완료될때 hidden값을 불러온 후 readOnly처리 
			 </li>
			 <li>우편 주소는 다음지도 API 활용</li>
			 <li>마케팅 수신여부의 이메일란은 이메일을 입력해야만 체크 가능하게 처리</li>
		</ul>
	</div>
	<br>
</div>
<%@ include file="./menu.jsp" %>
<!-- 회원가입 화면 시작 -->
	
    <label class="mbship_title">
        <p>MEMBER-SHIP</p>
        <ul>
          <li style="color: #000;">01. 약관동의</li>
          <li><img src="${pageContext.request.contextPath}/resources/img/step_off.png" /></li>
          <li style="color: #1B9C9E;">02. 정보입력</li>
          <li><img src="${pageContext.request.contextPath}/resources/img/step_on.png" /></li>
          <li>03. 가입완료</li>
        </ul>
      </label>
      <div id="vueBox">
      <form id="f">
      <input type="hidden" name="cad">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <fieldset class="mbship_box">
        <h3>기본정보 입력 <span style="display: inline-block; font-size: 12px; vertical-align: 5px; float: right;">■ 표시는 필수 입력 항목입니다.</span></h3>
        <span class="agree_span">
        <ol class="mbinfos">
        <li><em class="ck_font">■</em> 이름</li>
        <li><input type="text" name="cname" class="mbinput1" placeholder="이름을 입력하세요"></li>
        <li><em class="ck_font">■</em> 아이디</li>
        <li>
        <input type="text" name="cid" class="mbinput2" maxlength="12" placeholder="6~12자의 아이디를 입력하세요">
        <button type="button" class="mb_btn1" @click="idck">중복확인</button>
        </li>
        <li><em class="ck_font">■</em> 비밀번호</li>
        <li>
        <input type="password" name="cpwd" class="mbinput3" maxlength="14" placeholder="8~14자의 패스워드를 입력하세요">
        </li>
        <li><em class="ck_font">■</em> 비밀번호 확인</li>
        <li>
        <input type="password" name="cpwd_ck" class="mbinput3" maxlength="14" placeholder="동일한 패스워드를 입력하세요">
        </li>
        <li><em class="ck_font">■</em> 휴대전화번호</li>
        <li>
        <input type="hidden" name="tel_save">
        <input type="text" name="ctel" maxlength="11" class="mbinput2" placeholder="숫자만 입력하세요">
        <button type="button" class="mb_btn1" @click="accreditation">인증발송</button>
        </li>
        <li><em class="ck_font">■</em> 인증번호</li>
        <li>
        <input type="text" name="acc_num_ck" class="mbinput2" placeholder="숫자 6자리를 입력하세요" maxlength="6">
        <button id="mb_btn1" style="display:none;" type="button" class="mb_btn1"  @click="accreditation_ck">인증완료</button>
        </li>
        <li> 이메일</li>
        <li>
        <input type="text" name="cemail" class="mbinput3" placeholder="이메일을 입력하세요" @change="email($event)">
        </li>
        <li style="height: 125px;"><em class="ck_font">■</em> 주소</li>
        <li style="height: 120px; line-height: normal; margin-top: 5px;">
        <input type="text" name="cadrr_n" class="mbinput1" placeholder="우편번호" maxlength="5" readonly>
        <button type="button" class="mb_btn1" @click="adress_post">주소찾기</button>
        <input type="text" name="cadrr_1" class="mbinput4" placeholder="도로명 주소" readonly>
        <input type="text" name="cadrr_2" class="mbinput4" placeholder="상세주소를 입력하세요">
        </li>
        <li style="height: 100px;"> 마케팅 수신여부</li>
        <li style="height: 100px;">
        <label class="ck_label"><input type="checkbox" name="ad" class="mbinput5" disabled> 이메일 </label>
        <label class="ck_label"><input type="checkbox" name="ad" class="mbinput5"> 전화 </label>
        <label class="ck_label"><input type="checkbox" name="ad" class="mbinput5"> 우편물 </label>
        <label class="ck_label"><input type="checkbox" name="ad" class="mbinput5"> SMS (문자 메세지)</label><br>
        선택하신 정보 수신에 동의하겠습니다. (서비스, 이벤트 소식 등의 홍보/마케팅 정보를 수신하게 됩니다.)
        </li>
        </ol>
        </span>
        <span class="span_buttons">
        <button type="button" class="next_btn1_1" @click="insert">회원가입</button>
        <button type="button" class="next_btn2_1" onclick="location.href='/r_client/raemian_client/userlogin'">가입취소</button>
        </span>
      </fieldset>
      </form>
      </div>
    
<!-- 회원가입 화면 종료-->
<%@ include file="./copywriter.jsp" %>
</body>
<script>
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/join_member.js?v=<%=today%>"></script>
</html>
