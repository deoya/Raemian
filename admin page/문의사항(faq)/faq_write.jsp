<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Date today = new Date();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/page_default.css?v=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_css.css?v=">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css?v=">
<!-- 신규추가된 css 파일 끝-->
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
<style>
	#guideBox li {margin-left: -30px;}
</style>
<title>관리자 페이지</title>
<script>
</script>
</head>
<body>
<%@ include file="../menu.jsp" %>
<main class="page_main" id="vueBox">
<form id="f">
<input type="hidden" name="aidx" value="<sec:authentication property='principal.adminDao.aidx'/>">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<section class="page_section">
<div class="listbody">
    <div class="protitle">FAQ 등록</div>
    <div class="procho">
       <section class="data_listsview">
       <ol>
       <li>질문</li>
       <li><input type="text" name="fqtitle" class="notice_in in1"></li>
       <li>글쓴이</li>
       <li><input type="text" name="aname" class="notice_in in2" value="<sec:authentication property='principal.adminDao.aname'/>" readonly></li>
       <li style="height:520px;">답변</li>
       <li style="height:520px; padding-top: 10px;">
       <textarea name="fqanswer" id="incontent" class="notice_in in3"></textarea>
       </li>      
       </ol>
       <span class="notice_btns">
       <input type="button" value="FAQ 등록" class="meno_btn2" @click="insert"></span>
       </section>
    </div>
</div> 
</section>
</form>
</main>
<!-- FAQ 등록 끝 -->
<footer>
<div class="menusize">Copyright ⓒ  Raemian 분양안내 관리 시스템 All rights reserved</div>    
</footer>
</body>
<script>
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/faq_write.js?v=<%=today%>"></script>
</html>