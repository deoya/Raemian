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
			<li>삭제시, 예약정보가 있을시에 함께 삭제 (트랜잭션 처리)</li>
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>
<!-- 회원관리 시작 -->
<%-- --%>
<main class="page_main" id="vueBox">
<section class="page_section">
<div class="listbody">
    <div class="protitle">회원 관리</div>
    <div class="procho">
       <section class="search_part">
        <ol>
        <li>회원 검색</li>
        <li>
        <form id="f" action="${pageContext.request.contextPath}/raemian_admin/customer/member_main" enctype="application/x-www-form-urlencoded" method="get" autocomplete="off">
	        <select class="search_select" name="search_ch">
		        <option ${search_ch == '아이디' ? 'selected' : ''}>아이디</option>    
		        <option ${search_ch == '이름' ? 'selected' : ''}>이름</option>    
		        <option ${search_ch == '연락처' ? 'selected' : ''}>연락처</option>    
	        </select>
	        <input type="text" name="search" id="sdate2" class="search_input" value="${search}">
	        <input type="submit" value="검색" class="datebtn">
	    </form>
        </li>        
        <li></li>
        <li></li> 
        </ol>
       </section> 
       <section class="member_listsview">
       <ul>
        <li>번호</li>
        <li>아이디</li>
        <li>고객명</li>
        <li>연락처</li>
        <li>이메일</li>
        <li>주소</li>
        <li>이메일</li>
        <li>전화</li>
        <li>우편물</li>
        <li>SMS</li>
        <li>삭제</li>
       </ul>
       <c:if test="${list != '[]'}">
       		<!-- 고객 리스트 반복 : start -->
	        <c:forEach items="${list}" var="li" varStatus="no">
		       <ul>
		        <li>${fn:length(All_list) - (view_no - 1) * 20 - no.index}</li>
		        <li>${li.cid}</li>
		        <li>${li.cname}</li>
		        <li>${li.ctel}</li>
		        <li>${li.cemail}</li>
		        <li style="justify-content: flex-start;">(${li.cadrr_n}) ${li.cadrr_1} ${li.cadrr_2}</li>
		        <li>${fn:substring(li.cad,0,1)}</li>   
		        <li>${fn:substring(li.cad,2,3)}</li>  
		        <li>${fn:substring(li.cad,4,5)}</li>   
		        <li>${fn:substring(li.cad,6,7)}</li>   
		        <li>
		            <input type="button" value="삭제" class="delbtn" @click="del($event,'${li.cidx}')">
		        </li>
		       </ul>
	       </c:forEach>
       		<!-- 고객 리스트 반복 : end -->
       </c:if>
       <c:if test="${list == '[]'}">
	       <ul class="nodatas">
	        <li>등록된 회원이 없습니다.</li>
	       </ul>
       </c:if>
       <aside>
         <!-- 페이지 : start -->
        <div class="page_number">
           <ul>
           <li @click="lleft"><img src="${pageContext.request.contextPath}/resources/ico/double_left.svg"></li>
           <li @click="left"><img src="${pageContext.request.contextPath}/resources/ico/left.svg"></li>
           <%
           		int pg = (int) Math.floor((al.size() - 1) / 20f) + 1;
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
<script src="${pageContext.request.contextPath}/resources/js/member_main.js?v=<%=today%>"></script>
</html>