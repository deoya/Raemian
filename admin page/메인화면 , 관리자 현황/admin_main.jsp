<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Date today = new Date(); %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_css.css?v=29">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/page_default.css?v=24">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css?v=<%=today%>">
<style>
	#guideBox li {margin-left: -30px;}
</style>
<title>관리자 페이지</title>
</head>
<body>
<div id="guideBox">
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li>일반회원 최신 가입자 1건 출력 </li>
			<li>1:1 문의사항 최신 1 건 출력 </li>
			<li>예약현황 최신 2건 출력</li>
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>



<main>
<section>
   <div class="ad_top" ></div>
   
 <div class="ad_mainall">
   <div class="ad_main">
<!-- 일반회원 리스트 :start -->
       <div class="ad_main1">
         <ul>
            <li class="ad_maintitle">일반회원</li>
            <li class="ad_mainbox">
            <c:if test="${customer != null}">
            <ol>
                <li>아이디</li>
                <li>고객명</li>
                <li>연락처</li>
                <li>이메일</li>
                <li>주소</li>
            </ol>
            <ol class="bgcancel">
                <li>${customer.getCid()}</li>
                <li>${customer.getCname()}</li>
                <li>${customer.getCtel()}</li>
                <li>${customer.getCemail()}</li>
                <li style="text-align: left;">(${customer.getCadrr_n()}) ${customer.getCadrr_1()} ${customer.getCadrr_2()}</li>
            </ol>
            </c:if>
            </li>
         </ul>
      </div>
   </div>
<!-- 일반회원 리스트 :end -->
<!-- FAQ 리스트 : start -->
   <div class="ad_main">
      <div class="ad_main1">
         <ul>
            <li class="ad_maintitle">1:1 문의사항</li>
            <li class="ad_mainbox">
			<c:if test="${faq != null}">
            <ol>
                <li style="width:80%">질문</li>
                <li style="width:10%">글쓴이</li>
                <li style="width:10%">등록일</li>
                
            </ol>
            <ol class="bgcancel">
                <li style="width:80%; text-align: left; padding-left : 40px;">${faq.getFqtitle()}</li>
                <li style="width:10%">${faq.getAname()}</li>
                <li style="width:10%"><fmt:formatDate value="${faq.getFqdate()}" pattern="yyyy-MM-dd" /></li>
            </ol>
            </c:if>
            </li>
         </ul>
      </div>
   </div>
<!-- FAQ 리스트 : end -->
<!-- info 리스트 : start -->
   <div class="ad_main">
      <div class="ad_main1">
         <ul>
            <li class="ad_maintitle">예약현황</li>
            <li class="ad_mainbox2">
            <c:if test="${reserve.size() != 0}">
            <ol>
                <li>아이디</li>
                <li>고객명</li>
                <li>연락처</li>
                <li>예약일자</li>
                <li>예약시간</li>
                <li>예약인원</li>
            </ol>
            <c:forEach items="${reserve}" var="re">
            <ol class="bgcancel">
                <li>${re.cid}</li>
                <li>${re.cname}</li>
                <li>${re.ctel}</li>
                <li><fmt:formatDate value="${re.reservedate}" pattern="yyyy-MM-dd" /></li>
                <li><fmt:formatDate value="${re.reservetime}" pattern="HH:mm" /></li>
                <li>${re.rpersonnel}</li>
            </ol>
            </c:forEach> 
            </c:if>
            </li> 
         </ul>
      </div>
   </div>
 </div>
<!-- info 리스트 : end -->
   <div class="ad_botom"></div>
</section>
</main>
<footer>
<div class="menusize">Copyright ⓒ Raemian 분양안내 관리 시스템 All rights reserved</div>
</footer>
<script>
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/menus.js?v=1"></script>
</body>
</html>