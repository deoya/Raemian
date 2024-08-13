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
<!-- 신규추가된 css 파일 끝-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css?v=<%=today%>">
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
			<li>날짜, 시간 출력시 JSTL의 formatDate 활용</li>
			<li></li>
		</ul>
	</div>
	<div>♣참고 사항
		<ul>
			<li>client 에서 예약한 정보가 한페이지당 20개씩 출력됩니다</li>
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>
<!-- 회원관리 시작 -->
<main class="page_main" id="vueBox">
<section class="page_section">
<div class="listbody">
    <div class="protitle">사전예약 회원 관리</div>
    <div class="procho">
       <section class="search_part">
        <ol >
        <li>회원 검색</li>
        <li>
        <form id="f" action="${pageContext.request.contextPath}/raemian_admin/reserve/reserve_main" enctype="application/x-www-form-urlencoded" method="get" autocomplete="off">
        <select class="search_select" name="search_ch">
	        <option ${search_ch == '아이디' ? 'selected' : ''}>아이디</option>    
	        <option ${search_ch == '이름' ? 'selected' : ''}>이름</option>    
	        <option ${search_ch == '연락처' ? 'selected' : ''}>연락처</option>     
        </select>
        <input type="text" name="search"  id="sdate2" class="search_input"  value="${search}">
        <input type="submit" value="검색" class="datebtn">
        </form>
        </li>        
        <li></li>
        <li></li> 
        </ol>
       </section> 
       <section class="reserve_listsview">
       <ul>
        <li>번호</li>
        <li>아이디</li>
        <li>고객명</li>
        <li>연락처</li>
        <li>예약일자</li>
        <li>예약시간</li>
        <li>인원수</li>
        <li>예약취소</li>
       </ul>
       <c:if test="${list != '[]'}">
       		<!-- 고객 리스트 반복 : start -->
	        <c:forEach items="${list}" var="li" varStatus="no">
		       <ul>
		        <li>${fn:length(All_list) - (view_no - 1) * 20 - no.index}</li>
		        <li>${li.cid}</li>
		        <li>${li.cname}</li>
		        <li>${li.ctel}</li>
		        <li><fmt:formatDate value="${li.reservedate}" pattern="yyyy-MM-dd" /></li>
		        <li><fmt:formatDate value="${li.reservetime}" pattern="HH:mm" /></li>
		        <li>${li.rpersonnel}</li>    
		        <li>
		            <input type="button" value="취소" class="delbtn" @click="del($event, '${li.ridx}')">
		        </li>
		       </ul>
    	 </c:forEach>
     	<!-- 고객 리스트 반복 : end -->
     </c:if>
     <c:if test="${list == '[]'}">
       <ul class="nodatas">
        <li>사전예약 신청 회원이 없습니다.</li>
       </ul>
     </c:if>
       <aside>
        <!-- 페이지 : start -->
        <div class="page_number">
           <ul>
           <li @click="lleft"><img src="${pageContext.request.contextPath}/resources/ico/double_left.svg"></li>
           <li @click="left"><img src="${pageContext.request.contextPath}/resources/ico/left.svg"></li>
           <%
           		int pg = (int) Math.floor((al.size() - 1) / 30f) + 1;
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
<!-- 회원관리 끝 -->
<footer>
<div class="menusize">Copyright ⓒ  Raemian 분양안내 관리 시스템 All rights reserved</div>    
</footer>
</body>
<script>
	var pg = '${view_no}';
	var search = '${search}';
	var search_ch = '${search_ch}'
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/reserve_main.js?v=<%=today%>"></script>
</html>