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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css?v=<%=today%>">
<style>
	#fileul img { width: 60px;}
	#guideBox li {margin-left: -30px;}
</style>

<!-- 신규추가된 css 파일 끝-->
 <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
<title>관리자 페이지</title>
<script>
</script>
</head>
<body>
<div id="guideBox">
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li> FTP 서버에서 파일 저장 (exe|sh|zip|alz은 불가능하게 js에서 처리)</li>
			<li> 파일 저장시 년도 / 월 / 일 순으로 폴더를 자동생성 후 파일 명 앞에 중복 방지를 위한 랜덤문자를 생성 (UUID활용)</li>
			<li> ckeditor 탑재</li>
			<li> 섬네일(Thumbnailator) 출력 가능. 다수의 파일 저장 가능 (총 3개까지)</li>
		</ul>
	</div>
	<div>#구현 예정 기술
		<ul>
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>
<!-- 공지사항 등록 시작 -->
<main class="page_main" id="vueBox">
<form id="f">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="aidx" value="<sec:authentication property='principal.adminDao.aidx'/>">
	<section class="page_section">
		<div class="listbody">
		    <div class="protitle">공지사항 등록</div>
		    <div class="procho">
		       <section class="data_listsview">
		       <ol>
		       <li>공지제목</li>
		       <li><input type="text" name="ntitle" class="notice_in in1"></li>
		       <li>글쓴이</li>
		       <li><input type="text" name="aname" class="notice_in in2" value="<sec:authentication property='principal.adminDao.aname'/>" readonly></li>
		       <li style="height:520px;">내용</li>
		       <li style="height:520px; padding-top: 10px;">
		       <textarea id="incontent" name="ncontent" class="notice_in in3"></textarea>
		       </li>       
		       <li>첨부파일</li>
		       <li>
		       		<input type="file" name="ajaxfile"  @change="fileajax($event)" multiple>
		       		<ul id="fileul" style="display: flex; flex-flow: row; margin-top:13px;">
		       		</ul>
		       		
		       	</li>   
		       </ol>
		       <span class="notice_btns">
		       <input type="button" value="글등록" class="meno_btn2" @click="insert"></span>
		       </section>
		    </div>
		</div> 
	</section>
</form>
</main>
<!-- 공지사항 등록 끝 -->
<footer>
<div class="menusize">Copyright ⓒ  Raemian 분양안내 관리 시스템 All rights reserved</div>    
</footer>
</body>
<script>
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/notice_write.js?v=<%=today%>"></script>
</html>