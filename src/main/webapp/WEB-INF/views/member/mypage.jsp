<%@page import="paypal.dto.member.Member"%>
<%-- <%@page import="paypal.dao.member.MemberDao"%> --%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
  <title>회원 정보</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
  <script type="text/javascript" src="/paypal/resources/js/jquery-3.1.1.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
		
	// 재우 스크립트 공간 시작 ************************************************************************************************************************************
	$(document).ready(function() {
		
		
		/* //생년월일의 표현 형태를 년/월/일 형태로 변경
		$('#birth').text(function() {
			var date = $('#birth').text().split(" ")[0];
			var tmpDate = date.split("-");
			return tmpDate[0] + "-" + tmpDate[1] + "-" + tmpDate[2];
		});
		
		function changeBirthFormat() {
			//var date = $('#birth').split(" ")[0];
			var date = $('#birth').split(" ");
			var tmpDate = date.split("-");
			$('#birth').attr(text, tmpDate[0] + "-" + tmpDate[1] + "-" + tmpDate[2]);
		} */
	});
			
  </script>
  
 
</head>

<body>

<div class="container">

  
  
  
  <hr>
  <h1>회원 정보</h1>
  <hr>
 	
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span> 
        <input type="text" id='email' value="이메일 : ${ requestScope.member.email }" class="form-control" readonly="true" /> 
    </div>
    
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
        <input type="text" value="이름 : ${ requestScope.member.name }" class="form-control" readonly="true" /> 
    </div>
    
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span> 
        <input type="text" id='birth' value="생년월일 : ${ requestScope.member.birth }" class="form-control" readonly="true" /> 
    </div>
    
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-heart"></i></span> 
        <input type="text" value="성별 : ${ requestScope.member.gender }" class="form-control" readonly="true" /> 
    </div>
     
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span> 
        <input type="text" value="전화번호 : ${ requestScope.member.phone }" class="form-control" readonly="true" /> 
    </div>
    
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> 
        <input type="text" value="주소 : ${ requestScope.member.address }" class="form-control" readonly="true" /> 
    </div>
    
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span> 
        <input type="text" value="카드종류 : ${ requestScope.member.cardType }" class="form-control" readonly="true" /> 
    </div>    
    
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span> 
        <input type="text" value="카드번호 : ${ requestScope.member.cardNo }" class="form-control" readonly="true" /> 
    </div>
    
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span> 
        <input type="text" value="카드CVC : ${ requestScope.member.cardCvc }" class="form-control" readonly="true" /> 
    </div>
    
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span> 
        <input type="text" value="카드유효기간 : ${ requestScope.member.cardValidThru }" class="form-control" readonly="true" /> 
    </div>
    
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span> 
        <input type="text" value="가입일 : ${ regdate }" class="form-control" readonly="true" /> 
    </div>
    
    <hr>
    <div>  
	    <button onclick="location.href='../';">뒤로가기</button>	
	        <c:url value="/member/editform.action" var="viewUrl">
	            <c:param name="memberid" value="${ loginuser.memberId }" />
	        </c:url>
	    <button onclick="location.href='${ viewUrl }';">회원정보수정</button>
	    <button onclick="location.href='/paypal/member/dropout.action?email=${ requestScope.member.email}';">회원탈퇴</button>
    </div>	
      
    </div>

</body>
</html>
