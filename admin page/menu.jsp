<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
<nav>
<div class="menusize">
    <ul id="menus">
        <li class="topmenu1" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/admin/admin_main'" style="cursor: pointer;">ADMINISTRATOR</li>
        <li class="topmenu2" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/info/info_main'">환경설정</li>
        <li class="topmenu2" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/customer/member_main'">회원관리</li>
        <li class="topmenu2" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/notice/notice_main'">공지사항 관리</li>
        <li class="topmenu2" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/faq/faq_main'">1:1 문의사항</li>
        <li class="topmenu2" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/reserve/reserve_main'">예약현황</li>
        <li class="topmenu2" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/admin/config_main'">관리자현황</li>
        <li class="topmenu3"><sec:authentication property="principal.adminDao.aname"/>님 환영합니다  <a style="cursor:pointer; color:white;" onclick="gologout()">[로그아웃]</a></li>
    </ul>
 </div>
<div class="menuline"></div>
</nav>

<form id="logout" action="${pageContext.request.contextPath}/raemian_admin/logoutpage" method='post'>
	<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
</form>

<script>
	function gologout(){
		if(confirm("로그아웃하시겠습니까?")) document.getElementById('logout').submit();
	}
</script>
