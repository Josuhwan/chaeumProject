<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
  table {border: 2px double pink; width:300px}
  td,th{border:1px pink solid ; text-align: left; padding:5px}
  input[type=submit] {   
  					color: black; padding: 5px 11px; 
  					margin: 8px 0; border: none; 
  					border-radius: 4px; 
  					cursor: pointer; }
 
</style>
<div class="content-wrapper">
	<h1>회원상세정보</h1>
	<hr>
	<h3>회원정보</h3>
	
	<form action="updateMember.do" method="get">
	<table>
		<tr>
			<th>이메일</th>
			<td>
				<input type="email" name="email" value="${oneMember.email }">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="m_pass" value="${oneMember.m_pass }">
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>
				<input type="text" name="nickname" value="${oneMember.nickname }">
			</td>
		</tr>
		<tr>
			<th>핸드폰</th>
			<td>
				<input type="text" name="phone" value="${oneMember.phone }">
			</td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td>
				<input type="date" name="m_regdate" value="${oneMember.m_regdate }">
			</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>
				<input type="text" name="rank" value="${oneMember.rank }">
			</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>
				<input type="date" name="birth" value="${oneMember.birth }">
			</td>
		</tr>
		<tr>
			<th>사용여부</th>
			<td>
				<input type="text" name="m_useable" value="${oneMember.m_useable }">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="수정">&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="deleteMember.do?email=${oneMember.email }" style="color: red">삭제</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="memberList.do">목록</a>
			</td>	
				
		</tr>
		
	</table>
	</form>
	
	
	

</div>



