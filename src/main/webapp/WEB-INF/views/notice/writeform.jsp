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
		
	/* 	$('#toHome').click(function(){
			$('#toHome').attr({
				'method' : 'post',
				'action' : '../paypal/'
			})
		}); */
		
		
		$('#write_button').click(function(){

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
			
			
			$('#noticeForm').submit();
		});
		
		
	});

</script>
 
</head>

<body>


<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<form id="noticeForm" method="post" action="write.action">
		<table class="table table-striped table-width" align="center">
			<!-- <tr style="background-color:#cccccc;height:25px"> -->
			<tr style="height: 25px">
				<th>제목</th>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			
			<tbody>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" id="writer" value="${ sessionScope.loginuser.email }" readonly="readonly"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="content" id="content"></td>
				</tr>
			</tbody>
		
				
		</table>
		<br>
		<br>
		<a class="label label-default hand-cursor" id="write_button">글쓰기</a><br>
		<a href='list.action' class="label label-default hand-cursor" id="toHome">목록으로</a><br>	
	</form>	

<c:set var='auth' value="${ sessionScope.loginuser.email }"></c:set>
<c:set var='auth2' value="${fn:split(auth, '@') }"></c:set>
<c:if test="${ auth2[1] eq 'tarjane.com' }" >운영자 입니다.</c:if>
<c:if test="${ auth2[1] ne 'tarjane.com' }" >운영자 아닙니다.</c:if>

</body>
</html>
