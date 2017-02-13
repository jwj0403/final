<%@page import="paypal.dto.member.Member"%>
<%@page import="paypal.dao.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
  <title>회원 정보</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

<div class="container">

  <p>
  <p>
  <p>
  <hr>
  <h1>회원 정보</h1>
  <hr>
 
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
        <input type="text" value="아이디 : ${ requestScope.member.memberId }" class="form-control" readonly="true" /> 
    </div>
    <p>
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span> 
        <input type="text" value="이메일 : ${ requestScope.member.email }" class="form-control" readonly="true" /> 
    </div>
    <p>
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span> 
        <input type="text" value="전화번호 : ${ requestScope.member.phone }" class="form-control" readonly="true" /> 
    </div>
    <p>
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> 
        <input type="text" value="주소 : ${ requestScope.member.address }" class="form-control" readonly="true" /> 
    </div>
    <p>
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span> 
        <input type="text" value="가입일 : ${ member.memberRegDate }" class="form-control" readonly="true" /> 
    </div>    
    <p>
    <hr>
    <div>  
	    <button onclick="location.href='../';">뒤로가기</button>	
	        <c:url value="/member/editform.action" var="viewUrl">
	            <c:param name="memberid" value="${ loginuser.memberId }" />
	        </c:url>
	    <button onclick="location.href='${ viewUrl }';">회원정보수정</button>
	    <button onclick="location.href='/andromeda/member/drop.action';">회원탈퇴</button>
    </div>	
      
    </div>

</body>
</html>
