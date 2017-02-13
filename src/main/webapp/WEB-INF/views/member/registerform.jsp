<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>가입양식</title>
</head>

<body>
	<div style="padding-left:20px">
		<h2 style="text-align:center">가입양식</h2>		
		<form action="register.action" method="post">
		<table border="1" style="width:560px;margin:0 auto">
			<tr>
				<th style="width:150px">이메일</th>
				<td><input type="text" name="email" style="width:400px"></td>
			</tr>
			<tr>
				<th style="width:150px">패스워드</th>
				<td><input type="password" name="passwd" style="width:400px"></td>
			</tr>
			<tr>
				<th style="width:150px">이름</th>
				<td><input type="text" name="name" style="width:400px"></td>
			</tr>			
			<tr>
				<th style="width:150px">주소</th>
				<td><input type="text" name="address" style="width:400px"></td>
			</tr>
			<tr>
				<th style="width:150px">휴대전화</th>
				<td><input type="text" name="phone" style="width:400px"></td>
			</tr>
			<tr>
				<th style="width:150px">생년월일</th>
				<td><input type="text" name="birth" style="width:400px"></td>
			</tr>
			<tr>
				<th style="width:150px">성별</th>
				<td><input type="radio" name="gender" value="M" style="width:200px">남자</td>
				<td><input type="radio" name="gender" value="F" style="width:200px">여자</td>
			</tr>
			<tr>
				<td colspan="2" style='text-align:center'>
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
		</form>		
	</div>
</body>
</html>
