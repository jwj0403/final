<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="paypal.dto.notice.Notice" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>


<head>
<title>사이트 공지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript" src="/paypal/resources/js/jquery-3.1.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(function() {
		$("#delete").click(function() {
			if(confirm("삭제 하시겠습니까?")){
				$("#deleteForm").submit();	
			}
		});
		
	})

</script>

<!-- CSS 적용 하기 . -->
<style type="text/css">
	img.wp-smiley,
	img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
	}
</style>
<link rel='stylesheet' id='all-css-0-1' href='https://s2.wp.com/_static/??-eJx9kdFSAyEMRX/IGGtrRx8cv4WlKU1LCANZO/172e7Uqa7ywtwL95AE8JzBazJKhjJCjmPgVPGcvQpU4UiXX+7R1/qAf2ORT1TxSJadP8HVLeJD1PAN7Ei0shE4b/zpjJY7vXpeC7V9yc6mhNCOHUWSFuthkrc3apKH1mx3rHn+YciFaoW2Co8CdmiFulygRIXbwT9ywc5XYh4HDFpcwmqXuHyBu1ibOCEnPyfh2umcZ0xqc8Wb6PeqENU7Y00/DOyj49JDC01/2mTAlrqzE/Qh76vN6/bp5W21fj5+AZ0z6qo=' type='text/css' media='all' />
<style id='edin-style-inline-css' type='text/css'>
	.hero.with-featured-image { background-image: url(/paypal/resources/images/bg.jpg); }
	.hero.without-featured-image { background-image: url(); }
</style>
<link rel='stylesheet' id='demosites-open-sans-css'  href='https://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,400italic,600,600italic,700,700italic&#038;subset=latin,latin-ext' type='text/css' media='all' />
<link rel='stylesheet' id='print-css-3-1' href='https://s0.wp.com/wp-content/mu-plugins/global-print/global-print.css?m=1465851035h' type='text/css' media='print' />
<link rel='stylesheet' id='goran-noto-sans-css'  href='https://fonts.googleapis.com/css?family=Noto+Sans%3A400%2C700%2C400italic%2C700italic&#038;subset=latin%2Clatin-ext' type='text/css' media='all' />
<link rel='stylesheet' id='goran-noto-serif-css'  href='https://fonts.googleapis.com/css?family=Noto+Serif%3A400%2C700%2C400italic%2C700italic&#038;subset=latin%2Clatin-ext' type='text/css' media='all' />
<link rel='stylesheet' id='goran-droid-sans-mono-css'  href='https://fonts.googleapis.com/css?family=Droid+Sans+Mono' type='text/css' media='all' />
<link rel='stylesheet' id='all-css-10-1' href='https://s2.wp.com/_static/??/wp-content/themes/pub/goran/inc/style-wpcom.css,/wp-content/themes/h4/global.css?m=1453284068j' type='text/css' media='all' />
<script type='text/javascript' src='https://s0.wp.com/_static/??-eJyFj90KwjAMhV/Irk4m7kZ8lq6LJbV/NunGfHor6IVsKAQCJ985nMg5CQzalRFI2jr3Anl5r8bSTv4ChEeTFUPjMXxgHQND4Bfr44AORCHIylStBl3jBpcisQeiCm1cvythmBDmv5gFTkrfRAbCxyp1cNGI5IrBQHIEHwkZhNKMU/1mrVT/xZ/brj8d+vbY7e0TupB0Vw=='></script>
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://gorandemo.wordpress.com/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://s1.wp.com/wp-includes/wlwmanifest.xml" /> 
<meta name="generator" content="WordPress.com" />
<link rel="canonical" href="https://gorandemo.wordpress.com/" />
<link rel='shortlink' href='http://wp.me/P4WlwZ-1I' />

<style type="text/css" id="syntaxhighlighteranchor"></style>
		<style id="demo-site-activation">
			#infinite-footer {
				display: none !important;
			}

			@media screen and (max-width: 600px) {
				.demosite-activate {
					position: absolute;
				}
			}
		</style>
				<style id="demo-site-activation-logged-out">
			html {
				margin-top: 80px !important;
			}
			@media screen and (max-width: 620px) {
				html {
					margin-top: 100px !important;
				}
			}
			@media screen and (max-width: 600px) {
				.demosite-activate {
					position: absolute;
				}
			}
</style>

</head>


<!-- 내비게이터 부분 적용 위한 내용 -->
<body class="home page page-id-106 page-template page-template-page-templates page-template-front-page page-template-page-templatesfront-page-php mp6 customizer-styles-applied hero-image has-quinary has-custom-background has-footer-navigation navigation-default no-sidebar-full highlander-enabled highlander-light demo-site">
	<div id="page" class="hfeed site">
		<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
	
		<header id="masthead" class="site-header" role="banner">
			<div class="site-top-content">
				고객상담: 1566-1234
			</div><!-- .site-top-content -->
			
			<div class="site-branding">
				<h1 class="site-title"><a href="/paypal/" rel="home">T a r &nbsp;&nbsp; J a n e</a></h1>
				<h2 class="site-description">Goran is a modern responsive business and corporate theme that helps you to create a strong&#8211;yet beautiful&#8211;online presence for your business</h2>
			</div>
			<!-- .site-branding -->
	
				<nav id="site-navigation" class="main-navigation" role="navigation">
					<button class="menu-toggle">Menu</button>
					<div class="menu-primary">
						<ul id="menu-main" class="clear">
							<li id="menu-item-131" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-106 current_page_item menu-item-131"><a href="http://localhost:8888/paypal/">홈</a></li>
							<li id="menu-item-132" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-132"><a href="/paypal/notice/list.action">공지사항</a></li>
							<li id="menu-item-132" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-132"><a href="/paypal/analyze/analyzeData.action">구매분석</a></li>
							
							<c:choose >
								<c:when test="${ empty sessionScope.loginuser }">
									<li id="menu-item-132" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-132"><a href="/paypal/member/register.action">회원가입</a></li>
									<li id="menu-item-132" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-132"><a href="/paypal/member/login.action">로그인</a></li>
								</c:when>
								<c:otherwise>
									<li id="menu-item-132" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-132"><a href="/paypal/member/logout.action">로그아웃</a></li>
								</c:otherwise>
							</c:choose>
						
						</ul>
					</div>			
				</nav>
		</header>
		
		<!-- 배경 넣고 넓은 화면으로 사용 시 아래 주석 해제 1/2 -->
	<!-- </div> -->
		
	<div id="content" class="site-content">
		
		<!-- 배경 넣고 넓은 화면으로 사용 시 아래 주석 해제 2/2 -->
		<!-- <div class="hero with-featured-image"> -->
		<!-- <article id="post-106" class="post-106 page type-page status-publish"> -->
		<table class="table table-striped table-width">
			<!-- <tr style="background-color:#cccccc;height:25px"> -->
			<tr>
				<th style="width:50px">번호</th>
				<th style="width:700px">제목</th>
				<th style="width:100px">작성자</th>
				<th style="width:100px">작성일</th>
				<th style="width:70px">조회수</th>
			</tr>
			<tr> 
			<td style="text-align:center;">
			${ notice.noticeNo }
			</td>
			<td>
			${ notice.title }
			</td>
			<td>
			${ notice.writer }
			</td>
			<td>
			<fmt:formatDate value="${ notice.regdate }" pattern="yyyy-MM-dd" />
			</td>
			<td style="text-align:center;">
			${ notice.readCount }
			</td>
			</tr>
			<tr>
			<td colspan="5" style="height: 500px">
			${ notice.content }
			</td>
			</tr>
		</table>
		
		<div  style="text-align:right;font-size:15pt">
			<c:set var='auth' value='${ sessionScope.loginuser.email }'/>
			<c:set var='auth2' value='${ fn:split(auth, "@") }'/>
			<c:if test='${ auth2[1] eq "tarjane.com" }'><a href='modifyform.action?noticeNo=${ notice.noticeNo }' class="label label-default hand-cursor" id="modify">수정하기</a>&nbsp;
			<a class="label label-default hand-cursor" id="delete">삭제하기</a>&nbsp;</c:if>
			<a href='list.action' class="label label-default hand-cursor" id="toHome">목록으로</a>	
		</div>
		<br>
		<form id="deleteForm" method="post" action="delete.action">
			<input type="hidden" name="noticeNo" value="${ notice.noticeNo }" />
		</form>
		<footer id="colophon" class="site-footer" role="contentinfo">
			<div class="site-info">
	      		<a>소비자에게 알림: 타제인™ 이용약관을 주의 깊게 읽어보시기 바랍니다.</a>
			</div>
		</footer>
		</div>
	</div>
	
		
	<!-- 아래 부분 부터가 위의 내비게이터 넣기 위한 내용이 들어 가는 부분으로 매우 추정 된다. -->
	<!-- 로그인 로그아웃 버튼 및 로그인 정보 표시 화면 -->
	<div id="demosite-activate-wrap" class="demosite-activate" style="text-align: right">
		<c:choose>
			<c:when test="${ empty sessionScope.loginuser }">
				<li class="w3-hide-small" style="text-align: right; font-size: 15pt"><a href="/paypal/member/login.action" class="w3-padding-large w3-hover-white"><i class="fa fa-child">로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></a></li>
			    <li class="w3-hide-small" style="text-align: right; font-size: 15pt"><a href="/paypal/member/register.action" class="w3-padding-large w3-hover-white"><i class="fa fa-pencil">회원가입&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></a></li>
			</c:when>           	
			
			<c:otherwise>
				<li class="w3-hide-small" style="text-align: right; font-size: 15pt"><i class="fa fa-user-times">${ loginuser.email }님 환영합니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></li>
				<li class="w3-hide-small" style="text-align: right; font-size: 12pt"><a href="/paypal/member/logout.action" class="w3-padding-large w3-hover-white" title="로그아웃"><i class="fa fa-user-times">로그아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></a></li>
			 	<li class="w3-hide-small w3-right" style="text-align: right; font-size: 12pt">
					<c:url var="viewUrl" value="/member/mypage.action">
						<c:param name="email" value="${ loginuser.email }" />
					</c:url>
						<a href="${ viewUrl }" class="w3-padding-large w3-hover-white" title="계정관리">
						<i class="fa fa-cog">계정관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i>
					</a>
				</li>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="demosite-activate">
	
	</div>
	<!-- 로그인 로그아웃 버튼 및 로그인 정보 표시 화면 종료-------------------->

		
	<script type='text/javascript' src='https://s2.wp.com/_static/??-eJyNjt0OgjAMRl/IWRESvTE+S2EFCls394M+vpMLQzQx3n1pz3dauHvVOUkkCaYImhbuyD/2U9zBZmWz8iYPLBEMzxThlinTiKINhU84jWQL4nMLpFle3jizV4ZlVr3rclQ9f53YtAYXcK0JLjxgYif/0Gv48Tlqy6JaDGAxJgolKbdQCKyL6j0rhqu9VM3p0NRNdT5OT7VabBU='></script>
	
<!-- 	<script type="text/javascript">
	(function() {
	try{
	  if ( window.external &&'msIsSiteMode' in window.external) {
	    if (window.external.msIsSiteMode()) {
	      var jl = document.createElement('script');
	      jl.type='text/javascript';
	      jl.async=true;
	      jl.src='/wp-content/plugins/ie-sitemode/custom-jumplist.php';
	      var s = document.getElementsByTagName('script')[0];
	      s.parentNode.insertBefore(jl, s);
	    }
	  }
	}catch(e){}
	})();

	</script>
	 -->
	<script src="//stats.wp.com/w.js?56" type="text/javascript" async defer></script>
	<script type="text/javascript">
	_tkq = window._tkq || [];
	_stq = window._stq || [];
	_tkq.push(['storeContext', {'blog_id':'73011137','blog_tz':'0','user_lang':'en','blog_lang':'en','user_id':'0'}]);
	_stq.push(['view', {'blog':'73011137','v':'wpcom','tz':'0','user_id':'0','post':'106','subd':'gorandemo'}]);
	_stq.push(['extra', {'crypt':'UE40eW5QN0p8M2Y/RE1oV0pFNEwueXFaVXlyMGwvVG9bYmZXaDJ1Nmx+ankzUUUvVlg4OF92Y0gwNXlOMVYwc1FKb3pmcFJbN3dUWmc5WldXR0Z+Vy8rJXJxd35UZXM/UERVR3hmQXxWLjVBZU1kSCwySDJMOFNYdVs1aFlVYjhhZENQcHdsK2xlbjFyWkw2bzUmT1RdW0g5OERpNWt3bCYsZ0dCaDdRaVNuVzNYcnlyQlh3ZGpPTl8wdG5OdTB3UWpHJS5QX1JhdW1ZdkNRQVRMPTdFOHBRZVFFTXZ3TnImLXpafFJ5XUZHSEU3OSZlUytrWFFReT9Rd0h4VzY='}]);
	_stq.push([ 'clickTrackerInit', '73011137', '106' ]);
	</script>
	<noscript><img src="https://pixel.wp.com/b.gif?v=noscript" style="height:0px;width:0px;overflow:hidden" alt="" /></noscript>
	<script>
	if ( 'object' === typeof wpcom_mobile_user_agent_info ) {

	wpcom_mobile_user_agent_info.init();
	var mobileStatsQueryString = "";
	
	if( false !== wpcom_mobile_user_agent_info.matchedPlatformName )
		mobileStatsQueryString += "&x_" + 'mobile_platforms' + '=' + wpcom_mobile_user_agent_info.matchedPlatformName;
	
	if( false !== wpcom_mobile_user_agent_info.matchedUserAgentName )
		mobileStatsQueryString += "&x_" + 'mobile_devices' + '=' + wpcom_mobile_user_agent_info.matchedUserAgentName;
	
	if( wpcom_mobile_user_agent_info.isIPad() )
		mobileStatsQueryString += "&x_" + 'ipad_views' + '=' + 'views';

	if( "" != mobileStatsQueryString ) {
		new Image().src = document.location.protocol + '//pixel.wp.com/g.gif?v=wpcom-no-pv' + mobileStatsQueryString + '&baba=' + Math.random();
	}
	
	}
	</script>
</body>


</html>
