<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="paypal.dto.notice.Notice" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>

<style>

span 

</style>

<head>
  <title>사이트 공지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
  <script type="text/javascript" src="/paypal/resources/js/jquery-3.1.1.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 
</head>

<body>


<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<table class="table table-striped table-width" align="center">
			
			<tr style="background-color:#cccccc;height:25px">
				<th style="width:50px">번호</th>
				<th style="width:300px">제목</th>
				<th style="width:150px">작성자</th>
				<th style="width:120px">작성일</th>
				<th style="width:80px">조회수</th>
				
			</tr>
			<tr> 
			<td>
			${ notice.noticeNo }
			</td>
			<td>
			${ notice.title }
			</td>
			<td>
			${ notice.writer }
			</td>
			<td>
			<fmt:formatDate value="${ notice.regdate }" pattern="yyyy-MM-dd" />
			</td>
			<td>
			${ notice.readCount }
			</td>
			</tr>
			<tr>
			<td colspan="5">
			${ notice.content }
			</td>
			</tr>
			
			
	</table>
	<br>
	<div id="paging" style="text-align:center">${ requestScope.paging }</div>
	<br>
	<span class="label label-default hand-cursor" id="toHome">홈으로</span><br>
	<span class="label label-default hand-cursor" id="toList">목록으로</span><br>
	<form id="article-write"></form>
	

</body>
</html>