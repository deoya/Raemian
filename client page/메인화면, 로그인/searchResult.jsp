<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<li>아이디를 찾을 경우 / 비밀번호를 찾을 경우 결과를 JSTL if문으로 구분</li>
			<li>만약 계정이 없을 경우 회원가입 버튼 생성</li>
			<li>비밀번호를 찾을 시 계정이 존재한다면 비밀번호를 새롭게 저장 </li>
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
      <!-- 아이디를 찾았을 경우 -->
      <fieldset class="mbship_box">
        <c:if test="${cri == 'id'}">
	        <h3>아이디 찾기<span style="display: inline-block; font-size: 12px; vertical-align: 5px; float: right;"></span></h3>
	        <span class="agree_span">
	        <ol class="mbinfos">
			
	        <li style="width:0%;"></li>
	        <li style="width:100%; text-align:center;">
	        <c:if test="${result != null}">
	        	<input type="text" style="border:none;background-color: rgba(0, 0, 0, 0); " value="찾으시는 아이디는 ${result} 입니다" readonly>
	        </c:if>
	        <c:if test="${result == null}">
	        	입력하신 정보는 회원가입 되어있지 않습니다
	        </c:if>
	        </li>
	        </ol>
        </c:if>
        <!--  비밀번호를 찾았을 경우 -->
        <c:if test="${cri == 'pwd'}">
	        <h3>비밀번호 변경하기<span style="display: inline-block; font-size: 12px; vertical-align: 5px; float: right;"></span></h3>
	        <span class="agree_span">
			<c:if test="${result > 0}">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		        <input type="hidden" name="cidx" value="${cidx}">
		        <ol class="mbinfos">
				<li><em class="ck_font"></em> 비밀번호</li>
		        <li><input type="password" name="cpwd" class="mbinput3" maxlength="14" placeholder="8~14자의 패스워드를 입력하세요"></li>
		        <li><em class="ck_font"></em> 비밀번호 확인</li>
		        <li>
		        <input type="password" name="cpwd_ck" class="mbinput3" maxlength="14" placeholder="동일한 패스워드를 입력하세요">
		        </li>
	        </c:if>
	        <c:if test="${result == 0}">
	        	 <li style="width:0%;"></li>
	        	<li style="width:100%; text-align:center;">
	        	입력하신 정보는 회원가입 되어있지 않습니다
	        	</li>
	        </c:if>
	        </ol>
        </c:if>
        
      	</form>
        </span>
        <span class="span_buttons">
        
		<c:if test="${cri == 'id'&& result != null}">
        <button type="button" class="next_btn1_1" onclick="location.href='${pageContext.request.contextPath}/raemian_client/userlogin'">로그인 하기</button>
        </c:if>
        <c:if test="${ cri == 'pwd'  &&  result > 0 }">
        <button type="button" class="next_btn1_1" @click="goupdate">변경 하기</button>
        </c:if>
       	 <button type="button" class="next_btn1_1" onclick="history.go(-1)"> 뒤로 가기</button>
       <c:if test="${ result == null or result == '0'}">
       		 <button type="button" class="next_btn1_1"onclick="location.href='${pageContext.request.contextPath}/raemian_client/join_agree'">회원가입</button>
         </c:if>
           <%--  --%>
        </span>
      </fieldset>
      </span>
      
      
<!-- 서브 화면 종료 -->
<%@ include file="./copywriter.jsp" %>
</body>
<script>
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/searchResult.js?v=<%=today%>"></script>
</html>
