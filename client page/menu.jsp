<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
<!-- wrap -->
<div id="wrap">
	<!-- header 로고 & 대메뉴,소메뉴 -->
	<header id="hd">
    <div class="top_menu">
        <ul class="top_menu_list">
        <!--로그인 후 -->
        <sec:authorize access="hasRole('ROLE_CUSTOMER')">
        <sec:authorize access="isAuthenticated()">
        	<li><sec:authentication property="principal.dao.cname"/>님 환영합니다 <a style="cursor:pointer; color:#a0a0a0;" onclick="gologout()">[로그아웃]</a></li>
        </sec:authorize>
        </sec:authorize>
        <!-- 로그인 전 -->
        <sec:authorize access="isAnonymous() or hasRole('ROLE_ADMIN')">
        	<li onclick="location.href='${pageContext.request.contextPath}/raemian_client/userlogin'">로그인</li>
        </sec:authorize>
        <li onclick="location.href='${pageContext.request.contextPath}/raemian_client/join_agree'">회원가입</li>
        <li onclick="location.href='${pageContext.request.contextPath}/raemian_client/various/faq'">FAQ</li>
        <li onclick="location.href='${pageContext.request.contextPath}/raemian_client/various/notice'">공지사항</li>
        </ul>
    </div>
        <div class="top">
            <h1><a href="${pageContext.request.contextPath}/raemian_client/index" class="icon-hd-logo"></a></h1>
            <nav id="gnb">
                <li>
                    <a href="${pageContext.request.contextPath}/raemian_client/sub01"><span>사업정보</span></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/raemian_client/sub01">지구안내</a></li>
                        <li><a href="${pageContext.request.contextPath}/raemian_client/sub02">입지안내</a></li>
                        <li><a href="">지역조감도</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/raemian_client/sub03"><span>단지정보</span></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/raemian_client/sub03">단지안내</a></li>
                        <li><a href="">시스템</a></li>
                        <li><a href="">단지배치도</a></li>
                        <li><a href="">동호배치도</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><span>세대정보</span></a>
                    <ul>
                        <li><a href="">타입별 평면도</a></li>
                        <li><a href="">인테리어</a></li>
						<li><a href="">사이버모델하우스</a></li>
						<li><a href="">인테리어마감재</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><span>공급정보</span></a>
                    <ul>
                       <li><a href="">입주자 모집공고</a></li>
                        <li><a href="">E-카달로그</a></li>
                         <li><a href="">공급일정 안내</a></li>
                        <li><a href="">오시는 길</a></li>
                      <li><a href=""></a></li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/raemian_client/reservation/reservation_in"><span>사전방문예약</span></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/raemian_client/reservation/reservation_in">사전방문예약</a></li>
                        <li><a href="${pageContext.request.contextPath}/raemian_client/reservation/reservation_ck">사전방문예약확인</a></li>
                        <li><a href="${pageContext.request.contextPath}/raemian_client/reservation/reservation_cancel">사전방문예약취소</a></li>
                    </ul>
                </li>
            </nav>
        </div>
	</header>
	<!-- header 로고 & 대메뉴,소메뉴 끝 -->


<div id="container">
<div id="index">

<form id="logout" action="${pageContext.request.contextPath}/raemian_client/logoutpage" method='post'>
	<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
</form>

<script>
	function gologout(){
		if(confirm("로그아웃하시겠습니까?")) document.getElementById('logout').submit();
	}
</script>

    