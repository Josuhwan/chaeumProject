<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>


table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
	margin: 0 auto;
}

th {
	background-color: MediumPurple;
}

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}

</style>
<title>글목록</title>
<script>
	
</script>
</head>
<div class="content-wrapper" align="center">
	<div class="row" style="width: 75%">
	<div class="col-md-12 grid-margin stretch-card">
			<div class="card position-relative">
				
	<div class="card-body">
		<h1 class="h1">공지게시판</h1>
		
		<br>
		<br>
		
		<!-- 검색을 위한 폼 -->
		<div align="right">
			<form action="getNoticeBoardList.do" method="get">
				<table class="border-none">
					<tr>
						<td>
							<select name="searchCondition">
								<option value="TITLE">제목</option>
								<option value="CONTENT">내용</option>
						    </select> 
						    <input type="text" name="searchKeyword"> 
						    <input type="submit" value="검색">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<br>
		
		<div class="table-responsive pt-3">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty boardList }">
				<c:forEach var="board" items="${boardList }">
					<c:if test="${board.boardtype == '공지게시판' }">
						<tr>
							<td class="center">${board.board_id }</td>
							<td><a href="getBoard.do?board_id=${board.board_id }">${board.title }</a>
							</td>
							<td>${board.nickname }</td>
							<td>${board.b_regdate }</td>
							<td>${board.count }</td>
						</tr>
					</c:if>
				</c:forEach>
			
			</c:if>
			<c:if test="${empty boardList }">
				<tr>
					<td colspan="5" class="center">데이터가 없습니다</td>
				</tr>
			</c:if>
				</tbody>
			</table>
			<c:if test="${sessionScope.user.rank == '관리자'}">
			<p>
				<a href="index.jsp?contentPage=community/insertBoardNotice.jsp">새글등록</a>
			</p>
		</c:if>
		</div>
	</div>
	</div>
	</div>
	</div>
	
</div>