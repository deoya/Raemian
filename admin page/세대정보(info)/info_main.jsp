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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_css.css?v=333">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css?v=">
<!-- 신규추가된 css 파일 끝-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css?v=<%=today%>">
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
<title>관리자 페이지</title>
<style>
	#guideBox li {margin-left: -30px;}
</style>
<script>
</script>
</head>
<body>
<div id="guideBox">
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li>INSTR를 활용한 소수점 이하 포함 검색 </li>
			<li>출력 순서에 따라 리스트 변화 적용 (번호가 동일할시 등록날짜 기준)</li>
		</ul>
	</div>
	<div>#구현 예정 기술
		<ul>
			<li>이미지 출력시 원본이 아닌 섬네일로 대체</li>
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>
<!-- 환경설정 관리 시작 -->
<main class="page_main" id="vueBox">
<section class="page_section">
<div class="listbody">
    <div class="protitle">환경설정 관리</div>
    <div class="procho">
       <section class="search_part">
        <ol>
        <li>주거전용면적 검색</li>
        <li>
        <form id="f" action="${pageContext.request.contextPath}/raemian_admin/info/info_main" enctype="application/x-www-form-urlencoded" method="get" autocomplete="off">
        	<input type="text" name="search" id="sdate2" class="search_input" value="${search}">
        	<input type="submit" value="검색" class="datebtn">
        </form>
        </li>        
        <li></li>
        <li></li> 
        </ol>
       </section> 
       <section class="data_listsview">
       <ul>
        <li>번호</li>
        <li>세대타입 및 면적</li>
        <li>사용 유/무</li>
        <li>출력순서</li>
        <li>글쓴이</li>
        <li>등록일</li>
        <li>삭제</li>
       </ul>
       <c:if test="${list != '[]'}">
       <!-- 리스트 출력 반복문 : start  -->
	       <c:forEach items="${list}" var="li" varStatus="no">
		       <ul style="height:140px;" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/info/info_write/${li.fidx}'">
		        <li>${fn:length(All_list) - (view_no - 1) * 4 - no.index}</li>
		        <li style="text-align: left; justify-content: flex-start;">
		        <div class="info_img">
		        	<img referrerpolicy="no-referrer" src="http://deoya.cdn1.cafe24.com/${li.uploadPath}${li.fimg}"> 
		        </div>
		        <div class="info_text">
		        <span>주거타입 : ${li.ftype}</span>
		        <span>주거전용 : ${li.household}</span>
		        <span>주거공용 : ${li.houseShared}</span>
		        <span>기타공용 : ${li.etcShared}</span>
		        <span>계약면적 : ${li.contractArea}</span>
		        </div>
		        </li>
		        <li>${li.fuse}</li>
		        <li>${li.foutputOrder}</li>
		        <li>${li.aname}</li>
		        <li><fmt:formatDate value="${li.fdate}" pattern="yyyy-MM-dd" /></li>
		        <li>
		            <input type="button" value="삭제" class="delbtn" @click="del($event,'${li.fidx}','${li.uploadPath}','${li.fimg}')">
		        </li>
		       </ul>
	       </c:forEach>
       <!-- 리스트 출력 반복문 : end  -->
       </c:if>
       <c:if test="${list == '[]'}">
	       <ul class="nodatas">
	        <li>등록된 세대타입 내용이 없습니다.</li>
	       </ul>
       </c:if>
       <span class="notice_btns">
       <input type="button" value="세대타입 생성" class="meno_btn2" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/info/info_write'"></span>
       <aside>
       
       <!-- 페이지 : start -->
        <div class="page_number">
           <ul>
           <li @click="lleft"><img src="${pageContext.request.contextPath}/resources/ico/double_left.svg"></li>
           <li @click="left"><img src="${pageContext.request.contextPath}/resources/ico/left.svg"></li>
           <%
	        	int pg = (int) Math.floor((al.size() - 1) / 4f) + 1;
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
<!-- 공지사항 관리 끝 -->
<footer>
<div class="menusize">Copyright ⓒ  Raemian 분양안내 관리 시스템 All rights reserved</div>    
</footer>
</body>
<script>
	var pg = '${view_no}';
	var search = '${search}';
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/info_main.js?v=<%=today%>"></script>
</html>