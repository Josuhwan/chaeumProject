<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<style>
.card-body {
	padding: 2.25rem 10.25rem;
}
</style>
</head>
<body>
	<div class="content-wrapper" align="center">
		<div class="row" style="width: 75%">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card position-relative">

					<div class="card">
						<div class="card-body" style="padding: 2.25rem 10.25rem;">
							<div id="container">
								<h1>글등록</h1>

								<br> <br>
							</div>

							<form class="forms-sample" action="insertBoard.do" method="post">
								<input type="hidden" name="email"value="${sessionScope.user.email}"> 
								<input type="hidden" name="boardtype" value="자유게시판">
								<div class="form-group row" align="left">
									<label for="exampleInputMobile"
										class="col-sm-10 col-form-label"></label> <label
										for="exampleInputMobile" class="col-sm-2 col-form-label">
										by ${sessionScope.user.nickname}</label>

								</div>

								<div class="form-group row">
									<label for="exampleInputEmail2" class="col-sm-3 col-form-label">제목</label>
									<div class="col-sm-9">
										<input class="form-control" type="text" name="title">
									</div>
								</div>

								<div class="form-group row">
									<label for="exampleInputPassword2"
										class="col-sm-3 col-form-label">내용</label>
									<div class="col-sm-9">
										<textarea class="form-control" id="exampleTextarea1"
											name="b_contents" rows="10" cols="40"></textarea>
									</div>
								</div>

								<br>

								<button type="submit" class="btn btn-primary mr-2">등록</button>
								<button class="btn btn-light"
									onclick="href='getFreeBoardList.do'">취소</button>
							</form>
							<br> <br>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>





