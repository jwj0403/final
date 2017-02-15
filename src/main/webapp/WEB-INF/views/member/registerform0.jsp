<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!DOCTYPE html>
<html>
<head>
	<title>회원가입</title>

	<!-- Meta-Tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="keywords" content="Valid Login Form Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
	<script type="application/x-javascript">
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0); 
		}, false); 
	
	function hideURLbar(){ 
		window.scrollTo(0,1); 
		} 
	</script>
	
	<!-- //Meta-Tags -->
	
	
	<script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	
	<!-- Custom-Style-Sheet -->
	<link rel="stylesheet" href="/paypal/resources/css/and-style.css"	type="text/css" media="all">
	<link rel="stylesheet" href="/paypal/resources/css/and-bootstrap.css"	type="text/css" media="all">
	<link rel="stylesheet" href="/paypal/resources/css/and-validify.css"		type="text/css" media="all">
	<link rel="Stylesheet" href="/paypal/resources/js/and-validify.js" />
	<link rel="Stylesheet" href="/paypal/resources/js/and-jquery.min.js" />
    <link href="//fonts.googleapis.com/css?family=Alegreya+Sans" rel="stylesheet">	
	
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

	
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
    </script>
    
    
    <script type="text/javascript">
    
 	$(function(){
 		
	$('#register_button').click(function(event) {
		
		event.preventDefault();
		event.stopPropagation();
		
		 var login_id  = document.getElementById("id");   //html 에서 설정한 id값을 변수login_id 에 저장
		 var login_pw  = document.getElementById("password");
		 var login_pw2  = document.getElementById("password_chk");
		 var login_name  = document.getElementById("name");
		 var login_pnum  = document.getElementById("pnum");
		 var login_email = document.getElementById("email");
		 var login_gen  = document.getElementById("gender");
		 var login_content  = document.getElementById("content");
		 
		 
		 //아이디 입력여부 검사
		 if(login_id.value == ""){    //id의 값이 null이면 창 띄우고 커서 옮김
		  alert("아이디를 입력하세요");
		  login_id.focus();
		  return
		 };	
		 
		 //아이디 유효성 검사(영어소문자, 숫자만 허용)
		 for (var i = 0; i < login_id.value.length; i++) {
		  /* ch = login_id.value.charAt(i) */
		  
		  var regexp = /^[a-z]+[a-z0-9]{5,11}$/g;
		  if (!regexp.test(login_id.value)) {
			   alert("아이디는 영문소문자로 시작하는 6~12자 영문소문자 또는 숫자이어야 합니다.")
			   login_id.focus()
			   login_id.select()
			   login_id.value =""
    		   return
		  }  
           /*
           if (!(ch>='0' && ch<='9')&&!(ch>='a' && ch<='z')) {
		   alert("아이디는 소문자, 숫자만 입력가능합니다.")
		   login_id.focus()
		   login_id.select()
		   login_id.value =""
		   return
		  } */
		 };		 
		 
         /* 		 
		 //아이디 길이체크
		 if (login_id.value.length<6 || login_id.value.length>12) {
		  alert("아이디를 6~12자 까지 입력해주세요.")
		  login_id.focus()
		  login_id.select()
		  return
		 }; */		 
		 
		 //패스워드 입력여부 검사
		 if(login_pw.value == ""){
		  alert("비밀번호를 입력하세요");
		  login_pw.focus();
		  return
		 };
		 
		 //패스워드 유효성 검사(영어소문자, 숫자만 허용)
		 for (var i = 0; i < login_pw.value.length; i++) {
		  /* ch = login_id.value.charAt(i) */
		  
		  var regexp = /^[a-z]+[a-z0-9]{5,11}$/g;
		  if (!regexp.test(login_pw.value)) {
			   alert("패스워드는 영문소문자로 시작하는 6~12자 영문소문자 또는 숫자이어야 합니다.")
			   login_pw.focus()
			   login_pw.select()
			   login_pw.value =""
    		   return
		  }
		 };
		 		 
         /* 		 
		 //패스워드 길이체크
		 if (login_pw.value.length<6 || login_pw.value.length>8) {
		  alert("패스워드를 6~8자 까지 입력해주세요.")
		  login_pw.focus()
		  login_pw.select()
		  return
		 };		 
         */
		 
		 //패스워드와 패스워드 확인 일치여부 체크
		 if (login_pw.value != login_pw2.value) {
		  alert("패스워드가 일치하지않습니다")
		  login_pw.value =""
		  login_pw2.value =""
		  return
		 };
		 
		 //이름 입력여부 검사
		 if(login_name.value == ""){ 
		  alert("이름을 입력하세요");
		  login_name.focus();
		  return
		 };
		 
		 //프로필 입력여부 검사
		 if(login_content.value == ""){    //프로필 내용이 null이면 창 띄우고 커서 옮김
		  alert("자기소개를 입력하세요");
		  login_content.focus();
		  return
		 };
		 
		 //전화번호 입력여부 검사
		 if(login_pnum.value == ""){ 
		  alert("전화번호를 입력하세요");
		  login_phone.focus();
		  return
		 };		 
		 
		 //전화번호 길이체크
		 if (login_pnum.value.length<10 || login_pnum.value.length>11) {
		  alert("전화번호를 다시 입력해 주세요.")
		  login_pw.focus()
		  login_pw.select()
		  return
		 };
		 
		 //이메일 입력여부 검사
		 if(login_email.value == ""){ 
		  alert("이메일을 입력하세요");
		  login_email.focus();
		  return
		 };
		 
		//이메일 형식체크 (@,'.' 가 있아야함) 
		 if (((login_email.value.indexOf('@')) <=0) && (login_email.value.indexOf('.')<=0)){
		  alert("정상적인 이메일이 아닙니다.")
		  login_email.value = "";
		  login_email.focus();
		  return;
		 };
		 
		 
		//AJAX(JSON타입)
  		  $.ajax({
		    type:"POST",     //페이지 이동시 넘어가는 값이 숨겨짐 
		    url:"register.action",     //이동할 페이지  
		    //data: "memberId="+login_id+"&passwd="+login_pw+"&name="+login_name+"&phone="+login_pnum+"&email="+login_email+"&gender="+login_gen,
		    data: $('#thisForm').serialize(),
		    success:function(data){   //성공시 가져오는 데이터를 data에 저장하여 사용
		             alert("회원가입을 축하합니다!");
		             location.href='../';
		         },
		         error:function(jqXHR, textStatus, errorThrown){     //에러발생시 출력할 메세지
		             alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		             self.close();
		         }
		         
		     });
	})

		$('#id_chk').click(function(event){
 			 var login_id = $("#id").val(); 
			 
				//AJAX(JSON)
				 $.ajax({
				   type:"GET",   //함께 이동하는 값이 url에 찍힘
				   url: "idcheck.action",
				   data: { "email":login_id },   //JSON형식으로 값 보내기     
				   dataType: "text",
				         success : function(data){
				         alert(data);   //console창에 찍어보기
				        },
				        error : function(request, status, error){
				          alert("에러발생" + status)
				   		}
				});
			
			
			event.preventDefault();
		})		
		
 		$(document).on("keyup", "input:text[numberOnly]", 
		   function() {$(this).val( $(this).val().replace(/^(01[01]{1})-?([0-9]{3,4})-?([0-9]{4})$/gi,"") );});
			 		
 	});
 	
	</script>
    


</head>
<body>
	<br>
	<br>
	<h1 id="title" style="font-size:30pt;color: white;">TarJane 가입 하기</h1>
	<br>
	<br>
	<div class="containerw3layouts-agileits">		
	    <form id="thisForm" action="register.action" method="post" action="login.action" method="post" novalidate>
	        	<div class="form-group agileits-w3layouts">
				    <input type="hidden" name="returnurl" value='${ empty requestScope.returnurl ? "" : requestScope.returnurl }' />
				</div>
				<div class="form-group w3-agile password" >
					<input type="email" id="email" name="email" class="form-control agileinfo textbox" placeholder="이메일 양식에 맞게 입력하세요"/>
				</div>
				<div class="form-group w3-agile password">
					<input type="text" id="id" name="memberId" class="form-control agileinfo textbox" placeholder="아이디(영문소문자로 시작하는 6~12자 영문소문자 또는 숫자)">					
					<input type="button" id="id_chk" class="button3" value="중복체크" style="float:left;"/>
				</div>	
				<div class="form-group w3-agile password">
					<input type="password" id="password" name="passwd" class="form-control w3-agileits textbox" placeholder="비밀번호(영문소문자로 시작하는 6~12자 영문소문자 또는 숫자)">
				</div>
				<div class="form-group w3-agile password">
					<input type="password" id="password_chk" name="confirm" class="form-control w3-agileits textbox" placeholder="비밀번호 확인">
				</div>
				<div class="form-group w3-agile password" >
					<input type="tel" id="pnum" name="phone" class="form-control agileinfo textbox" placeholder="전화번호  -  를 제외하고 숫자만 입력하세요"/>
				</div>
					
				<div class="form-group w3-agile password" style="text-align:left;">
                     <a style="color: white;">남성 </a><input type="radio" id="m" name="gender" value="m"  checked="checked"/>
		             <a style="color: white;">여성 </a> <input type="radio" id="w" name="gender" value="w" />	    
				</div>	
				<div class="form-group w3-agile password" >
					<input type="text" id="name" name="name" class="form-control agileinfo textbox" placeholder="이름"/>
				</div>
				<div class="form-group w3-agile password">
			    	<input type="date" name="birth" class="form-control agileinfo textbox" placeholder="생년월일"/>
		        </div>
		        <div class="form-group w3-agile password">
		            <input type="hidden" name="authority" value="u"/>
            		<input type="hidden" name="deleted" value="N"/>
		        </div>
		        
     			<div class="form-group w3-agile password" >
					<input type="text" id="content" name="content" class="form-control agileinfo textbox" placeholder="간단한 자기 소개를 입력하세요"/>
				</div>
		        
		        		        		        
		        <div class="form-group w3-agile password">
		        	<input type="text" name="postNo" id="sample6_postcode" class="form-control agileinfo textbox" placeholder="우편번호" />      
		        </div>
		        <div class="form-group w3-agile password">		                    
                	<input type="text" name="address" id="sample6_address" class="form-control agileinfo textbox" placeholder="상세주소"/>
                </div>
                <div class="form-group w3-agile password"  style="text-align:left;">
                	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="text-align:left;"/>
                </div>
                
                
                
                

				<div class="form-group w3-agile submit">				
					<button type="submit" id="register_button" class="btn btn-default btn-osx w3-agileits btn-lg"><i class="fa agileinfo fa-arrow-circle-right"></i></button>				
<!-- 				<input type="submit" id="register_button" value="회원가입"> -->					
				</div>
				<div class="alert agileits-w3layouts alert-success hidden" role="alert">등록완료!</div>
			</form>
		</div>

		<div class="w3lsfooteragileits">
			<p> &copy; 2016 Valid Register Form. All Rights Reserved | Design by <a href="http://w3layouts.com" target="=_blank">W3layouts</a></p>
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
</html>


