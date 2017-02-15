<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>


<head>

	<title>회원정보 수정</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>    
	<!-- <script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- 	
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
 		
	$('#edit_button').click(function(event) {
		
		event.preventDefault();
		event.stopPropagation();
		
		 var login_id  = document.getElementById("id");   //html 에서 설정한 id값을 변수login_id 에 저장
		 var login_pw  = document.getElementById("password");
		 var login_pw2  = document.getElementById("password_chk");
		 var login_name  = document.getElementById("name");
		 var login_pnum  = document.getElementById("pnum");
		 var login_email = document.getElementById("email");
		 var login_gen  = document.getElementById("gender");
		 
		 
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
		    url:"editmember.action",     //이동할 페이지  
		    //data: "memberId="+login_id+"&passwd="+login_pw+"&name="+login_name+"&phone="+login_pnum+"&email="+login_email+"&gender="+login_gen,
		    data: $('#editForm').serialize(),
		    success:function(data){   //성공시 가져오는 데이터를 data에 저장하여 사용
		             alert("수정되었습니다.");
		             location.href='../';
		         },
		         error:function(jqXHR, textStatus, errorThrown){     //에러발생시 출력할 메세지
		             alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		             self.close();
		         }
		         
		     });
	})

		
		$(document).on("keyup", "input:text[numberOnly]", 
		   function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
			 		
 	});
 	
 	
	</script>
 -->

	
</head>

<body>


<div class="container">

  
  
  
  <hr>
  <h1>회원 정보 수정</h1>
  <hr>
  <form:form id="editForm" action="modifymember.action" method="post" modelAttribute="member"><!-- 상대경로표시 -->
     
    <div class="input-group">
        <span class="input-group-addon">이메일 : </span> 
        <form:input type="email" id="email" name="email" path="email" class="form-control" readonly="true" /> 
    </div>
    
    <div class="input-group">
        <span class="input-group-addon">패스워드 : </span>
        <form:password id="password" name="passwd" path="passwd" class="form-control" />
    </div>
    
    <div class="input-group">
        <span class="input-group-addon">패스워드 확인 : </span>
        <input type="password" id="password_chk" name="confirm" class="form-control" />
    </div>    

    <div class="input-group">
        <span class="input-group-addon">전화번호 : </span> 
        <form:input type="tel" id="pnum" name="phone" path="phone" class="form-control" /> 
    </div>
<%--        
    <div class="input-group">
        <span class="input-group-addon">이름 : </span> 
        <form:input type="text" id="name" name="name" path="name" class="form-control" readonly="true" />
    </div>
        
    <div class="input-group">
        <span class="input-group-addon">생년월일 : </span> 
        <form:input type="text" id="birth" name="birth" path="birth" class="form-control" readonly="true" /> 
    </div>
        

    <div class="input-group">
        <span class="input-group-addon">성별 : </span> 
        <form:input type="hidden" id="gender" name="gender" path="gender" class="form-control" readonly="true" /> 
    </div>
 --%>
 <%--        
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span> 
        <form:input type="text" id="regdate" name="regdate" path="memberRegDate" class="form-control" readonly="true" /> 
    </div> 


    <input type="hidden" id="gender" name="gender" path="gender" />
    <input type="hidden" name="authority" value="u"/>        
    <input type="hidden" name="deleted" value="N"/>        
 --%>       
    <div class="input-group">
        <span class="input-group-addon">상세주소 : </span> 
        <input type="text" name="address" id="sample6_address" class="form-control" /> 
    </div>
  <!--      
    <div class="input-group">
        <span class="input-group-addon">우편번호 : </span> 
        <input type="text" name="postNo" id="sample6_postcode" class="form-control" /> 
    </div>
    
    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/>
    <hr>       
    -->
    <div class="input-group">
        <span class="input-group-addon">카드종류 : </span> 
        <input type="text" name="cardType" id="sample6_address" class="form-control" /> 
    </div>
    <div class="input-group">
        <span class="input-group-addon">카드번호 : </span> 
        <input type="text" name="cardNo" id="sample6_address" class="form-control" /> 
    </div>
    <div class="input-group">
        <span class="input-group-addon">카드CVC : </span> 
        <input type="text" name="cardCvc" id="sample6_address" class="form-control" /> 
    </div>
    <div class="input-group">
        <span class="input-group-addon">카드유효기간 : </span> 
        <input type="text" name="cardValidThru" id="sample6_address" class="form-control" /> 
    </div>

	<button id="edit_button">정보수정</button>
		
    </form:form>
    <button onclick="location.href='../';" >취소</button>
    
    </div>

</body>
</html>
