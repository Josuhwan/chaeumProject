<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
table {
	border-collapse: collapse;
}

li {
	list-style: none;
	float: left;
	padding: 6px;
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
$(function(){
    $('#searchBtn').click(function() {
    	alert($("select option:selected").val());
      location.href = "getFreeBoardList.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
    });
  });   	
</script>
</head>
<div class="content-wrapper" align="center">
	<div class="row" style="width: 75%">
		<div class="col-md-12 grid-margin stretch-card">
			<div class="card position-relative">

				<div class="card-body">
					<h1 class="h1">자유게시판</h1>

					<br> <br>

					<!-- 검색을 위한 폼 -->
					
					<div class="search">
					<form role="form" method="get">
						<select name="searchType">
							<option value="n"
								<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							<option value="t"
								<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
							<option value="c"
								<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							<option value="w"
								<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							<option value="tc"
								<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						</select> 
						<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />

						<button id="searchBtn" type="button">검색</button>
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
										<c:if test="${board.boardtype == '자유게시판' }">
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
						<c:if test="${sessionScope.user != null}">
							<p>
								<a href="index.jsp?contentPage=community/insertBoard.jsp">새글등록</a>
							</p>
						</c:if>
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="getFreeBoardList.do${pageMaker.makeSearch(pageMaker.pageStart - 1)}">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.pageStart}"
								end="${pageMaker.pageEnd}" var="idx">
								<li><a
									href="getFreeBoardList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.pageEnd > 0}">
								<li><a
									href="getFreeBoardList.do${pageMaker.makeSearch(pageMaker.pageEnd + 1)}">다음</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>