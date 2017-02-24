<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="paypal.dto.notice.Notice" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<!DOCTYPE html>
<html>


<head>
<title>공지 쓰기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript" src="/paypal/resources/js/jquery-3.1.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		
		/* $('#title').click(function(){
			this.value = "";
		});
		$('#content').click(function(){
			this.value = "";
		}); */
		
		$('#modify_button').click(function(){

			//event.preventDefault();
			//event.stopPropagation();
			
			var title = $('#title');
			var writer = $("#writer");
			var content = $("#content");
			
			
			
			if(title.val() == "") {
				alert("제목을 입력 해주세요.");
				title.focus();
				return;
			};
			if(writer.val().split("@")[1] != "tarjane.com"){
				alert("운영자가 아닙니다.");
				return;
			}
			if(content.val() =="") {
				alert("내용을 입력 해주세요.");
				content.focus();
				return;
			};
			
			if(confirm('글을 수정하시겠습니까?')) {
				$('#modifyForm').submit();	
			}
		});
		
	});

</script>

<!-- 유효성 검사 스크립트 종료 --------------------------------- -->
<!-- 내베게이터 디자인 설정 -->

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

<!-- 바디 CSS 적용 위한 부분. /div종료 태그 필요. -->
<body class="home page page-id-106 page-template page-template-page-templates page-template-front-page page-template-page-templatesfront-page-php mp6 customizer-styles-applied hero-image has-quinary has-custom-background has-footer-navigation navigation-default no-sidebar-full highlander-enabled highlander-light demo-site">
	<div id="page" class="hfeed site">
		<form id="modifyForm" method="post" action="modify.action">
			<table class="table table-striped table-width" align="center">
				<tr style="height: 25px">
					<th>제목</th>
					<td><input type="text" name="title" id="title" value="${ notice.title }"></td>
				</tr>
				
				<tbody>
					<tr>
						<td>작성자</td>
						<c:set var='auth' value="${ sessionScope.loginuser.email }" />
						<c:set var='auth2' value="${ fn:split(auth, '@') }" />
						<td><input type="text" value="${ auth2[0] }" readonly="readonly"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea cols="100" rows="20" name="content" id="content">${ notice.content }</textarea></td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div style="text-align: right;font-size: 15pt;">		
				<a class="label label-default hand-cursor" id=modify_button>수정하기</a>&nbsp;
				<a href='list.action' class="label label-default hand-cursor" id="toList">목록으로</a>&nbsp;
				<a href='../' class="label label-default hand-cursor" id="toHome">홈으로</a>
			</div>
			<br>
			<input type="hidden" name="noticeNo" value="${ notice.noticeNo }" />
			<input type="hidden"  id="writer" name="writer" value="${ sessionScope.loginuser.email }" />
		</form>
	</div>


</body>
</html>
