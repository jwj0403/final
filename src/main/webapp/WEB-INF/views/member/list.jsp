<%@page import="paypal.dto.member.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="paypal.dao.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>

<div class="w3-container">
  <h2>회원 목록</h2>

  <table class="w3-table-all w3-hoverable">
    <thead>
      <tr class="w3-container w3-blue">
        <th>아이디(ID)</th>
        <th>이메일</th>
        <th>가입일자</th>
      </tr>
    </thead>
    <c:forEach var="member" items="${ members }">
        		<tr style="height:30px">
        			<td>${ member.memberId }</td>
        			<td>${ member.email }</td>
        			<td>${ member.memberRegDate }</td>
        		</tr>
    </c:forEach>

  </table>
  
</div>

</body>
</html> 


