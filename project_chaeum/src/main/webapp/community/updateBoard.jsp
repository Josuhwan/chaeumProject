<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세</title>
<style>
	#container { width: 700px; margin: 0 auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>

<div id="container">
	<h1>글상세(getBoard.jsp)</h1>
	<p><a href="logout.do">로그아웃</a></p>
	
	<form action="updateBoard.do" method="post">
		<input type="hidden" name="seq" value="${board.board_id }">
	<table>
		<tr>
			<th width="70">제목</th>
			<td>
				<input type="text" name="title" value="${board.title }">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.email }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="b_contents" rows="10" cols="40">${board.b_contents }</textarea>
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.b_regdate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.count }</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="글 수정">
			</td>
		</tr>
	</table>
	</form>
	
	<p>
		<a href="insertBoard.jsp">글등록</a>
		<a href="deleteBoard.do?board_id=${board.board_id }">글삭제</a>
		<a href="getBoardList.do">글목록</a>
	</p>
	
</div>

</body>
</html>