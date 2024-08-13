<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% Date today = new Date();
%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css?v=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css">
<!-- 추가된 css -->
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
</head>

<body>
<div id="guideBox" >
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li>admin페이지와 동일</li>
			<li>@PathVariable를 활용하여 주소를 깔끔하게 정리</li>
			<li>자동으로 조회수 +1 카운팅 되게 sql 처리</li>
		</ul>
	</div>
	<br>
	<div>♣참고 사항
		<ul>
			<li>VIEW 페이지는 원본파일엔 없었지만 직접 추가한것이므로, 디자인이 어색할 수 있습니다 </li>
		</ul>
	</div>
</div>

<%@ include file="../menu.jsp" %>
<!-- 서브 화면 시작 -->
<main class="page_main" style="margin-top: 120px;">
<section class="page_section">
<div class="listbody">
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
       <li>첨부파일</li>
       <li class="text_in"><a target="_blank" href="http://deoya.cdn1.cafe24.com/${data.getUploadPath()}${data.getNfile()}">${data.getNfile_name()}</a></li>   
       </ol>
       <span class="notice_btns">
       <input type="button" value="목록" class="meno_btn2" onclick="location.href='${pageContext.request.contextPath}/raemian_client/various/notice'"></span>
       </section>
    </div>
</div> 
</section>
</main>
<!-- 서브 화면 종료 -->
<%@ include file="../copywriter.jsp" %>
</body>
<script>
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/notice.js?v=<%=today%>"></script>
</html>
