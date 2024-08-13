<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css">
</head>

<body>
<div id="guideBox" >
	<div class="click">★</div>
	<div>#구현 기술
		<ul>
			<li> 해당 페이지는 기획서대로 최 하단의 '편안하고 실용적인 합리적 공간배치'파트에 대해서만 다뤄지고 있습니다 </li>
			<li> ▶admin페이지의 info페이지에 '사용'으로 등록한 데이터가 출력됩니다(최대 4개 조절 가능) </li>
			<li> ▶클릭시 해당 데이터에 대한 자세한 정보가 출력</li>
		</ul>
	</div>
	<br>
	<div>♣ 참고 사항
		<ul>
			<li>확인 가능한 메뉴▼</li>
			<li>최상단 메뉴: 로그인, 회원가입, FAQ, 공지사항 </li>
			<li>상단 메뉴 1 : 사전정보 예약 </li>
			<li>상단 메뉴 2(sub페이지가 있어 연결만 시켜놓음) : 사업정보, 단지 정보 </li>
		</ul>
	</div>
</div>
<%@ include file="./menu.jsp" %>
<!-- 메인 화면 시작 -->
    <section id="px0" class="px-sect">
		<ul class="main-slider">
		    <li class="i1 px-h">
               <div class="tb-areaset">
                   <div class="tb-type animated fadeInUp">
                       <div class="text-center">
                       </div>
                   </div>
               </div>
		    </li>
		    <li class="i2 px-h">
               <div class="tb-areaset">
                   <div class="tb-type">
                       <div class="text-center">
                       </div>
                   </div>
               </div>
		    </li>
		</ul>
        <div class="txt-ref">※ 상기 이미지는 소비자의 이해를 돕기 위한 것으로 실제와 다를 수 있습니다.</div>
        <div class="slider-progress">
           <div class="progress"></div>
        </div>

        <div class="scroll-info">
            <span class="ico-mouse"><em class="animated scrollBall infinite"></em></span> <span>Scroll-Down</span>
        </div>
		<div class="index-nv">
            <ol>
                <li class="on"><a href="#px0" onClick="scrollMove('#px0');return false;"></a></li>
                <li><a href="#px1" onClick="scrollMove('#px1');return false;"></a></li>
                <li><a href="#px2" onClick="scrollMove('#px2');return false;"></a></li>
                <li class=""><a href="#px3" onClick="scrollMove('#px3');return false;"></a></li>
                <li><a href="#px4" onClick="scrollMove('#px4');return false;"></a></li>
            </ol>
        </div>
	</section>
	<section class="sect-info px-sect">
	    <div class="w-base">
			 <h3 class="animated fadeInUp mt10"><small>
					<span class="fc-orange">검</span>증된 신도시 <br>
		            <span class="fc-orange">단</span>번에 누려라
			 </small></h3>
	    </div>
	</section>
<section id="px1" class="sect01 px-sect">
        <div class="w-base">
            <div class="row">
                <div class="col-sm-6 col-xs-12 pa20-xs pt0-xs mt30-xs">
                    <span class="img-group">
                        <span>
                            <em class="animated zoomIn"><img src="${pageContext.request.contextPath}/resources/img/ms01.png" class="img-responsive center-block" alt=""></em>
                        </span>
                    </span>
                </div>
                <div class="col-sm-6 col-xs-12 pl50 pa30-xs pb0-xs">
                    <h3 class="fw300 animated fadeInUp">
                        <small>인천1호선 연장, 법조타운 조성, 특화산업 클러스터까지 <br class="mobile"></small>더 나은 내일로 힘차게 도약하는 <br > <span class="fc-orange">인천 검단신도시</span>
                    </h3>
                    <div class="animated fadeInUp">
                    <ul class="lst-dot pt20 pt0-xs">
                        <li>인천1호선 연장으로완성되는 역세권</li>
                        <li>법원과 검찰청 신설로완성되는 법조타운</li>
                        <li>특화산업 클러스터 조성으로완성되는 직주근접</li>
                    </ul>
                    </div>
                   <a href="${pageContext.request.contextPath}/raemian_client/sub02" class="btn-basic mt50 animated fadeInUp">자세히보기</a>
                </div>
            </div>
        </div>
	</section>
    <section id="px3" class="sect03 px-sect">
        <div class=""> 
            <h3 class="ff-play animated fadeInUp fc-wh">인천검단 <b>AA13-1 BL</b></h3>
        </div>
        <div>
            <div class="row">
                <div class="col-sm-6 col-xs-12 life-slider-area">
                    <ul class="life-slider animated fadeInUp">
                       <li>
                            <div>
                                <span>
                                    <img src="${pageContext.request.contextPath}/resources/img/main_life01.jpg" class="img-responsive center-block" alt="">
                                    <i class="cover"></i>
                                </span>
                                <div class="s-info">
                                    <em class="num animated fadeInUp">01</em>
                                    <h4 class="animated fadeInUp">더 빠른 교통</h4>
                                    <p class="animated fadeInUp">
            + 인천1호선 검단 연장(예정)으로 더욱 개선되는 대중교통 접근성 <br>
			+ 수도권제2순환고속도로, 인천국제공항고속도로 등 우수한 광역교통망
                                    </p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <span>
                                    <img src="${pageContext.request.contextPath}/resources/img/main_life02.jpg" class="img-responsive center-block" alt="">
                                    <i class="cover"></i>
                                </span>
                                <div class="s-info">
                                    <em class="num animated fadeInUp">02</em>
                                    <h4 class="animated fadeInUp">더 편한 생활</h4>
                                    <p class="animated fadeInUp">
            + 인근에 복합문화상업지구 넥스트 콤플렉스 조성 예정으로 기대되는 생활 편의성 <br/>
			+ 단지 옆 초등학교, 주변에 중·고교 신설 예정, 영어마을도 인접한 명문교육환경
                                    </p>
                                </div>
                            </div>
                        </li>
						 <li>
                            <div>
                                <span>
                                    <img src="${pageContext.request.contextPath}/resources/img/main_life01.jpg" class="img-responsive center-block" alt="">
                                    <i class="cover"></i>
                                </span>
                                <div class="s-info">
                                    <em class="num animated fadeInUp">01</em>
                                    <h4 class="animated fadeInUp">더 빠른 교통</h4>
                                    <p class="animated fadeInUp">
            + 인천1호선 검단 연장(예정)으로 더욱 개선되는 대중교통 접근성 <br>
			+ 수도권제2순환고속도로, 인천국제공항고속도로 등 우수한 광역교통망
                                    </p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <span>
                                    <img src="${pageContext.request.contextPath}/resources/img/main_life02.jpg" class="img-responsive center-block" alt="">
                                    <i class="cover"></i>
                                </span>
                                <div class="s-info">
                                    <em class="num animated fadeInUp">02</em>
                                    <h4 class="animated fadeInUp">더 편한 생활</h4>
                                    <p class="animated fadeInUp">
            + 인근에 복합문화상업지구 넥스트 콤플렉스 조성 예정으로 기대되는 생활 편의성 <br/>
			+ 단지 옆 초등학교, 주변에 중·고교 신설 예정, 영어마을도 인접한 명문교육환경
                                    </p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-6 col-xs-12 pull-right life-inven-area animated fadeInUp">
                    <ul class="life-slider-inven">
                        <li>
                            <div>
                                <span>
                                    <img src="${pageContext.request.contextPath}/resources/img/main_life01.jpg" class="img-responsive center-block" alt="">
                                    <i class="cover"></i>
                                </span>
                                <div class="s-info">
                                    <h4>더 빠른 교통</h4>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <span>
                                    <img src="${pageContext.request.contextPath}/resources/img/main_life02.jpg" class="img-responsive center-block" alt="">
                                    <i class="cover"></i>
                                </span>
                                <div class="s-info">
                                    <h4>더 편한 생활</h4>
                                </div>
                            </div>
                        </li>
						<li>
                            <div>
                                <span>
                                    <img src="${pageContext.request.contextPath}/resources/img/main_life01.jpg" class="img-responsive center-block" alt="">
                                    <i class="cover"></i>
                                </span>
                                <div class="s-info">
                                    <h4>더 빠른 교통</h4>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <span>
                                    <img src="${pageContext.request.contextPath}/resources/img/main_life02.jpg" class="img-responsive center-block" alt="">
                                    <i class="cover"></i>
                                </span>
                                <div class="s-info">
                                    <h4>더 편한 생활</h4>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
             </div>
        </div>
    </section>
<!-- 메인 화면 종료 -->
<!-- 타입정보 시작 -->
	<section id="px4" class="sect04 px-sect last-sect">
        <div class="w-base">
            <div class="tit-area  animated fadeInUp m_center">
                <h3>편안하고 실용적인 <br class="m_br">합리적 공간배치<br class="m_br"><a href="#">more</a></h3>
                <p class="animated fadeInUp m_center">더 나은 삶, 나은 내일<br>가족의 행복한 이야기로 가득 채워집니다</p>
            </div>
              <div class="contents-4-box row">
                <div>
                    <ul class="nav nav-tabs box-nav m_flex_center">
                        <!-- 타입 출력 -->
                        <c:forEach items="${infoList}" var="li" varStatus="no">
                        <li>
                            <button type="button" class="tab_showroom active" data-num="${no.index+1}">${li.ftype}</button>
                        </li>
                        </c:forEach>
                        <!-- 타입 출력 끝 -->
                    </ul>
                </div>
                <div class="col-sm-12 col-xs-12">
                    <div class="iso-box">
                    	<c:forEach items="${infoList}" var="li" varStatus="no">
                        <div class="showroom" id="showroom_${no.index+1}">
                            <span>
                            <img src="http://deoya.cdn1.cafe24.com/${li.uploadPath}${li.fimg}" class="img-responsive center-block" alt=""></span>
                            <div class="area-info col-sm-1">
                                <h4>${li.ftype}</h4>
                                <ul>
                                    <li>
                                        <h5>주거전용</h5>
                                        <p>${li.household}㎡</p>
                                    </li>
                                    <li>
                                        <h5>주거공용</h5>
                                        <p>${li.houseShared}㎡</p>
                                    </li>
                                    <li>
                                        <h5>기타공용</h5>
                                        <p>${li.etcShared}㎡</p>
                                    </li>
                                    <li>
                                        <h5>계약면적</h5>
                                        <p>${li.contractArea}㎡</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
	</section>
    <!-- 타입정보 끝 -->
<%@ include file="./copywriter.jsp" %>
<!-- //container -->
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/layout.js"></script>
<script>
    $(".tab_showroom").on("click", function () {
        var num = $(this).data("num");
        $(".tab_showroom").removeClass("active");
        $(this).addClass("active");
        $(".showroom").hide();
        $("#showroom_" + num).show();
        $(".showroom_slide").hide();
        $("#showroom_slide_" + num).show();

        if( !$('#showroom_slide_' + num + ' .swiper-container').hasClass("swiper-container-initialized") ) {
            swiper = new Swiper('#showroom_slide_' + num + ' .swiper-container', {
                slidesPerView: 1,
                loop: true,
                navigation: {
                    nextEl: '.sub-slider__next',
                    prevEl: '.sub-slider__prev',
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                    renderBullet: function (index, className) {
                        return '<span class="' + className + '"></span>';
                    },
                },
            });

            setTimeout(reInit,500);
        }
    });

    if( !$('#showroom_slide_1 .swiper-container').hasClass("swiper-container-initialized") ){
        swiper = new Swiper('#showroom_slide_1 .swiper-container', {
            slidesPerView: 1,
            loop: true,
            navigation: {
                nextEl: '.sub-slider__next',
                prevEl: '.sub-slider__prev',
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '"></span>';
                },
            },
        });
    };

    var dotArea = $('.main-slider .slick-dots');
    dotArea.wrap('<div class="w-base dot-control"></div>');
    $("<em>0</em>").prependTo('.main-slider .slick-dots>li>button');


     $('.life-slider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
         autoplay: true,
        autoplaySpeed: 3000,
        arrows: true,
        fade: true,
        asNavFor: '.life-slider-inven'
    });
    var dotArea = $('.life-slider .slick-arrow');
    dotArea.wrap('<div class="w-base dot-control"></div>');
    $("<em>0</em>").prependTo('.main-slider .slick-dots>li>button');


    $('.life-slider-inven').slick({
        slidesToShow: 2,
        slidesToScroll: 1,
        asNavFor: '.life-slider',
        //centerMode: true,
        dots: false,
        arrows: false,
    });

    $('.area-interior').slick({
        dots:true,
        infinite:true,
        autoplay:true,
        autoplaySpeed:3000
    });



$(document).ready(function() {
  var time = 2;
  var $bar,
    $slick,
    isPause,
    tick,
    percentTime;

  $slick = $('.main-slider');
  $slick.slick({
    arrows: true,
    speed: 1200,
    dots:false,
    arrows:true,
    fade: true,
    infinite: true,
    adaptiveHeight: false
  });

  $bar = $('.slider-progress .progress');

  function startProgressbar() {
    resetProgressbar();
    percentTime = 0;
    isPause = false;
    tick = setInterval(interval, 30);
  }

  function interval() {
    if (isPause === false) {
      percentTime += 1 / (time + 0.1);
      $bar.css({
        width: percentTime + "%"
      });
      if (percentTime >= 100) {
        $slick.slick('slickNext');
        startProgressbar();
      }
    }
  }

  function resetProgressbar() {
    $bar.css({
      width: 0 + '%'
    });
    clearTimeout(tick);
  }

  startProgressbar();

  $('.slick-next, .slick-prev').click(function() {
    startProgressbar();
  });

});
</script>
</body>
</html>
