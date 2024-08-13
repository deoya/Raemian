<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Date today = new Date(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_css.css?">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css?v=<%=today%>">
<style>
	#guideBox li {margin-left: -30px;}
</style>

<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>

<style>
	#guideBox li {margin-left: -30px;}
</style>
<title>관리자 페이지</title>
</head>
<body>
	<div id="guideBox">
		<div class="click">★</div>
		<div>#구현 기술
			<ul>
				<li>spring-security 로그인</li>
				<li>이용차단된 계정과, 비밀번호만 틀린경우와, 아이디만 틀린경우는 각각 별도 메세지 처리 (AuthenticationFailureHandler,AuthenticationSuccessHandler 활용)</li>
				<li>비밀번호 5회 초과하여 틀릴 시 자동 차단 (기본 제공 계정인 admin은 차단되지 않습니다)</li>
			</ul>
		</div>
		<div>#구현 예정 기술
			<ul>
				<li></li>
			</ul>
		</div>
	</div>

  <div id="vueBox" class="adbody">
      <div class="adtitle">ADMINISTRATOR</div>
      <div class="admoom">
       <form role="form" method='post' action="./login">
          <div class="intotal"> 
            <div class="adin1">
              <input type="text" name="username" class="loginid" placeholder=" 아이디">
            </div>
            <div class="adin2">
              <input type="password" name="password" class="loginpass" placeholder="패스워드">
            </div>
          </div>
          <div class="adbt">
            <button type="submit" class="loginbt1">로그인</button>
            <button type="button" class="loginbt2" id="member_add" onclick="location.href='${pageContext.request.contextPath}/admin_ship'">회원가입</button>
          </div>
          <div class="adinfomain">
            <ul>
               <li class="adinfo">※ 계정 로그인 : (ID) admin (PW)aa123456 </li>
               <li class="adinfo">※ 사원번호가 없을시 관리자에게 연락 바랍니다.</li>
               <li class="adinfo">※ 모든 정보는 기록되어 집니다.</li>
               <li class="adinfo">※ 퇴사시 해당 정보는 접속이 불가능 하게 됩니다.</li>
            </ul>
          </div>
          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
         </form>
        </div>
      </div>
    <%
        String errorMessage = (String) session.getAttribute("errorMessage");
        if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
            <script>
                alert("<%= errorMessage %>");
            </script>
    <%
            session.removeAttribute("errorMessage");
        }
    %>

    </body>
    <script>
	   
    
    </script>
    </html>