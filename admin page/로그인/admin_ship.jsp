<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Date today = new Date(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_css.css?">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css?v=<%=today%>">
<title>관리자 페이지</title>
<style>
	#guideBox li {margin-left: -30px;}
</style>
</head>
<body>
	<div id="guideBox" style="top:0;">
		<div class="click">★</div>
		<div>#구현 기술
			<ul>
				<li>중복체크를 하지 않으면 회원가입 불가능하게 처리(중복체크후 변경할 경우를 대비해 확인후 readOnly처리)</li>
			</ul>
		</div>
		<div>#구현 예정
			<ul>
				<li>매크로 방지를 위해 랜덤 이미지를 활용해 이미지속 인증번호 입력하여야만 회원가입할 수 있도록 처리</li>
			</ul>
		</div>
		<div>♣ 참고 사항
			<ul>
				<li>회원가입시 보통 계정으로 회원가입 됩니다 (슈퍼계정은 웹에서 만드는 기능은 구현시키지 않았습니다)</li>
				<li>client와 달리 인증번호확인 등이 없습니다(기획서에 적혀 있지 않았었습니다)</li>
			</ul>
		</div>
	</div>
	<div id="vueBox">
    <form id="f">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <div class="membody">
           <div class="adtitle">ADMINISTRATOR MEMBERSHIP</div>
           <div class="memoutline" >
              <div class="memsel1">
                <ul class="memu">
                    <li class="memfont">소속 및 부서선택</li>
                    <li class="memlisel1">
                        <select class="kosel" name="assign">
                            <option value="">소속선택</option>
                            <option value="본사">본사</option>
                            <option value="경기도">경기도</option>
                            <option value="인천">인천</option>
                            <option value="대전">대전</option>
                            <option value="세종">세종</option>
                            <option value="광주">광주</option>
                            <option value="대구">대구</option>
                            <option value="울산">울산</option>
                            <option value="전라남도">전라남도</option>
                            <option value="전라북도">전라북도</option>
                            <option value="충청남도">충청남도</option>
                            <option value="충청북도">충청북도</option>
                            <option value="경상남도">경상남도</option>
                            <option value="경상북도">경상북도</option>
                            <option value="제주도">제주도</option>                            
                        </select>
                    </li>
                </ul>
                <ul class="memu">
                    <li class="memlisel1">
                        <select class="kosel" name="ateam">
                            <option value="">부서선택</option>
                            <option value="임원">임원</option>
                            <option value="회계팀">회계팀</option>
                            <option value="영업팀">영업팀</option>
                            <option value="전산팀">전산팀</option>
                            <option value="디자인팀">디자인팀</option>
                            <option value="MD팀">MD팀</option>
                            <option value="고객관리팀">고객관리팀</option>
                        </select>
                    </li>
                  </ul>
              </div>
              <div class="memsel1">
                <ul class="memu">
                    <li class="memfont">이름</li>
                    <li><input type="text" class="admamber1" name="aname" placeholder="이름을 입력해 주세요"></li>
                    <li class="memfont1">직책</li>
                    <li>
                        <select class="kosel" name="aposition">
                            <option value="임원">임원</option>
                            <option value="실장">실장</option>
                            <option value="팀장">팀장</option>
                            <option value="부장">부장</option>
                            <option value="차장">차장</option>
                            <option value="과장">과장</option>
                            <option value="대리">대리</option>
                            <option value="주임">주임</option>
                            <option value="사원">사원</option>
                            <option value="전체 관리자">전체 관리자</option>
                        </select>
                    </li>
                </ul>
              </div>
             <div class="memsel2">
                <ul>
                    <li class="memfont">아이디</li>
                    <li><input type="text" class="admamber2" name="aid" placeholder="아이디를 입력해 주세요"></li>
                    <li><button type="button" class="idcheck" @click="idck" >중복체크</button></li>
                </ul>    
              </div>
              <div class="memsel2">
                <ul>
                    <li class="memfont">패스워드</li>
                    <li><input type="password" class="admamber1" name="apwd" placeholder="패스워드를 입력해 주세요"></li>
                    <li class="memfont">패스워드확인</li>
                    <li><input type="password" class="admamber4" name="apwd_ck" placeholder="동일한 패스워드를 입력해 주세요"></li>
                </ul>    
              </div>
              <div class="memsel3">
                <ul>
                    <li class="memfont">이메일</li>
                    <li><input type="text" class="admamber3" name="aemail" placeholder="이메일을 입력해 주세요"></li>
                </ul>    
              </div>
              <div class="memsel4">
                <ul>
                    <li class="memfont">연락처</li>
                    <li>
                        <select class="adnumber" name="atell">
                            <option value="010">010</option>
                            <option value="011">011</option>
                        </select>
                    </li>
                    <li class="ad_number">-</li>
                    <li><input type="text" class="adnumber" name="atell" maxlength="4"></li>
                    <li class="ad_number">-</li>
                    <li><input type="text" class="adnumber" name="atell" maxlength="4"></li>
                </ul>    
              </div> 
              
           </div>
        </div>
       <div class="admembt">
         <ul>
           <li><button type="button" class="admembt_ok" id="adm_ok" @click="insert">신청하기</button></li>
           <li><button type="button" class="admembt_no" id="adm_cancel" onclick="location.href='${pageContext.request.contextPath}/raemian_admin/ramian_admin_login'">취소하기</button></li>
        </ul>
       </div>
    </form>
    </div>
</body>
<script>
	var path= '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/admin_ship.js?v=<%=today%>"></script>
</html>