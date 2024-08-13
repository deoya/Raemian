<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>

<body>
<div id="guideBox" >
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li> </li>
		</ul>
	</div>
</div>
<%@ include file="./menu.jsp" %>
<!-- 로그인 화면 시작 -->
	<form role="form" method='post' action="./login"> <!--../login 로 가면 http://localhost:8080/ramian_admin_login로 가짐  -->
    <label class="mbship_title">
        <p>MEMBER-LOGIN</p>
        <ul>
          <li>로그인하시면, 회원 별 다양한 맞춤 서비스를 이용하실 수 있습니다.</li>
        </ul>
      </label>
      <fieldset class="mbship_box">
        <span class="agree_span">
        <ul class="mblogin">
            <li><img src="${pageContext.request.contextPath}/resources/img/mainlogin.png"></li>
            <li>
                <span>EXPERIENCE OF PRIDE <br> LOGIN</span>
                <span>
                    <ol class="login_ols">
                        <li><input  type="text" name="username"  class="login_input" placeholder="아이디를 입력하세요"></li>
                        <li><input  type="password" name="password" class="login_input"  placeholder="패스워드를 입력하세요"></li>
                        <li><button type="submit" class="login_btn1">로그인</button></li>
                        <li><button type="button" class="login_btn2" onclick="location.href='${pageContext.request.contextPath}/raemian_client/join_agree'">회원가입</button></li>
                        <li style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/raemian_client/search'">아이디 찾기 / 비밀번호 찾기</li>
                        <li>※ 계정 로그인 : (ID) test00 (PW)aa123456</li>
                    </ol>
                </span>
            </li>
        </ul>
        </span>
      </fieldset>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
<!-- 로그인 화면 종료 -->
<%@ include file='./copywriter.jsp' %>
</body>
</html>
