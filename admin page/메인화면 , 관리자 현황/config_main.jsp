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
<style>
.page_number {
    width: 1200px;
    height:40px;
    font-size: 12px;
}

.page_number > ul {
	list-style: none;
    width: 100%;
    height:inherit;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content:center;
}
.page_number > ul > li{
    width: 30px;
    height: 30px;
    text-align: center;
    line-height: 30px;
    background-color: gainsboro;
    margin-right: 5px;
    margin-left: 5px;
    cursor: pointer;
}
.page_number > ul > li > img {
	width: 12px;
    height: 12px;
    object-fit: cover;
    vertical-align: middle;
}
	#guideBox li {margin-left: -30px;}
	
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css?v=<%=today%>">
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>

<title>관리자 페이지</title>
</head>
<body>
<div id="guideBox">
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li>(js처리)현황 변경 전 사항과 동일할 시엔 '변경할 사항이 없습니다'알림 발생</li>
			<li>(js처리)슈퍼계정은 퇴직처리 불가 + 현재 기본적으로 제공하는 테스트 계정도 퇴직처리 불가능합니다</li>
			<li>소속만 검색 가능</li>
			<li>전체버튼 클릭시 모든 정보 출력(첫 진입화면과 동일)</li>
		</ul>
	</div>
	<div>♣참고 사항
		<ul>
			<li>적용 버튼은 현황을 변경할시에 누르시면 됩니다</li>
			<li>퇴직 처리된 계정은 로그인이 되지 않습니다</li>
		</ul>
	</div>
</div>
<%@ include file="../menu.jsp" %>
    
    
<!-- 관리자 리스트 시작 -->
    
<main class="page_main" id="vueBox">

<section class="page_section">
<div class="listbody">
 <div class="adlisttitle">관리자 현황</div>
 <form id="f"  action="${pageContext.request.contextPath}/raemian_admin/admin/config_main" enctype="application/x-www-form-urlencoded" method="get" autocomplete="off">
 <div class="procho">
    <ul>
        <li class="prochoL procfont">소속</li>
        <li class="prochoL ">
            <select name="search_assign" class="adlistcsel1">
                <option value="전체"  ${search_assign == '전체' ? 'selected' : ''}>전체</option>
                <option value="본사" ${search_assign == '본사' ? 'selected' : ''}>본사</option>
                <option value="경기도" ${search_assign == '경기도' ? 'selected' : ''}>경기도</option>
                <option value="인천" ${search_assign == '인천' ? 'selected' : ''}>인천</option>
                <option value="대전" ${search_assign == '대전' ? 'selected' : ''}>대전</option>
                <option value="세종" ${search_assign == '세종' ? 'selected' : ''}>세종</option>
                <option value="광주" ${search_assign == '광주' ? 'selected' : ''}>광주</option>
                <option value="대구" ${search_assign == '대구' ? 'selected' : ''}>대구</option>
                <option value="울산" ${search_assign == '울산' ? 'selected' : ''}>울산</option>
                <option value="전라남도" ${search_assign == '전라남도' ? 'selected' : ''}>전라남도</option>
                <option value="전라북도" ${search_assign == '전라북도' ? 'selected' : ''}>전라북도</option>
                <option value="충청남도" ${search_assign == '충청남도' ? 'selected' : ''}>충청남도</option>
                <option value="충청북도" ${search_assign == '충청북도' ? 'selected' : ''}>충청북도</option>
                <option value="경상남도" ${search_assign == '경상남도' ? 'selected' : ''}>경상남도</option>
                <option value="경상북도" ${search_assign == '경상북도' ? 'selected' : ''}>경상북도</option>
                <option value="제주도" ${search_assign == '제주도' ? 'selected' : ''}>제주도</option>  
            </select>
        </li>
    </ul>
 </div>
 <div class="procho">
    <ul>
        <li class="prochoL procfont">검색형식</li>
        <li class="prochoL ">
            <select class="adlistcsel1" name="search_ch">
                <option ${search_ch == '이름' ? 'selected' : ''}>이름</option>
                <option ${search_ch == '아이디' ? 'selected' : ''}>아이디</option>
                <option ${search_ch == '연락처' ? 'selected' : ''}>연락처</option>
            </select>
        </li>
        <li class="prochoL"><input type="text" name="search" value="${search}" class="adlistcsel1"></li>
        <li class="prochoL"><input type="submit" class="proclick" value="검색"></li>
        <li class="prochoL"><button type="button" class="proclick" @click="all_list">전체</button></li>
    </ul>
 </div>
 </form>
 <div class="protaball">
    <table width="1100">
        <thead>
            <tr style="color: white; background-color:rgb(67, 66, 66);">
                <td class="listcenter" width=50>NO</td>
                <td class="listcenter" width=150>구분</td>
                <td class="listcenter" width=150>아이디</td>
                <td class="listcenter" width=120>이름</td>
                <td class="listcenter" width=80>직책</td>
                <td class="listcenter" width=200>이메일</td>
                <td class="listcenter" width=120>연락처</td>
                <td class="listcenter" width=120>현황</td>
                <td class="listcenter" width=110>적용</td>
            </tr>
        </thead>
        <tbody>
        	<c:if test="${list == '[]'}">
            <tr height="30"><td class="listcenter" colspan="9">등록된 관리자가 없습니다.</td></tr>
            </c:if>
            <c:if test="${list != '[]'}">
        	<!-- 리스트 출력 반복문 : start  -->
        	<c:forEach items="${list}" var="li" varStatus="no">
	            <tr class="master_list">
	                <td class="listcenter" width=50>${fn:length(All_list) - (view_no - 1) * 10 - no.index}</td>
	                <td class="listcenter" width=150>${li.assign}</td>
	                <td class="listcenter" width=150>${li.aid}</td>
	                <td class="listcenter" width=120>${li.aname}</td>
	                <td class="listcenter" width=80>${li.aposition}</td>
	                <td class="listcenter" width=200>${li.aemail}</td>
	                <td class="listcenter" width=120>${li.atel}</td>
	                <td class="listcenter" width=120>
	                    <select class="adlistsel3" @change="app($event)">
	                        <option value="Y" ${li.approval == 'Y' ? 'selected' : ''}>근무중</option>
	                        <option value="N" ${li.approval == 'N' ? 'selected' : ''}>퇴직중</option>
	                    </select>
	                </td>
	                <td class="listcenter" width=110>
	                <button type="button" class="listclick" @click="appupdate('${li.aidx}','${li.approval}')" >적용</button></td>
	            </tr>
            </c:forEach>
            </c:if>
        </tbody>
    </table>
 </div>
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
</div>
<!-- 관리자 리스트 끝 -->    
</section>
</main>
<footer>
<div class="menusize">Copyright ⓒ  Raemian 분양안내 관리 시스템 All rights reserved</div>
</footer>
</body>
<script>
	var pg = '${view_no}';
	var search = '${search}';
	var search_ch = '${search_ch}'
	var search_assign = "${search_assign}"
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/config_main.js?v=<%=today%>"></script>
</html>