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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css?v=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css?v=<%=today%>">
<!-- 신규추가된 css 파일 끝-->

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
			<li>글 작성자가 아니면 삭제 불가 (슈퍼계정은 예외로 삭제 가능)(js에서 슈퍼계정인지 확인 처리)</li>
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>


<main class="page_main" id="vueBox">
<section class="page_section">
<div class="listbody">
    <div class="protitle">공지사항 관리</div>
    <div class="procho">
       <section class="search_part">
        <ol>
        <li>공지사항 검색</li>
        <li>
        <form id="f" action="${pageContext.request.contextPath}/raemian_admin/notice/notice_main" enctype="application/x-www-form-urlencoded" method="get" autocomplete="off">
        	<input type="text" name="search" value="${search}" id="sdate2" class="search_input">
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
        <li>제목</li>
        <li>첨부파일 유/무</li>
        <li>조회수</li>
        <li>글쓴이</li>
        <li>등록일</li>
        <li>삭제</li>
       </ul>
        <c:if test="${list != '[]'}">
        <!-- 리스트 출력 반복문 : start  -->
         	<c:forEach items="${list}" var="li" varStatus="no">
	        <ul onclick="location.href='${pageContext.request.contextPath}/raemian_admin/notice/notice_view/${li.nidx}'">
		        <li>${fn:length(All_list) - (view_no - 1) * 10 - no.index}</li>
		        <li style="text-align: left; justify-content: flex-start;">${li.ntitle}</li>
		        <li>
		        	<c:if test='${li.nfile != null }'>O</c:if> 
		        	<c:if test='${li.nfile == null }'>X</c:if> 
		        </li>
		        <li>${li.ncnt}</li>
		        <li>${li.aname}</li>
		         
		        <li><fmt:formatDate value="${li.nupdate}" pattern="yyyy-MM-dd" /></li>
		        
		        <li>
		        	<c:if test='${li.nfile != null }'> <input type="button" value="삭제" class="delbtn" @click="del_file($event,'${li.nidx}','${li.filetype}','${li.uuid}','${li.nfile}','${li.uploadPath}','${li.aidx}','<sec:authentication property="principal.adminDao.aidx"/>','<sec:authentication property="principal.adminDao.auth"/>')"></c:if> 
		        	<c:if test='${li.nfile == null }'> <input type="button" value="삭제" class="delbtn"  @click="del($event,'${li.nidx}','${li.aidx}','<sec:authentication property="principal.adminDao.aidx"/>','<sec:authentication property="principal.adminDao.auth"/>')"></c:if> 
		        </li>
		        
	       </ul>
	       </c:forEach>
       </c:if>
       <c:if test="${list == '[]'}">
	       <ul class="nodatas">
	        <li>등록된 공지사항이 없습니다.</li>
	       </ul>
       </c:if>
       <span class="notice_btns">
       <input type="button" value="글쓰기" class="meno_btn2" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/notice/notice_write'"></span>
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
<!-- 공지사항 관리 끝 -->

<footer>
<div class="menusize">Copyright ⓒ  Raemian 분양안내 관리 시스템 All rights reserved</div>    
</footer>
</body>
<script>
	var pg = '${view_no}';
	var search = '${search}'
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/notice_main.js?v=<%=today%>"></script>
</html>