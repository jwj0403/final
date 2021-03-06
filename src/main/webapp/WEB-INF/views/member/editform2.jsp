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
		
	// 재우 스크립트 공간 시작 ************************************************************************************************************************************
	$(function(){
 		
 		//등록 버튼 눌렀을 때 유효성 검사.
 		$('#modify_button').click(function(event) {
 			
			event.preventDefault();
			event.stopPropagation();
			
			//전송할 데이터의 형식 검사를 위해서 요소들을 변수에 담기
			var login_pw  = document.getElementById("passwd");
			var login_pw2  = document.getElementById("passwd_chk");
			var login_birth  = document.getElementById("birth");
			var login_gen  = document.getElementById("gender");
			var login_pnum  = document.getElementById("pnum");
			
			//이메일 형식체크 (@,'.' 가 있아야함) 
			 if (((login_email.value.indexOf('@')) <=0) && (login_email.value.indexOf('.')<=0)){
				alert("이메일 형식을 확인해주세요.");
				login_email.value = "";
				login_email.focus();
				return;
			 };
			 
			//패스워드 유효성 검사(영문 + 숫자 6~20자리)
			for (var i = 0; i < login_pw.value.length; i++) {
				var regexp =  /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
				if (!regexp.test(login_pw.value)) {
					alert("패스워드는 6~20자의 영문자와 숫자로 만들어야 합니다.");
					login_pw.focus();
					login_pw.select();
					login_pw.value ="";
					return;
				};
			};
			//패스워드와 패스워드 확인 일치여부 체크
			if (login_pw.value != login_pw2.value) {
				alert("패스워드가 일치하지않습니다");
				login_pw.value ="";
				login_pw2.value ="";
				return;
			};
			 
					 
			//전화번호 정규식
			for (var i = 0; i < login_pnum.value.length; i++) {
				var regexp =  /[01](0|1|6|7|8|9)(\d{4}|\d{3})\d{4}$/g;
				 if (!regexp.test(login_pnum.value)) {
					alert("핸드폰 번호를 확인해 주세요.");
					login_pnum.focus();
					login_pnum.select();
					login_pnum.value ="";
						return;
				 }
			};
			
			//AJAX로 가입 정보 form 보내기
			$.ajax({
				type : "POST",
				url : "modifymember.action",
				data : $('#modifyForm').serialize(),
				success:function(data){   //성공시 가져오는 데이터를 data에 저장하여 사용
			         alert("정보가 수정 되었습니다.");
			         location.href='../'
			     },
			     error:function(jqXHR, textStatus, errorThrown){     //에러발생시 출력할 메세지
			         alert("에러 발생가 발생했습니다. 다시 시도 해주세요.");
			         self.close();
			     }
			});
		})
		//---- 유효성 검사 종료--------------------
				
		
	});
			
  </script>

	
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
		    <form:password id="passwd" name="passwd" path="passwd" class="form-control" />
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
		    <input type="text" name="address3" id="sample6_address" class="form-control" /> 
		</div>
		    
		<div class="input-group">
		    <span class="input-group-addon">우편번호 : </span> 
		    <input type="text" name="postNo" id="sample6_postcode" class="form-control" /> 
		</div>
		
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/>
		<hr>       
		
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
	
		<button id="modify_button">정보수정</button>
	
	</form:form>
	<button onclick="location.href='../';" >취소</button>

</div>

</body>
</html>
