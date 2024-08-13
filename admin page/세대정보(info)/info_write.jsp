<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% Date today = new Date(); %>
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
			<li>client 페이지에서 최대 4건까지 출력이 가능하게 했기 때문에,
				생성, 수정시 '사용 유/무' 갯수 확인을 AJAX로 처리
			 </li>
		</ul>
	</div>
	<div>#구현 예정 기술
		<ul>
			<li>이미지 저장시 섬네일을 별도 저장(Thumbnailator 활용 예정)</li>
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>
<!-- 세대정보 입력 시작 -->
<form id="f">
	<c:if test="${data.getFidx() != null}">
		<input type="hidden" name="idx" value="${data.getFidx()}">
		<input type="hidden" name="o_uploadPath" value="${data.getUploadPath()}">
		<input type="hidden" name="o_fimg" value="${data.getFimg()}">
	</c:if>
	<c:if test="${data.getFidx() == null}">
		<input type="hidden" name="idx" value="0">	
	</c:if>
	<input type="hidden" name="aidx" value="<sec:authentication property='principal.adminDao.aidx'/>">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<main class="page_main">
	<section class="page_section">
	<div class="listbody" id="vueBox">
	    <div class="protitle">환경설정 등록</div>
	    <div class="procho">
	       <section class="data_listsview">
	       <ol>
	       <li>주거타입</li>
	       <li><input type="text" name="ftype" value="${data.getFtype()}" class="notice_in in2"> ※ 예) 74A 타입</li>
	       <li>글쓴이</li>
	       <li><input type="text" name="aname" class="notice_in in2" value="<sec:authentication property='principal.adminDao.aname'/>" readonly></li> <li>주거전용</li>
	       <li><input type="text" name="household" value="${data.getHousehold()}" class="notice_in in2">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
	       <li>주거공용</li>
	       <li><input type="text" name="houseShared" value="${data.getHouseShared()}" class="notice_in in2">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
	       <li>기타공용</li>
	       <li><input type="text" name="etcShared" value="${data.getEtcShared()}" class="notice_in in2">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
	       <li>계약면적</li>
	       <li><input type="text" name="contractArea" value="${data.getContractArea()}" class="notice_in in2">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
	       <li>이미지 URL</li>
	       <li><input type="file" name="file" class="notice_in in1" @change="fileck($event)">&nbsp;&nbsp;&nbsp; <c:if test="${data.getFimg() == null}">※ 이미지 등록은 필수 입니다</c:if><c:if test="${data.getFimg() != null}">※ 첨부하지 않을시 이전 파일이 유지 됩니다</c:if></li> 
	       <li>사용 유/무</li>
	       <c:if test="${data.getFuse() == 'O'}">
	       	<li><input type="radio" name="fuse" class="radio_txt" value="O" checked @click="countck">사용함 <input type="radio" name="fuse" class="radio_txt" value="X">사용안함</li>
	       </c:if>
	       <c:if test="${data.getFuse() == 'X' || data == null }">
	       	<li><input type="radio" name="fuse" class="radio_txt" value="O"  @click="countck">사용함 <input type="radio" name="fuse" class="radio_txt" value="X" checked>사용안함</li>
	       </c:if>
	       <li>출력순서</li>
	       <li><input type="text" name="foutputOrder" value="${data.getFoutputOrder()}" class="notice_in in2">&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요 단, 동일한 이름일 경우 데이터 등록된 순으로 출력 됩니다.</li>
	       </ol>
	       <span class="notice_btns">
	       <input type="button" value="주거타입 등록" class="meno_btn2" @click="insert"></span>
	       </section>
	    </div>
	</div> 
	</section>
	</main>
</form>
<!-- 세대정보 입력 끝 -->
<footer>
<div class="menusize">Copyright ⓒ  Raemian 분양안내 관리 시스템 All rights reserved</div>    
</footer>
</body>
<script>
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/info_write.js?v=<%=today%>"></script>
</html>