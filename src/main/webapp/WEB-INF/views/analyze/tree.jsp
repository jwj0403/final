<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type"	content="text/html;charset=utf-8">
		<title>Tree</title>
		<style type="text/css">
			circle {
			  cursor: pointer;
			  fill: #fff;
			  stroke: steelblue;
			  stroke-width: 1.5px;
			}

			text {
				font-size:10px;
			}
			
			.td {
				font-size: 9px;
			}
			
			.td2 {
				width: 600px;
			}
			
			.td3 {
				width: 50px;
			}
			
			.table {
				margin-left: 80px;
				width: 1560px;
			}
			
			.svg {
				margin-left: 80px;
			}
			
			svg {
				margin-left: 80px;
			}
			
			path.link {
			  fill: none;
			  stroke: #ccc;
			  stroke-width: 1.5px;
			}
			
			text-center {
				text-align: center;
			}
			
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
		<link rel="profile" href="http://gmpg.org/xfn/11">
		<link rel="pingback" href="https://gorandemo.wordpress.com/xmlrpc.php">
		<link rel='dns-prefetch' href='//s2.wp.com' />
		<link rel='dns-prefetch' href='//s0.wp.com' />
		<link rel='dns-prefetch' href='//s1.wp.com' />
		<link rel='dns-prefetch' href='//fonts.googleapis.com' />
		<link rel="alternate" type="application/rss+xml" title="Goran &raquo; Feed" href="https://gorandemo.wordpress.com/feed/" />
		<link rel="alternate" type="application/rss+xml" title="Goran &raquo; Comments Feed" href="https://gorandemo.wordpress.com/comments/feed/" />
		<script type="text/javascript" src="http://d3js.org/d3.v3.min.js"></script>
		<script type="text/javascript" src="http://d3js.org/d3.v4.min.js"></script>
    	<script type="text/javascript" src="/paypal/resources/js/d3.layout.js"></script>
    	<script type="text/javascript" src="/paypal/resources/js/jquery-3.1.1.js"></script>
    	<script type="text/javascript" src="/paypal/resources/js/draw-chart.js"></script>
    	<link rel='stylesheet' id='all-css-0-1' href='https://s2.wp.com/_static/??-eJx9kdFSAyEMRX/IGGtrRx8cv4WlKU1LCANZO/172e7Uqa7ywtwL95AE8JzBazJKhjJCjmPgVPGcvQpU4UiXX+7R1/qAf2ORT1TxSJadP8HVLeJD1PAN7Ei0shE4b/zpjJY7vXpeC7V9yc6mhNCOHUWSFuthkrc3apKH1mx3rHn+YciFaoW2Co8CdmiFulygRIXbwT9ywc5XYh4HDFpcwmqXuHyBu1ibOCEnPyfh2umcZ0xqc8Wb6PeqENU7Y00/DOyj49JDC01/2mTAlrqzE/Qh76vN6/bp5W21fj5+AZ0z6qo=' type='text/css' media='all' />
		<style id='edin-style-inline-css' type='text/css'>
			.hero.with-featured-image { background-image: url(https://gorandemo.files.wordpress.com/2014/08/goran-hero.jpg?w=1230); }
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
		
		<!-- Jetpack Open Graph Tags -->
		<meta property="og:type" content="website" />
		<meta property="og:title" content="Goran" />
		<meta property="og:description" content="Goran is a modern responsive business and corporate theme that helps you to create a strong--yet beautiful--online presence for your business" />
		<meta property="og:url" content="https://gorandemo.wordpress.com/" />
		<meta property="og:site_name" content="Goran" />
		<meta property="og:image" content="https://gorandemo.files.wordpress.com/2014/08/goran-hero.jpg?w=1200" />
		<meta property="og:image:width" content="1200" />
		<meta property="og:image:height" content="794" />
		<meta property="og:locale" content="en_US" />
		<meta name="twitter:site" content="@wordpressdotcom" />
		<meta name="twitter:image:src" content="https://gorandemo.files.wordpress.com/2014/08/goran-hero.jpg?w=640" />
		<meta name="twitter:card" content="summary_large_image" />
		<meta property="fb:app_id" content="249643311490" />
		<meta property="article:publisher" content="https://www.facebook.com/WordPresscom" />
		<link rel="shortcut icon" type="image/x-icon" href="https://s2.wp.com/i/favicon.ico" sizes="16x16 24x24 32x32 48x48" />
		<link rel="icon" type="image/x-icon" href="https://s2.wp.com/i/favicon.ico" sizes="16x16 24x24 32x32 48x48" />
		<link rel="apple-touch-icon-precomposed" href="https://s0.wp.com/i/webclip.png" />
		<link rel='openid.server' href='https://gorandemo.wordpress.com/?openidserver=1' />
		<link rel='openid.delegate' href='https://gorandemo.wordpress.com/' />
		<link rel="search" type="application/opensearchdescription+xml" href="https://gorandemo.wordpress.com/osd.xml" title="Goran" />
		<link rel="search" type="application/opensearchdescription+xml" href="https://s1.wp.com/opensearch.xml" title="WordPress.com" />
		<meta name="theme-color" content="#e1dfdf" />
		<meta name="application-name" content="Goran" />
		<meta name="msapplication-window" content="width=device-width;height=device-height" />
		<meta name="msapplication-tooltip" content="Goran is a modern responsive business and corporate theme that helps you to create a strong--yet beautiful--online presence for your business" /><meta name="msapplication-task" content="name=Subscribe;action-uri=https://gorandemo.wordpress.com/feed/;icon-uri=https://s2.wp.com/i/favicon.ico" /><meta name="msapplication-task" content="name=Sign up for a free blog;action-uri=http://wordpress.com/signup/;icon-uri=https://s2.wp.com/i/favicon.ico" /><meta name="msapplication-task" content="name=WordPress.com Support;action-uri=http://support.wordpress.com/;icon-uri=https://s2.wp.com/i/favicon.ico" /><meta name="msapplication-task" content="name=WordPress.com Forums;action-uri=http://forums.wordpress.com/;icon-uri=https://s2.wp.com/i/favicon.ico" /><meta name="title" content="Home | Goran on WordPress.com" />
		<meta name="description" content="The content of the front page template is displayed here. This is a great place to add your “call to action” with a brief message. The image behind this text is added as a featured image. If you wish to add a button like below, use a CSS class: button. Button" />
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
		<script type="text/javascript">
			window._wpemojiSettings = {"baseUrl":"https:\/\/s0.wp.com\/wp-content\/mu-plugins\/wpcom-smileys\/twemoji\/2\/72x72\/","ext":".png","svgUrl":"https:\/\/s0.wp.com\/wp-content\/mu-plugins\/wpcom-smileys\/twemoji\/2\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/s1.wp.com\/wp-includes\/js\/wp-emoji-release.min.js?m=1473172720h&ver=4.6.1-RC1-38499"}};
			!function(a,b,c){function d(a){var c,d,e,f,g,h=b.createElement("canvas"),i=h.getContext&&h.getContext("2d"),j=String.fromCharCode;if(!i||!i.fillText)return!1;switch(i.textBaseline="top",i.font="600 32px Arial",a){case"flag":return i.fillText(j(55356,56806,55356,56826),0,0),!(h.toDataURL().length<3e3)&&(i.clearRect(0,0,h.width,h.height),i.fillText(j(55356,57331,65039,8205,55356,57096),0,0),c=h.toDataURL(),i.clearRect(0,0,h.width,h.height),i.fillText(j(55356,57331,55356,57096),0,0),d=h.toDataURL(),c!==d);case"diversity":return i.fillText(j(55356,57221),0,0),e=i.getImageData(16,16,1,1).data,f=e[0]+","+e[1]+","+e[2]+","+e[3],i.fillText(j(55356,57221,55356,57343),0,0),e=i.getImageData(16,16,1,1).data,g=e[0]+","+e[1]+","+e[2]+","+e[3],f!==g;case"simple":return i.fillText(j(55357,56835),0,0),0!==i.getImageData(16,16,1,1).data[0];case"unicode8":return i.fillText(j(55356,57135),0,0),0!==i.getImageData(16,16,1,1).data[0];case"unicode9":return i.fillText(j(55358,56631),0,0),0!==i.getImageData(16,16,1,1).data[0]}return!1}function e(a){var c=b.createElement("script");c.src=a,c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var f,g,h,i;for(i=Array("simple","flag","unicode8","diversity","unicode9"),c.supports={everything:!0,everythingExceptFlag:!0},h=0;h<i.length;h++)c.supports[i[h]]=d(i[h]),c.supports.everything=c.supports.everything&&c.supports[i[h]],"flag"!==i[h]&&(c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&c.supports[i[h]]);c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&!c.supports.flag,c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.everything||(g=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",g,!1),a.addEventListener("load",g,!1)):(a.attachEvent("onload",g),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),f=c.source||{},f.concatemoji?e(f.concatemoji):f.wpemoji&&f.twemoji&&(e(f.twemoji),e(f.wpemoji)))}(window,document,window._wpemojiSettings);
		</script>
		<script type="text/javascript">
			/* <![CDATA[ */
			function addLoadEvent(func) {
				var oldonload = window.onload;
				if (typeof window.onload != 'function') {
					window.onload = func;
				} else {
					window.onload = function () {
						oldonload();
						func();
					}
				}
			}
			/* ]]> */
		</script>
		<link rel='stylesheet' id='all-css-0-1' href='https://s2.wp.com/_static/??-eJx9kdFSAyEMRX/IGGtrRx8cv4WlKU1LCANZO/172e7Uqa7ywtwL95AE8JzBazJKhjJCjmPgVPGcvQpU4UiXX+7R1/qAf2ORT1TxSJadP8HVLeJD1PAN7Ei0shE4b/zpjJY7vXpeC7V9yc6mhNCOHUWSFuthkrc3apKH1mx3rHn+YciFaoW2Co8CdmiFulygRIXbwT9ywc5XYh4HDFpcwmqXuHyBu1ibOCEnPyfh2umcZ0xqc8Wb6PeqENU7Y00/DOyj49JDC01/2mTAlrqzE/Qh76vN6/bp5W21fj5+AZ0z6qo=' type='text/css' media='all' />
		<style id='edin-style-inline-css' type='text/css'>
			.hero.with-featured-image { background-image: url(https://gorandemo.files.wordpress.com/2014/08/goran-hero.jpg?w=1230); }
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
		
		<!-- Jetpack Open Graph Tags -->
		<meta property="og:type" content="website" />
		<meta property="og:title" content="Goran" />
		<meta property="og:description" content="Goran is a modern responsive business and corporate theme that helps you to create a strong--yet beautiful--online presence for your business" />
		<meta property="og:url" content="https://gorandemo.wordpress.com/" />
		<meta property="og:site_name" content="Goran" />
		<meta property="og:image" content="https://gorandemo.files.wordpress.com/2014/08/goran-hero.jpg?w=1200" />
		<meta property="og:image:width" content="1200" />
		<meta property="og:image:height" content="794" />
		<meta property="og:locale" content="en_US" />
		<meta name="twitter:site" content="@wordpressdotcom" />
		<meta name="twitter:image:src" content="https://gorandemo.files.wordpress.com/2014/08/goran-hero.jpg?w=640" />
		<meta name="twitter:card" content="summary_large_image" />
		<meta property="fb:app_id" content="249643311490" />
		<meta property="article:publisher" content="https://www.facebook.com/WordPresscom" />
		<link rel="shortcut icon" type="image/x-icon" href="https://s2.wp.com/i/favicon.ico" sizes="16x16 24x24 32x32 48x48" />
		<link rel="icon" type="image/x-icon" href="https://s2.wp.com/i/favicon.ico" sizes="16x16 24x24 32x32 48x48" />
		<link rel="apple-touch-icon-precomposed" href="https://s0.wp.com/i/webclip.png" />
		<link rel='openid.server' href='https://gorandemo.wordpress.com/?openidserver=1' />
		<link rel='openid.delegate' href='https://gorandemo.wordpress.com/' />
		<link rel="search" type="application/opensearchdescription+xml" href="https://gorandemo.wordpress.com/osd.xml" title="Goran" />
		<link rel="search" type="application/opensearchdescription+xml" href="https://s1.wp.com/opensearch.xml" title="WordPress.com" />
		<meta name="theme-color" content="#e1dfdf" />
		<meta name="application-name" content="Goran" /><meta name="msapplication-window" content="width=device-width;height=device-height" /><meta name="msapplication-tooltip" content="Goran is a modern responsive business and corporate theme that helps you to create a strong--yet beautiful--online presence for your business" /><meta name="msapplication-task" content="name=Subscribe;action-uri=https://gorandemo.wordpress.com/feed/;icon-uri=https://s2.wp.com/i/favicon.ico" /><meta name="msapplication-task" content="name=Sign up for a free blog;action-uri=http://wordpress.com/signup/;icon-uri=https://s2.wp.com/i/favicon.ico" /><meta name="msapplication-task" content="name=WordPress.com Support;action-uri=http://support.wordpress.com/;icon-uri=https://s2.wp.com/i/favicon.ico" /><meta name="msapplication-task" content="name=WordPress.com Forums;action-uri=http://forums.wordpress.com/;icon-uri=https://s2.wp.com/i/favicon.ico" /><meta name="title" content="Home | Goran on WordPress.com" />
		<meta name="description" content="The content of the front page template is displayed here. This is a great place to add your “call to action” with a brief message. The image behind this text is added as a featured image. If you wish to add a button like below, use a CSS class: button. Button" />
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
	<body>
		<h1 class="text-center table">Data Analysis Chart</h1>
		<div id="search-conditions">
			<form id="conditions">
				<table class="table">
					<tr>
						<td class="td td3">상품</td>
						<td class="td td2">
							<div id="product-div">
								<input id="product-single" type="radio" name="group" value="S" checked="checked">&nbsp;단일상품 &nbsp;&nbsp;&nbsp; 
								<input id="product-group" type="radio" name="group" value="G">&nbsp;묶음상품
							</div>
						</td>
						<td class="td td3">지역</td>
						<td class="td">
							<div id="area-div">
								<input id="area-a" type="checkbox" name="area" value="All">&nbsp;전체&nbsp;&nbsp;&nbsp;
								<input id="area-ar1" type="checkbox" name="area" value="서울">&nbsp;서울&nbsp;&nbsp;&nbsp;
								<input id="area-ar2" type="checkbox" name="area" value="인천">&nbsp;인천&nbsp;&nbsp;&nbsp;
								<input id="area-ar3" type="checkbox" name="area" value="경기">&nbsp;경기&nbsp;&nbsp;&nbsp;
								<input id="area-ar4" type="checkbox" name="area" value="강원">&nbsp;강원&nbsp;&nbsp;&nbsp;
								<input id="area-ar5" type="checkbox" name="area" value="충북">&nbsp;충북&nbsp;&nbsp;&nbsp;
								<input id="area-ar6" type="checkbox" name="area" value="충남">&nbsp;충남&nbsp;&nbsp;&nbsp;
								<input id="area-ar7" type="checkbox" name="area" value="세종">&nbsp;세종&nbsp;&nbsp;&nbsp;
								<input id="area-ar8" type="checkbox" name="area" value="대전">&nbsp;대전&nbsp;&nbsp;&nbsp;
								<input id="area-ar9" type="checkbox" name="area" value="전북">&nbsp;전북&nbsp;&nbsp;&nbsp;
								<input id="area-ar10" type="checkbox" name="area" value="전남">&nbsp;전남&nbsp;&nbsp;&nbsp;
								<input id="area-ar11" type="checkbox" name="area" value="광주">&nbsp;광주&nbsp;&nbsp;&nbsp;
								<input id="area-ar12" type="checkbox" name="area" value="경북">&nbsp;경북&nbsp;&nbsp;&nbsp;
								<input id="area-ar13" type="checkbox" name="area" value="대구">&nbsp;대구&nbsp;&nbsp;&nbsp;
								<input id="area-ar14" type="checkbox" name="area" value="경남">&nbsp;경남&nbsp;&nbsp;&nbsp;
								<input id="area-ar15" type="checkbox" name="area" value="부산">&nbsp;부산&nbsp;&nbsp;&nbsp;
								<input id="area-ar16" type="checkbox" name="area" value="울산">&nbsp;울산&nbsp;&nbsp;&nbsp;
								<input id="area-ar17" type="checkbox" name="area" value="제주">&nbsp;제주&nbsp;&nbsp;&nbsp;
							</div>
						</td>
					</tr>
					<tr>
						<td class="td">성별</td>
						<td class="td">
							<div id="gender-div">
								<input id="gender-a" type="radio" name="gender" value="All" checked="checked">&nbsp;전체 &nbsp;&nbsp;&nbsp; 
								<input id="gender-m" type="radio" name="gender" value="M">&nbsp;남자 &nbsp;&nbsp;&nbsp; 
								<input id="gender-f" type="radio" name="gender" value="W">&nbsp;여자 &nbsp;&nbsp;&nbsp; 
								<input id="gender-c" type="radio" name="gender" value="C">&nbsp;비교
							</div>
						</td>
						<td class="td">연령</td>
						<td class="td">
							<div id="age-div">
								<input id="age-a" type="checkbox" name="age" value="All" checked="">&nbsp;전체&nbsp;&nbsp;&nbsp;
								<input id="age-ax1" type="checkbox" name="age" value="1">&nbsp;10대&nbsp;&nbsp;&nbsp;
								<input id="age-ax2" type="checkbox" name="age" value="2">&nbsp;20대&nbsp;&nbsp;&nbsp;
								<input id="age-ax3" type="checkbox" name="age" value="3">&nbsp;30대&nbsp;&nbsp;&nbsp;
								<input id="age-ax4" type="checkbox" name="age" value="4">&nbsp;40대&nbsp;&nbsp;&nbsp;
								<input id="age-ax5" type="checkbox" name="age" value="5">&nbsp;50대&nbsp;&nbsp;&nbsp;
								<input id="age-ax6" type="checkbox" name="age" value="6">&nbsp;60대 이상&nbsp;&nbsp;&nbsp;
								<input id="age-compare-all" type="checkbox" name="ageCompare" value="Compare">&nbsp;전 연령 비교&nbsp;
							</div>
						</td>
					</tr>
					<tr>
						<td class="td">기간</td>
						<td class="td">
							<div id="age-div">
								<input id="period-a" type="radio" name="period" value="All" checked="checked">&nbsp;전체기간&nbsp;&nbsp;&nbsp;
								<input id="period-year" type="radio" name="period" value="Year">&nbsp;연도별&nbsp;&nbsp;&nbsp;
								<input id="period-quater" type="radio" name="period" value="Quater">&nbsp;분기별&nbsp;&nbsp;&nbsp;
								<input id="period-month" type="radio" name="period" value="Month">&nbsp;월별&nbsp;&nbsp;&nbsp;
								<input id="period-specified" type="radio" name="period" value="Specified">&nbsp;특정기간&nbsp;&nbsp;&nbsp;
								<span id="period-span">
									<input id="periodFrom" type="date" name="periodFrom">&nbsp;~&nbsp;<input id="periodTo" type="date" name="periodTo">
								</span>
							</div>
						</td>
						<td class="td">분석</td>
						<td class="td">
							<div id="analyze-div">
								<input type="button" name="analyze" value="분석">&nbsp;
								<input type="button" name="view-tree" value="트리보기">
							</div>
						</td>
					</tr>
				</table>
				<input type="hidden" name="treeNodeName">
				<input type="hidden" name="treeNodeDepth">
				<input type="hidden" name="xAxisLabel">
				<input type="hidden" name="ageAllClicked">
				<input type="hidden" name="areaAllClicked">
				<input type="hidden" id="config">
			</form>
		</div>
		<script type="text/javascript">
			// x축 레이블
			var xAxisLabel;
			var areaAxisLabel = ["서울", "부산", "대구", "광주", "대전", "울산", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남"];
			var xLabel = [];
			//==========
			
			var w;
			var h;
			var i;
			var duration;
			var root;			
			// 검색 및 분석
			var treeNodeName = "";
			var treeNodeDepth = "";			
			var tree;
			var diagonal;			
			var vis;
			
			initTreeVariables();
			// ===================== 이상 트리 차트의 변수와 초기화
			var n, // The number of series.
		    	m; // The number of values per series.		    	
	    	// 색상
			var color;    	
			var xz,
			    yz,
			    y01z,
			    yMax,
			    y1Max;
			
			var svg,
			    margin,
			    width,
			    height,
			    g;
			
			var x;			
			var y;			
			var series;
			var xn;
			var genders = [];
			var ages = [];
			var seriesIndex = 0;
			
			// 막대그래프의 사각형
			var rect;
			
			// 분석데이터
			var condition;
			var analData;
			var values = [];
			// ==================== 이상 막대 그래프의 변수와 초기화
			function showTree() { d3.json("/paypal/resources/data/p.json", function(json) {
					json.x0 = 800;
				  	json.y0 = 0;
				  	root = "";
				  	update(root = json);
				  	// console.log("c :" + tree.nodes(root));
				});
			}			
			
			function update(source) {
				// Compute the new tree layout
				// reverse()는 노드 클릭시 텍스트의 각도
				// console.log("v_---------\n" + root);
				var nodes = tree.nodes(root).reverse();
				// console.log("d :" + tree.nodes(root));
				// console.log(nodes);
				// Update the nodes
				var node = vis.selectAll("g.node")
							  .data(nodes, function(d) {
									return d.id || (d.id = ++i);
							  });
				var nodeEnter = node.enter().append("svg:g")
									.attr("class", "node")
									.attr("transform", function(d) {
										// 노드와 엣지의 이동
											return "translate(" + source.y0 + ", " + source.x0 + ")";
									});
				
				// 노드의 크기, 색상변화
				nodeEnter.append("svg:circle")
						 .attr("r", 7)
						 .style("fill", function(d) {
								return d._children ? "lightsteelblue" : "#fff";
						 }).attr("id", function(d) {
							return "node-" + d.name + "-" + d.depth;
						 })
						 .on("click", click);
				
				// 텍스트(노드)
				nodeEnter.append("svg:text")
						 .attr("x", function(d) {
								return d._children ? -8 : 8;
						 })
						 .attr("y", 3)
						 .text(function(d) {							 	
								return d.name;
						 })
						 .on("click", selectNode);
						 
				// Transition node to their position
				// 점(노드)
				nodeEnter.transition()
						 .duration(duration)
						 .attr("transform", function(d) {
								return "translate(" + d.y + ", " + d.x + ")";
						 })
						 .style("opacity", 1)
						 .select("circle")
						 .style("fill", "lightsteelblue");
						 
				node.transition()
					.duration(duration)
					.attr("transform", function(d) {
						// 텍스트 이동
							return "translate(" + d.y + ", " + d.x + ")";
					})
					.style("opacity", 1);
				node.exit().transition()
					.duration(duration)
					.attr("transform", function(d) {
							return "transition(" + source.y + ", " + source.x + ")";
					})
					.style("opacity", 1)
					.remove();
					
				// 엣지
				var link = vis.selectAll("path.link")
							  .data(tree.links(nodes), function(d) {
									return d.target.id;
							  });
							  
				// Enter any new links at the parent's previous position
				link.enter().insert("svg:path", "g").attr("class", "link").attr("d", function(d) {
						// 엣지 방향
						var o = {x: source.x0, y: source.y0};
						return diagonal({source: o, target: o});
					})
					.transition()
					.duration(duration)
					.attr("d", diagonal);
					
				// Transition links to their new position
				link.transition().duration(duration).attr("d", diagonal);
				
				// Transition exiting nodes to their parent's position
				link.exit().transition().duration(duration).attr("d", function(d) {
						var o = {x: source.x, y: source.y};
						return diagonal({source: o, target: o});
					}).remove();
					
				// Stash the old positions to transition
				nodes.forEach(function(d) {
					d.x0 = d.x;
					d.y0 = d.y;
				});
			}
			
			// Toggle children on click
			function click(d) {
				if (d.children) {
					d._children = d.children;
					d.children = null;
				} else {
					d.children = d._children
					d._children = null;
				}
				update(d);
			}
			
			// Node Name Click Event
			function selectNode(d) {
				var id = "node-" + d.name + "-" + d.depth;
				$("circle").each(function() {
					if (id === $(this).attr("id")) {
						$(this).css("fill", "red");
						treeNodeName = id.split("-")[1];
						treeNodeDepth = id.split("-")[2];
					} else {
						$(this).css("fill", "lightsteelblue");
					}
				});
			}
			
			// single product event
			function selectSingleProduct() {
				var productChosenCount = 0;
				$("circle").each(function() {
					if ($(this).css("fill").indexOf("rgb(255,") >= 0) { // red
						productChosenCount++;
					}
				});
				
				if (productChosenCount === 0) {
					var id = $("circle[id$='-0']").attr("id");
					$("circle").each(function() {
						if (id === $(this).attr("id")) {
							$(this).css("fill", "red");
							treeNodeName = id.split("-")[1];
							treeNodeDepth = id.split("-")[2];
						} else {
							$(this).css("fill", "lightsteelblue");
						}
					});
				}				
			}
			// ========================================= 이상 트리차트의 함수
			
			// 레이블 기울기 각도
			var rotate = -30;
			
			// 분석된 막대그래프 보이기
			function showBarChart() {
				rect.transition()
				    .delay(function(d, i) { return i * 10; })
				    .attr("y", function(d) { return y(d[1]); })
				    .attr("height", function(d) { return y(d[0]) - y(d[1]); });	
				
				// X Axis
				g.append("g")
				    .attr("class", "axis axis--x")
				    .attr("transform", "translate(0," + height + ")")
				    .call(d3.axisBottom(x)
				        .tickSize(0)
				        .tickPadding(6))
			        .selectAll("text")
			        .attr("transform", "rotate(" + rotate + ")") // -60
			        .attr("dx", "-.8em")
			        .attr("dy", ".25em")
			        .style("text-anchor", "end")
			        .style("font-size", "12px");
				
				// Y Axis
				g.append("g")
			    .attr("class", "axis axis--y")
			    .attr("transform", "translate(0, 0)")
			    .call(d3.axisLeft(y)
			        .tickSize(0)
			        .tickPadding(6))
				
				d3.selectAll("input")
				    .on("change", changed);
			}
			
			var timeout = d3.timeout(function() {
				d3.select("input[value=\"grouped\"]")
			      .property("checked", true)
			      .dispatch("change");
			}, 2000);
			
			function changed() {
				timeout.stop();
			  	if (this.value === "grouped") {
			  		transitionGrouped();
			  	} else if (this.value === "stacked") {
			  		transitionStacked();
			  	}
			}
			
			function transitionGrouped() {
				y.domain([0, yMax]);
			
			  	rect.transition()
			      	.duration(500)
			      	.delay(function(d, i) { 
			      		// i = m * n : (0 ~ m) * n
			      		return i * 10; })
			      	.attr("x", function(d, i) {
			      		return xn(i) + xn.bandwidth() / n * this.parentNode.__data__.key; })
			      	.attr("width", x.bandwidth() / n)
			    	.transition()
			      	.attr("y", function(d) { return y(d[1] - d[0]); })
			      	.attr("height", function(d) { return y(0) - y(d[1] - d[0]); });
			  	seriesIndex = 0;
			}
			
			function transitionStacked() {
				y.domain([0, y1Max]);
			
			  	rect.transition()
			      	.duration(500)
			      	.delay(function(d, i) { return i * 10; })
			      	.attr("y", function(d) { return y(d[1]); })
			      	.attr("height", function(d) { return y(d[0]) - y(d[1]); })
			    	.transition()
			      	.attr("x", function(d, i) { return xn(i); })
			      	.attr("width", x.bandwidth());
			  	seriesIndex = 0;
			}
			
			// 분석 데이터 구성
			function bumps(m) {				
				if (condition.gender === "C") {
					genders[0] = "M";
					genders[1] = "W";
				} else if (condition.gender === "M") {
					genders[0] = "M";
					console.log("genderBB : " + genders.length);
				} else if (condition.gender === "W") {
					genders[0] = "W";
				} else {
					genders[0] = "All";
				}
				
				if (!!condition.age) {
					ages = [];
					if (condition.ageCompare === "Compare") {
						ages = ["1", "2", "3", "4", "5", "6"];
					} else if (condition.age[0] === "All") {
						ages[0] = "0";
					} else {
						ages = condition.age;
					}
				}
				
				var values = [], i, j, w, x, y, z;
				var period = "";
				var prodName = "";
				var periodName = "";
			
				var xValue = "";
				var l = 0;
				var t = 0;
			  	
				// Initialize with analized data
				var temp = [];
				for (var i = 0; i < genders.length; i++) {
					for (var j = 0; j < ages.length; j++) {
						temp[t] = {};
						temp[t].gender = genders[i];
						temp[t++].age = ages[j];
					}
				}
				
				for ( ; seriesIndex < temp.length; ) {
					for (var k = 0; k < xLabel.length; k++) {
						var seriesData = {};
						seriesData.xAxisLabel = xLabel[k];
						seriesData.gender = temp[seriesIndex].gender;
						seriesData.age = temp[seriesIndex].age;
						seriesData.year = temp[seriesIndex].year;
						seriesData.quater = temp[seriesIndex].quater;
						seriesData.month = temp[seriesIndex].month;
						
						if (condition.xAxisLabel === "product") {
							values[l++] = setProductValue(seriesData);
						} else if (condition.xAxisLabel === "period") {
							values[l++] = setPeriodValue(seriesData);
						} else if (condition.xAxisLabel === "area") {
							values[l++] = setAreaValue(seriesData);
						}
					}
					seriesIndex++;
					break;
				}

				return values;
			}
			
			function setProductValue(seriesData) {
				var value = 0;
				for (var i = 0; i < analData.length; i++) {
					if (condition.treeNodeDepth === "0" || condition.treeNodeDepth === "3") {
	  					prodName = analData[i].productName;
	  				} else if (condition.treeNodeDepth === "1") {
	  					prodName = analData[i].category1;
	  				} else if (condition.treeNodeDepth === "2") {
	  					prodName = analData[i].category2;
	  				}
					
					if (!!analData[i] && !!analData[i].gender && analData[i].gender === seriesData.gender && analData[i].age == seriesData.age && prodName === seriesData.xAxisLabel) { // 데이터, 성별, 연령, 지역 데이터가 모두 있는 경우
						if (!!analData[i].quantity) {
							value = eval(analData[i].quantity);
							break;
						} else {
							continue;
						}
					} else if (!!analData[i] && !!analData[i].gender && analData[i].gender !== seriesData.gender && analData[i].age == seriesData.age && prodName === seriesData.xAxisLabel) { // 성별이 다른 경우
						continue;
					} else if (!!analData[i] && analData[i].age == seriesData.age && prodName === seriesData.xAxisLabel) { // 성별 데이터가 없는 경우, 연령이 같은 경우
						if (!!analData[i].quantity) {
							value = eval(analData[i].quantity);
							break;
						} else {
							continue;
						}
					} else if (!!analData[i] && analData[i].age != seriesData.age && prodName === seriesData.xAxisLabel) { // 연령이 다른 경우
						continue;
					} else if (!!analData[i] && !!analData[i].gender && analData[i].gender === seriesData.gender && prodName === seriesData.xAxisLabel) { // 연령 데이터가 없는 경우
						if (!!analData[i].quantity) {
							value = eval(analData[i].quantity);
							break;
						} else {
							continue;
						}
					} else {
						value = 0;
						continue;
					}
				}
				
				if (value == null || value == undefined || value == "") {
					value = 0;
				}
  				return value;
			}
			
			function setPeriodValue(seriesData) {
				var value = 0;
				for (var i = 0; i < analData.length; i++) {
					if (condition.period === "Year") {
		  				periodName = analData[i].year;
		  			} else if (condition.period === "Quater") {
		  				periodName = analData[i].year + "년 " + analData[i].quater + "분기";
		  			} else if (condition.period === "Month") {
		  				periodName = analData[i].year + "년 " + analData[i].month + "월";
		  			} else if (condition.period === "Specified") {
		  				periodName = condition.periodFrom + " ~ " + condition.periodTo;
		  			} else if (condition.period === "All") {
		  				periodName = "전체";
		  			}
					
					if (!!analData[i] && !!analData[i].gender && analData[i].gender === seriesData.gender && analData[i].age == seriesData.age && periodName === seriesData.xAxisLabel) { // 데이터, 성별, 연령, 지역 데이터가 모두 있는 경우
						if (!!analData[i].quantity) {
							value = eval(analData[i].quantity);
							break;
						} else {
							continue;
						}
					} else if (!!analData[i] && !!analData[i].gender && analData[i].gender !== seriesData.gender && analData[i].age == seriesData.age && periodName === seriesData.xAxisLabel) { // 데이터, 성별, 연령, 지역 데이터가 모두 있는 경우
						continue;
					} else if (!!analData[i] && analData[i].age != seriesData.age && periodName === seriesData.xAxisLabel) { // 성별 데이터가 없는 경우
						continue;
					} else if (!!analData[i] && !!analData[i].gender && analData[i].gender === seriesData.gender && periodName === seriesData.xAxisLabel) { // 연령 데이터가 없는 경우
						if (!!analData[i].quantity) {
							value = eval(analData[i].quantity);
							break;
						} else {
							continue;
						}
					} else {
						continue;
					}
				}
				
				if (value == null || value == undefined || value == "") {
					value = 0;
				}
				return value;
			}
			
			function setAreaValue(seriesData) {
				var value = 0;
				for (var i = 0 ; i < analData.length; i++) {
					if (!!analData[i] && !!analData[i].gender && analData[i].gender === seriesData.gender && analData[i].age == seriesData.age && analData[i].address === seriesData.xAxisLabel) { // 데이터, 성별, 연령, 지역 데이터가 모두 있는 경우
						if (!!analData[i].quantity) {
							value = eval(analData[i].quantity);
							break;
						} else {
							continue;
						}
					} else if (!!analData[i] && !!analData[i].gender && analData[i].gender !== seriesData.gender && analData[i].age == seriesData.age && analData[i].address === seriesData.xAxisLabel) { // 데이터, 성별, 연령, 지역 데이터가 모두 있는 경우
						continue;
					} else if (!!analData[i] && analData[i].age == seriesData.age && analData[i].address === seriesData.xAxisLabel) { // 성별 데이터가 없는 경우
						if (!!analData[i].quantity) {
							value = eval(analData[i].quantity);
							break;
						} else {
							continue;
						}
					} else if (!!analData[i] && analData[i].age != seriesData.age && analData[i].address === seriesData.xAxisLabel) { // 성별 데이터가 없는 경우
						continue;
					} else if (!!analData[i] && !!analData[i].gender && analData[i].gender === seriesData.gender && analData[i].address === seriesData.xAxisLabel) { // 연령 데이터가 없는 경우
						if (!!analData[i].quantity) {
							value = eval(analData[i].quantity);
							break;
						} else {
							continue;
						}
					} else {
						continue;
					}
				}
				
				if (value == null || value == undefined || value == "") {
					value = 0;
				}
				return value;
			}
			// ==================================== 이상 막대그래프의 함수
			/**
			 * 막대그래프 그리는 순서
			 * 1. showBarChart();
			 * 2. timeout();
			 * 3. changed();
			 * 4. transitionGrouped();
			 * 5. changed();
			 * 6. transitionStacked();
			 * 7. changed();
			 * 8. transitionGrouped();
			 */
			
			// 모든 변수 초기화하는 함수
			function initTreeVariables() {
				w = 1360;
				h = 800;
				i = 0;
				duration = 3000;
				root;
				
				// 검색 및 분석
				treeNodeName = "";
				treeNodeDepth = "";
				
				tree = d3.layout.tree().size([h, w - 360]);
				diagonal = d3.svg.diagonal().projection(function(d) {
					return [d.y, d.x];
				});
				
				vis = d3.select("#chart").append("svg:svg")
							.attr("width", w)
							.attr("height", h)
							.append("svg:g")
							.attr("transform", "translate(10, 0)");
			 }
			 
			 function initBarVariables(_condition, _data, _xAxisLabel) {
				// 분석조건과 데이터 대입
				condition = _condition;
				analData = null;
				analData = _data;
				xAxisLabel = _xAxisLabel;
				//=====
				var genderLength = 1;
				var ageLength = 0;
				
				if (!!condition.gender && condition.gender === "C") {
					genderLength = 2;
				}
				if (!!condition.age) {
					if (condition.ageCompare === "Compare") {
						ageLength = 6;
					} else if (condition.age[0] === "All") {
						ageLength = 1;
					} else {
						ageLength = condition.age.length;
					}
				}
				
				n = genderLength * ageLength, // 성별 * 연령
			    m = xAxisLabel.length; // The number of values per series.
			    
		    	// 색상
				color = d3.scaleOrdinal()
				    .domain(d3.range(n))
				    .range(d3.schemeCategory20c);
				
			    if (xLabel.length > 0) {
		    		xLabel = [];
		    	}
			    for (var i = 0; i < xAxisLabel.length; i++) {
			    	xLabel[i] = xAxisLabel[i].label;
			    }
				xz = d3.range(xLabel.length),
				yz = d3.range(n).map(function() { return bumps(m); }),
				y01z = d3.stack().keys(d3.range(n))(d3.transpose(yz)),
				yMax = d3.max(yz, function(y) { return d3.max(y); }),
				y1Max = d3.max(y01z, function(y) { return d3.max(y, function(d) { return d[1]; }); });
				
				svg = d3.select("svg"),
				margin = {top: 40, right: 10, bottom: 50, left: 30},
				width = svg.attr("width") - margin.left - margin.right,
				height = svg.attr("height") - margin.top - margin.bottom,
				g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");
				
				x = d3.scaleBand()
				    .domain(xLabel)
				    .rangeRound([0, width])
				    // bar group 간격
				    .padding(0.08);
				
				xn = d3.scaleBand()
			    .domain(xz)
			    .rangeRound([0, width])
			    // bar group 간격
			    .padding(0.3);
				
				y = d3.scaleLinear()
				    .domain([0, Math.ceil(y1Max)])
				    // bar의 시작위치
				    .range([height, 0]);
				
				timeout = d3.timeout(function() {
					d3.select("input[value=\"grouped\"]")
				      .property("checked", true)
				      .dispatch("change");
				}, 2000);
				
				series = g.selectAll(".series")
					.data(y01z)
					.enter().append("g")
				    .attr("fill", function(d, i) { return color(i); });
			
				// 막대그래프의 사각형
				rect = series.selectAll("rect")
					.data(function(d) { return d; })
					.enter()
					.append("rect")
				    .attr("xl", function(d, i) { return xn(i); })
				    .attr("y", height)
				    .attr("width", x.bandwidth())
				    .attr("height", 0);
			}
		</script>
	
		<div id="tertiary" class="footer-widget-area" role="complementary">
			<div class="footer-widget-wrapper clear">
	 		    <div class="footer-widget">
				    <aside id="nav_menu-4" class="widget widget_nav_menu">
				    <h2 class="widget-title">Pages</h2>
				    <div class="menu-elements-container">
				    
				    <ul id="menu-elements" class="menu">
				    
				    <li id="menu-item-226" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-226"><a href="">회사소개</a></li>
	                <li id="menu-item-227" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-227"><a href="">이용약관</a></li>
					<li id="menu-item-228" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-228"><a href="">1:1 문의</a></li>
					</ul>
					</div>
					</aside>				
				</div>
				
			<div class="footer-widget">
			    <aside id="text-3" class="widget widget_text"><h2 class="widget-title">누구에게나 언제든지 결제가 가능합니다.</h2>
			    <div class="textwidget"><p>이메일 주소 하나로 더욱 쉽고 안전하게 물건이나 서비스 금액을 결제하세요. 모든 지역의 판매자들이 타제인을 이용한 결제를 환영할 것입니다.</p>
			</div>
			
			    </aside>				
			    </div>
				
				<div class="footer-widget">
				<aside id="nav_menu-2" class="widget widget_nav_menu"><h2 class="widget-title">Follow Us</h2>
				<div class="menu-social-container">
					<ul id="menu-social" class="menu">
						<li id="menu-item-111" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-111"><a href="http://facebook.com">Facebook</a></li>
						<li id="menu-item-112" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-112"><a href="http://twitter.com">Twitter</a></li>
						<li id="menu-item-115" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-115"><a href="http://plus.google.com">Google Plus</a></li>
						<li id="menu-item-113" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-113"><a href="http://pinterest.com">Pinterest</a></li>
						<li id="menu-item-114" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-114"><a href="http://dribbble.com">Dribbble</a></li>
					</ul>
				</div>
				</aside>				
				</div>
		    </div>
		</div>
	
	
		<footer id="colophon" class="site-footer" role="contentinfo">
			<div class="site-info">
	      		<a>소비자에게 알림: 타제인™ 이용약관을 주의 깊게 읽어보시기 바랍니다.</a>
			</div>
		</footer>
		</div>
		
	
		<script type='text/javascript' src='//0.gravatar.com/js/gprofiles.js?ver=201708y'></script>
		<script type='text/javascript'>
		/* <![CDATA[ */
		var WPGroHo = {"my_hash":""};
		/* ]]> */
		</script>
		<script type='text/javascript' src='https://s1.wp.com/wp-content/mu-plugins/gravatar-hovercards/wpgroho.js?m=1380573781h'></script>
	
		<script>
			//initialize and attach hovercards to all gravatars
			jQuery( document ).ready( function( $ ) {
	
				if (typeof Gravatar === "undefined"){
					return;
				}
	
				if ( typeof Gravatar.init !== "function" ) {
					return;
				}			
	
				Gravatar.profile_cb = function( hash, id ) {
					WPGroHo.syncProfileData( hash, id );
				};
				Gravatar.my_hash = WPGroHo.my_hash;
				Gravatar.init( 'body', '#wp-admin-bar-my-account' );
			});
		</script>
	
			<div style="display:none">
		</div>
	
			<div id="demosite-activate-wrap" class="demosite-activate">
	            
				<!-- 			
	            <header class="demosite-header">
					<p class="demosite-tagline">지금 회원 가입하세요.</p>
					<a class="demosite-activate-trigger" href="https://wordpress.com/start/with-theme?theme=goran&#038;ref=demo-blog">가입하기</a>
				</header> 
				-->
				
			<div id="demosite-activate">
	
			</div>
			</div>
		<script type='text/javascript' src='https://s2.wp.com/_static/??-eJyNjt0OgjAMRl/IWRESvTE+S2EFCls394M+vpMLQzQx3n1pz3dauHvVOUkkCaYImhbuyD/2U9zBZmWz8iYPLBEMzxThlinTiKINhU84jWQL4nMLpFle3jizV4ZlVr3rclQ9f53YtAYXcK0JLjxgYif/0Gv48Tlqy6JaDGAxJgolKbdQCKyL6j0rhqu9VM3p0NRNdT5OT7VabBU='></script>
		<script type="text/javascript">
		// <![CDATA[
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
		// ]]>
		</script><script src="//stats.wp.com/w.js?56" type="text/javascript" async defer></script>
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
