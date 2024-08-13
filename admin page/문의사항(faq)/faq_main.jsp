<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<% Date today = new Date();
ArrayList<String> al = (ArrayList<String>)request.getAttribute("All_list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/page_default.css?v=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_css.css?v=">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css?v=33">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css?v=<%=today%>">
<!-- 신규추가된 css 파일 끝-->
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
<style>
	#guideBox li {margin-left: -30px;}
</style>
<title>관리자 페이지</title>
<script>
</script>
</head>
<body>
<div id="guideBox">
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li>(js 활용)질문 클릭시 해당되는 답변 출력. 다른 질문을 클릭시 해당 답변은 다시 화면에서 사라짐 </li>
			<li>글 작성자가 아니면 삭제 불가 (슈퍼계정은 예외로 삭제 가능)(js에서 슈퍼계정인지 확인 처리)</li>
		</ul>
	</div>
	<div>#구현 예정 기술
		<ul>
			<li></li>
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>
<!-- FAQ 리스트 시작 -->
<main class="page_main" id="vueBox">

	<section class="page_section">
	<div class="listbody">
	    <div class="protitle">FAQ 관리</div>
	    <div class="procho">
	       <section class="search_part">
	        <ol>
	        <li>FAQ내용 검색</li>
	        <li>
	        <form  id="f" action="${pageContext.request.contextPath}/raemian_admin/faq/faq_main" enctype="application/x-www-form-urlencoded" method="get" autocomplete="off">
		        <input type="text" name="search" value="${search}" class="search_input">
		        <input type="submit" value="검색" class="datebtn">
	        </form>
	        </li>        
	        <li></li>
	        <li></li> 
	        </ol>
	       </section> 
	       <section class="data_listsview2">
	       <ul>
	        <li>QA</li>
	        <li>질문/답변</li>
	        <li>글쓴이</li>
	        <li>등록일</li>
	        <li>삭제</li>
	       </ul>
	          
	     <!-- 리스트 출력 반복문 : start  -->
	     <c:if test="${list != '[]'}">
	     <c:forEach items="${list}" var="li" varStatus="no">
	     <span>
	       <ul @click="viewAnswer('${li.fqidx}')">
	        <li>Q</li>
	        <li style="text-align: left; justify-content: flex-start;">${li.fqtitle}</li>
	        <li>${li.aname}</li>
	        <li><fmt:formatDate value="${li.fqdate}" pattern="yyyy-MM-dd" /></li>
	        <li>
	        <input type="button" value="삭제" class="delbtn" @click="del($event,'${li.fqidx}','${li.aidx}','<sec:authentication property="principal.adminDao.aidx"/>','<sec:authentication property="principal.adminDao.auth"/>')">
	        </li>
	       </ul>
	      <!-- display:none 또는 display:flex 로 해야합니다. -->
	       <ol style="display: none; background:#f5f5f5;" id="answer_${li.fqidx}">
	        <li>A</li>
	        <li style="text-align: left; justify-content: flex-start;">${li.fqanswer}</li>
	       </ol> 
	     </span>
	     </c:forEach>
		<!-- 리스트 출력 반복문 : end  -->      
	     </c:if>
	       <c:if test="${list == '[]'}">
		       <ul class="nodatas">
		        <li>등록된 FAQ 내용 없습니다.</li>
		       </ul>
	       </c:if>
	       
	       <span class="notice_btns">
	       <input type="button" value="FAQ 등록" class="meno_btn2" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/faq/faq_write'"></span>
	       <aside>
	          <!-- 페이지 : start -->
		        <div class="page_number">
		           <ul>
		           <li @click="lleft"><img src="${pageContext.request.contextPath}/resources/ico/double_left.svg"></li>
		           <li @click="left"><img src="${pageContext.request.contextPath}/resources/ico/left.svg"></li>
		           <%
		           		int pg = (int) Math.floor((al.size() - 1) / 10f) + 1;
			        	int ww = 1;
			        	while(ww <= pg){
		        	%>
		           <li @click="gopage('<%=ww %>')"><%=ww %></li> 
		            <% ww++; } %>
		           	<c:if test="${list == '[]'}">
			          <li onclick="location.reload()">1</li>
			        </c:if>
		           <li @click="right(<%= pg %>)"><img src="${pageContext.request.contextPath}/resources/ico/right.svg"> </li>
		            <li @click="rright(<%= pg %>)"><img src="${pageContext.request.contextPath}/resources/ico/double_right.svg"></li>
		           </ul>
		        </div>
		        <!-- 페이지 : end -->
	       </aside>
	       </section>
	    </div>
	</div> 
	</section>
</main>
<!-- FAQ 리스트 끝 -->
<footer>
<div class="menusize">Copyright ⓒ  Raemian 분양안내 관리 시스템 All rights reserved</div>    
</footer>
</body>
<script>
	var pg = '${view_no}';
	var search = '${search}';
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/faq_main.js?v=<%=today%>"></script>
</html>