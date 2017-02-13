<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>

<!-- Head -->
<head>

<title>Valid Login Form A Flat Responsive Widget Template :: W3layouts</title>

<!-- Meta-Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="Valid Login Form Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Meta-Tags -->

<!-- Custom-Style-Sheet -->
<link rel="stylesheet" href="/andromeda/resources/css/and-style.css"	type="text/css" media="all">
<link rel="stylesheet" href="/andromeda/resources/css/and-bootstrap.css"	type="text/css" media="all">
<link rel="stylesheet" href="/andromeda/resources/css/and-validify.css"		type="text/css" media="all">
<link rel="Stylesheet" href="/andromeda/resources/js/and-validify.js" />
<link rel="Stylesheet" href="/andromeda/resources/js/and-jquery.min.js" />


<!-- //Custom-Style-Sheet -->

<!-- Fonts -->
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900"		type="text/css" media="all">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Montserrat:400,700"					type="text/css" media="all">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"	type="text/css" media="all">
<!-- //Fonts -->

<!-- Style -->
<style type="text/css">
	@-webkit-keyframes AnimationName {
		0%{background-position:15% 0%}
		50%{background-position:86% 100%}
		100%{background-position:15% 0%}
	}

	@-moz-keyframes AnimationName {
		0%{background-position:15% 0%}
		50%{background-position:86% 100%}
		100%{background-position:15% 0%}
	}

	@keyframes AnimationName { 
		0%{background-position:15% 0%}
		50%{background-position:86% 100%}
		100%{background-position:15% 0%}
	}

	.textbox {
		margin: 20px 0;
		padding: 15px 20px;
		color: #fff;
		background-color: rgba(0, 0, 0, .25);
		border: 1px solid #CCC;
		border-radius: 0;
		box-shadow: none !important;
		transition: all .2s linear;
	}

	.btn-osx, button[disabled] {
		padding: 5px 10px;
		color: #fff;
		background-color: rgba(0, 0, 0, .1)!important;
		border: 1px solid rgba(255, 255, 255, .2);
		box-shadow: none !important;
		transition: all .2s linear;
		border-radius: 50%;
		font-size: 20px;
	}

	.btn-default:hover, .btn-default:focus, .btn-default.focus, .btn-default:active, .btn-default.active, .open > .dropdown-toggle.btn-default {
		color: #FFF;
		opacity: 1;
		border-color: #FFF!important;
	}

	@media screen and (max-width: 640px) {
		.textbox {
			margin: 20px 0;
			padding: 12px;
			font-size: 13px;
		}
	}
	

</style>
<!-- //Style -->

</head>
<!-- //Head -->



	<!-- Body -->
	<body>
		<br>
		<br>
		<br>
		<br>
		<br>		
		<h1 id="title" style="font-size:50pt;color: white;">Login User</h1>
		<br>
		<br>
		<br>
		<div class="containerw3layouts-agileits">

			<form action="login.action" method="post" id="demo" novalidate>
				<div class="form-group agileits-w3layouts">
				    <input type="hidden" name="returnurl" value='${ empty requestScope.returnurl ? "" : requestScope.returnurl }' />
				</div>
				<div class="form-group w3-agile password">
					<input type="text" id="id" class="form-control agileinfo textbox" name="memberId" required placeholder="ID">
				</div>				
				<div class="form-group w3-agile password">
					<input type="password" id="password" name="passwd" class="form-control w3-agileits textbox" required placeholder="Password">
				</div>

				<div class="form-group w3-agile submit">				
					<button id="login_button" class="btn btn-default btn-osx w3-agileits btn-lg"><i class="fa agileinfo fa-arrow-circle-right"></i></button>
				</div>
				<div class="alert agileits-w3layouts alert-success hidden" role="alert">Login Successful!</div>
			</form>
		</div>

		<div class="w3lsfooteragileits">
			<p> &copy; 2016 Valid Login Form. All Rights Reserved | Design by <a href="http://w3layouts.com" target="=_blank">W3layouts</a></p>
		</div>



		<!-- Necessary-JavaScript-Files-&-Links -->

			<!-- Default-JavaScript --><script type="text/javascript" src="js/jquery.min.js"></script>
			<script src="js/validify.js"></script>
			<script>
				$("#demo").validify({
					onSubmit: function (e, $this) {
						$this.find('.alert').removeClass('hidden')
					},
					onFormSuccess: function (form) {
						console.log("Form is valid now!")
					},
					onFormFail: function (form) {
						console.log("Form is not valid :(")
					}
				});
			</script>

		<!-- //Necessary-JavaScript-Files-&-Links -->



	</body>
	<!-- //Body -->

</html>



