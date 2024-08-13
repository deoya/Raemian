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
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>
<!-- 서브 화면 시작 -->
	<div id="vueBox">
    <label class="mbship_title">
        <p>NOTICE</p>
        <ul>
          <li>RAEMIAN 새로운 소식을 확인하세요</li>
        </ul>
      </label>
      <fieldset class="mbship_box">
        <ul>
        <li>번호</li>  
        <li>제목</li>  
        <li>조회수</li>     
        <li>글쓴이</li>  
        <li>등록일</li>      
        </ul>
        
      	<c:forEach items="${list}" var="li" varStatus="no">
	        <ul style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/raemian_client/various/notice_view/${li.nidx}'">
	        <li>${fn:length(All_list) - (view_no - 1) * 10 - no.index}</li>  
	        <li style="text-align: left;">${li.ntitle}</li>  
	        <li>${li.ncnt}</li>     
	        <li>${li.aname}</li>  
	        <li><fmt:formatDate value="${li.nupdate}" pattern="yyyy-MM-dd" /></li>      
	        </ul>  
		</c:forEach>        
        <span class="pages">
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
        </span>
        <form id="f" action="${pageContext.request.contextPath}/raemian_client/various/notice" enctype="application/x-www-form-urlencoded" method="get" autocomplete="off">
        <span class="search_css">
        <input type="text" name="search" value="${search}" class="search_in" placeholder="검색할 제목을 입력하세요">
        <input type="submit" value="검색"  class="search_btn">
        </span>
        </form>
      </fieldset>
    </div>
<!-- 서브 화면 종료 -->
<%@ include file="../copywriter.jsp" %>
</body>
<script>
	var pg = '${view_no}';
	var search = '${search}';
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/notice.js?v=<%=today%>"></script>
</html>
