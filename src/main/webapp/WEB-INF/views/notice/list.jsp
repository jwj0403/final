<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="paypal.dto.notice.Notice" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​


<!DOCTYPE html>
<html>
<head>
  <title>공지 목록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
  <script type="text/javascript" src="/paypal/resources/js/jquery-3.1.1.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 

<!-- 
<style type="text/css">
	.hand-cursor {
		cursor: pointer;
	}
	
	.table-width {
		width: 1024px;
		text-align: center;
	}
</style>
 -->
 
<script type="text/javascript">
	$(document).ready(function() {
		var params = "searchSelect=" + $("select#searchSelect option:selected").val() + "&searchText=" + $("#searchText").val();
		$("#write").on("click", function() {
			$("#article-write").attr({
				"method" : "post",
				"action" : "../board/writeform.toran?" + params
			});
			$("#article-write").submit();
		});
		
		// select 옵션 체인지
		$("#searchSelect").on("change", function() {
			var selected = $("#searchSelect").val();
			if (selected == "none") {
				$("#searchTextDiv").hide();
			} else if (selected == "title") {
				$("#searchTextDiv").show();
			} else if (selected == "content") {
				$("#searchTextDiv").show();
			} else if (selected == "vote") {
				$("#searchTextDiv").hide();
			} else if (selected == "mine") {
				$("#searchTextDiv").hide();
			} else if (selected == "tag") {
				$("#searchTextDiv").show();
			} else if (selected == "writer") {
				$("#searchTextDiv").show();
			}
		});
		
		// 서치버튼 클릭
		$("#searchButton").on("click", function() {
			$("#search").attr({
				"method" : "post",
				"action" : "../board/list.toran"
			});
			
			if (checkValidationForSearch()) {
				$("#search").submit();
			}
		});
		
		// 파라미터 초기화
		$("#searchSel").on("change", function() {
			$("#searchText").val("");
			$("#searchSelect").val($("option:selected").val());
			var value = $("option:selected").val();
			if (value == "vote" || value == "mine") {
				$("#searchText").hide();
			} else {
				$("#searchText").show();
			}
			$("#searchSel").val("${ requestScope.searchSelect }");
		});
		
		// 파라미터 셋팅
		var searchDiv = "${ requestScope.searchSelect}";
		var searchText = "${ requestScope.searchText}";
		if (searchDiv != null) {
			$("#searchSelect").val(searchDiv).attr("selected", "selected");
			$("#searchText").val(searchText);
		}
	});
	
	function checkValidationForSearch() {
		var sel = $("#searchSel option:selected").val();
		var text = $("#searchText").val();
		
		if (sel == "none") {
			alert("검색조건을 선택하십시오.");
			$("#searchSel").select();
			return false;
		} else if (!(sel == "vote" || sel == "mine")) {
			if (text == null || text == undefined || text.trim() == "") {
				alert("검색어를 입력하십시오.");
				$("#searchText").select();
				return false;
			}
		} else if (sel == "vote" || sel == "mine") {
			$("#searchText").val("");
		}
		
		return true;
	}
</script>

 
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
			
			<c:forEach var="notice" items="${ requestScope.notice }">
				<tr style="height: 30px">
					<td>${ notice.noticeNo }</td>
					<td style='text-align:left;padding-left:5px'>
						<a href='detail.action?noticeNo=${ notice.noticeNo }&pageNo=${ requestScope.pageNo }'>${ notice.title }</a>
					</td>
					<td>${ notice.writer }</td>
					
					<%-- <fmt:formatDate var="parsedDate" value="${ notice.regdate }" pattern="dd-MM-yyyy"> --%>
					<td>
					<fmt:formatDate value="${ notice.regdate }" pattern="yyyy-MM-dd" />
					</td>
					<td>${ notice.readCount }</td>
				</tr>
				</c:forEach>
			
			<%-- 
			<c:choose>
				<c:when test="${ requestScope.size eq 0 }">
					<tr style="text-align:center">
						<td colspan="5">게시글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
				<c:forEach var="notice" items="${ requestScope.Notice }">
				<tr style="height: 30px">
					<td>${ notice.noticeNo }</td>
					<td style='text-align:left;padding-left:5px'>
					
						${ article.replyBlank }
						<c:if test="${ article.depth gt 1 }">
							<img src='/sportscenter/images/board/re.gif'>
						</c:if>
					
						<c:choose>
							<c:when test="${ article.deleted eq article.deletedArticle }">
								<span style='color:gray' onclick='alert("삭제된 글입니다.")'>
									${ notice.title } [ 삭제된 글 ]
								</span>
							</c:when>
							<c:otherwise>
								<a href='../board/detail.toran?articleNo=${ notice.noticeNo }&pageNo=${ requestScope.pageNo }'>${ notice.title }</a>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${ notice.writer }</td>
					<td>${ notice.regdate }</td>
					<td>${ article.hit }</td>
				</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
			 --%>
			
			
			<!-- 검색 관련 -->
			<tr>
				<td colspan="5">
					<form id="search">
						<span id="searchSelectDiv">
							<select id="searchSelect" name="searchSelect">
								<option id="none" value="none">선택</option>
								<option id="title" value="title">제목</option>
								<option id="content" value="content">내용</option>
								<option id="vote" value="vote">추천</option>
								<option id="mine" value="mine">내글</option>
								<option id="tag" value="tag">태그</option>
								<option id="writer" value="writer">글쓴이</option>
							</select>
						</span>
						<span id="searchTextDiv">
							<input type="text" id="searchText" name="searchText">
						</span>
						<span id="searchButtonDiv">
							<span class="label label-default hand-cursor" id="searchButton">조회</span>
						</span>
						<input type="hidden" name="boardName" value="자유게시판">
					</form>
				</td>
			</tr>
			
	</table>
	<br>
	<div id="paging" style="text-align:center">${ requestScope.paging }</div>
	<br>
	<span class="label label-default hand-cursor" id="write">글쓰기</span><br>
	<form id="article-write"></form>
	

</body>
</html>
