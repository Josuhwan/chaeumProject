<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<style>
  table {border: 2px double pink; width:800px}
  td,th{border:1px pink solid ; text-align: center; padding:5px}
  input[type=submit] {   
  					color: black; padding: 5px 11px; 
  					margin: 8px 0; border: none; 
  					border-radius: 4px; 
  					cursor: pointer; }
</style>
<div class="content-wrapper">
	<h1>사용자목록보기</h1>
	<hr>
	<h3>회원정보</h3>
	
	<!-- 아이디 이름 검색 -->
	<form action="memberList.do">
	<select name="ch1">
		<option value="email">이메일</option>
		<option value="nickname">닉네임</option>
	</select>
	<input type="text" name="ch2" >
	<input type="submit" value="검색하기">
	
	</form>
	
	<!-- 회원목록출력 -->
	<table>
		<tr>
			<th width="200">이메일</th>
			<th width="400">비밀번호</th>
			<th width="200">닉네임</th>
			<th width="200">핸드폰</th>
			<th width="800">가입날짜</th>
			<th width="500">등급</th>
			<th width="200">생일</th>
			<th width="250">사용여부</th>
		</tr>
	<c:if test="${not empty memberList }">
		<c:forEach items="${memberList }" var="memberList">
		<c:if test="${user.rank == '마스터' }">
			<tr>
				<td >
				<a href="memberOne.do?email=${memberList.email }" >${memberList.email }</a>
				</td>
				<td>${memberList.m_pass }</td>
				<td>${memberList.nickname }</td>
				<td>${memberList.phone }</td>
				<td>${memberList.m_regdate }</td>
				<td>${memberList.rank }</td>
				<td>${memberList.birth }</td>
				<td>${memberList.m_useable }</td>
			</tr>
		</c:if>
			<c:if test="${user.rank == '관리자' }">
			<c:if test="${memberList.rank == '일반회원'}">
			<tr>
				<td >
				<a href="memberOne.do?email=${memberList.email }" >${memberList.email }</a>
				</td>
				<td>${memberList.m_pass }</td>
				<td>${memberList.nickname }</td>
				<td>${memberList.phone }</td>
				<td>${memberList.m_regdate }</td>
				<td>${memberList.rank }</td>
				<td>${memberList.birth }</td>
				<td>${memberList.m_useable }</td>
			</tr>
			</c:if>
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${empty memberList }">
		<tr>
			<td colspan="5" class="center">데이터가 없습니다</td>
		</tr>
	</c:if>
	</table>


</div>