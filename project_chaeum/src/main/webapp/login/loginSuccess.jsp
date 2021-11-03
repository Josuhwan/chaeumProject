<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content-wrapper">
	<h1>로그인성공!!!!</h1>
	<hr>
	<h3>회원정보</h3>
	
	<table>
		<tr>
			<th width="70">아이디</th>
			<td>
				<input type="text" name="id" size="30" value="${loginMember.id }">
			</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>
				<input type="text" name="name" value="${loginMember.name }">
			</td>
		</tr>
		<tr>
			<th>암호</th>
			<td>
				<input type="password" name="password" value="${loginMember.password }">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="email" name="email" value="${loginMember.email }">
			</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="button" onclick = "location.href='index.jsp'"value="홈으로">
			</td>
		</tr>
	</table>
</div>












