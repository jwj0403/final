<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
<head>
<title></title>
</head>
<body>

<c:choose>
	<c:when test="${ empty sessionScope.loginuser }">
		<li class="w3-hide-small"><a href="/paypal/member/login.action" class="w3-padding-large w3-hover-white" title="로그인"><i class="fa fa-child">로그인</i></a></li>
	    <li class="w3-hide-small"><a href="/paypal/member/register.action" class="w3-padding-large w3-hover-white" title="회원가입"><i class="fa fa-pencil">회원가입</i></a></li>
	</c:when>           	
	
	<c:otherwise>
		${ loginuser.email }님 환영합니다.
	 	<li class="w3-hide-small"><a href="/paypal/member/logout.action" class="w3-padding-large w3-hover-white" title="로그아웃"><i class="fa fa-user-times">로그아웃</i></a></li>
	 	
	 	<li class="w3-hide-small w3-right">
			<c:url value="/member/mypage.action" var="viewUrl">
				<c:param name="email" value="${ loginuser.email }" />
			</c:url>
				<a href="${ viewUrl }" class="w3-padding-large w3-hover-white" title="계정관리">
				<i class="fa fa-cog">계정관리</i>
			</a>
		</li>
	</c:otherwise>
</c:choose>



</body>
</html>