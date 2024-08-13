<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% Date today = new Date(); %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/page_default.css?v=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_css.css?v=">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css?v=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css">
<!-- 신규추가된 css 파일 끝-->
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
			<li> FTP 서버에서 이미지 불러오기(이미지만 새창으로 불러오기 하며, 그 외 파일은 다운로드 됩니다)</li>
			<li>@PathVariable를 활용하여 주소를 깔끔하게 정리</li>
		</ul>
	</div>
	<div>#구현 예정 기술
		<ul>
			<li>첨부파일에서 이미지는 섬네일로 작게 출력되어 보여지며, 그 외 파일은 별도의 아이콘으로 출력</li>
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>
<!-- 공지사항 내용확인 시작 -->
<main class="page_main">
<section class="page_section">
<div class="listbody">
    <div class="protitle">공지사항 확인</div>
    <div class="procho">
       <section class="data_listsview">
       <ol>
       <li>공지제목</li>
       <li class="text_in">${data.getNtitle()}</li>
       <li>글쓴이</li>
       <li class="text_in">${data.getAname()}</li> 
       <li style="height:520px;">내용</li>
       <li style="height:520px; padding-top: 10px;">
       <div class="text_in2">${data.getNcontent()}</div>
       </li>       
       <li style="width:100%;">
       		<ul style="width:inherit">
       		<li style="width:15%; float: left;">첨부파일</li>
       	<c:forEach items="${files}" var="file">
       		<li  class="text_in"  style="width:15%; float: left;">
       		 <a target="_blank" href="http://deoya.cdn1.cafe24.com/${file.uploadPath}${file.uuid}${file.nfile}">${file.nfile}</a>
       		
       		</li>
       	</c:forEach>
       	</ul>
       </li>
       </ol>
       <span class="notice_btns">
       <input type="button" value="목록" class="meno_btn2" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/notice/notice_main'"></span>
       </section>
    </div>
</div> 
</section>
</main>
<!-- 공지사항 내용확인 끝 -->
<footer>
<div class="menusize">Copyright ⓒ  Raemian 분양안내 관리 시스템 All rights reserved</div>    
</footer>
</body>
</html>