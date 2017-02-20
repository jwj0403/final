<%@page import="paypal.dto.member.Notice"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
       
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>게시물 목록</title>
	<link rel="Stylesheet" href="/paypal/resources/styles/default.css" />
	
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	
	<%-- <div id="pageContainer">
		
		<div style="padding-top:25px;text-align:center">

			<a href='writeform.action'>글쓰기</a>
			<br /><br />
			
			<table border="1" align="center">
				<tr style="background-color:beige;height:25px">
					<th style="width:50px">번호</th>
					<th style="width:300px">제목</th>
					<th style="width:150px">작성자</th>
					<th style="width:120px">작성일</th>
					<th style="width:80px">조회수</th>
				</tr>
				<% for (Board b : boards) { %>
				<tr style="background-color:white;height:25px">
					<td style="width:50px"><%= b.getBoardNo() %></td>
					<td style="width:300px;text-align:left;padding-left:5px">
					
						<% for (int i = 0; i < b.getDepth(); i++) { %>
						&nbsp;&nbsp;
						<% } %>
						<% if (b.getDepth() > 0) { %>
						<img src="/demoweb/image/re.gif" />
						<% } %>
					
						<% if (b.isDeleted()) { %>
						<span style='color:gray' onclick="alert('삭제된 글입니다.');">
							<%= b.getTitle() %>&nbsp;(삭제된 글)
						</span>
						<% } else { %>
						<a href='detail.action?boardno=<%= b.getBoardNo() %>
							&pageno=<%= request.getAttribute("pageno") %>'>
							<%= b.getTitle() %>
						</a>
						<% } %>
					</td>
					<td style="width:150px"><%= b.getWriter() %></td>
					<td style="width:120px"><%= b.getRegDate() %></td>
					<td style="width:80px"><%= b.getReadCount() %></td>
				</tr>
				<% } %>
				
			</table>
			
			<br /><br />
			아래는 페이지 번호 출력
			<%= request.getAttribute("pager").toString() %>
	
		</div>
	</div>
 --%>
</body>
</html>













