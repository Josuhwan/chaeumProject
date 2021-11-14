<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

	<div class="content-wrapper" align="center">
		<div class="row" style="width: 75%">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card position-relative">
					<br> <br>
					<h2>회원정보</h2>
					<br> <br>
					<h2>${sessionScope.user.nickname}님정보입니다</h2>
					<br> <br>
					<h2>회원정보관리-(수정탈퇴)</h2>
					<h2>예약내역?</h2>
					<h2>결제내역?</h2>
					<h2>내가 쓴 글</h2>
					<h2>내가 쓴 댓글</h2>


					<div class="content-wrapper">
						<div class="row">

							<div class="col-md-6 grid-margin stretch-card">
								<div class="card"></div>
							</div>
							<div class="col-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">회원정보</h4>
										<p class="card-description">회원정보</p>
										<form class="forms-sample">
											<div class="form-group">
												<label for="exampleInputName1">Name</label> <input
													type="text" class="form-control" id="exampleInputName1"
													placeholder="Name">
											</div>
											<div class="form-group">
												<label for="exampleInputEmail3">Email address</label> <input
													type="email" class="form-control" id="exampleInputEmail3"
													placeholder="Email">
											</div>
											<div class="form-group">
												<label for="exampleInputPassword4">Password</label> <input
													type="password" class="form-control"
													id="exampleInputPassword4" placeholder="Password">
											</div>
											<div class="form-group">
												<label for="exampleSelectGender">Gender</label> <select
													class="form-control" id="exampleSelectGender">
													<option>Male</option>
													<option>Female</option>
												</select>
											</div>
											<div class="form-group">
												<label>File upload</label> <input type="file" name="img[]"
													class="file-upload-default">
												<div class="input-group col-xs-12">
													<input type="text" class="form-control file-upload-info"
														disabled="" placeholder="Upload Image"> <span
														class="input-group-append">
														<button class="file-upload-browse btn btn-primary"
															type="button">Upload</button>
													</span>
												</div>
											</div>
											<div class="form-group">
												<label for="exampleInputCity1">City</label> <input
													type="text" class="form-control" id="exampleInputCity1"
													placeholder="Location">
											</div>
											<div class="form-group">
												<label for="exampleTextarea1">Textarea</label>
												<textarea class="form-control" id="exampleTextarea1"
													rows="4"></textarea>
											</div>
											<button type="submit" class="btn btn-primary mr-2">Submit</button>
											<button class="btn btn-light">Cancel</button>
										</form>
									</div>
								</div>
							</div>
							<div class="col-md-6 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">예약내역</h4>

										<div class="form-group">
											<label>Large input</label> <input type="text"
												class="form-control form-control-lg" placeholder="Username"
												aria-label="Username">
										</div>
										<div class="form-group">
											<label>Default input</label> <input type="text"
												class="form-control" placeholder="Username"
												aria-label="Username">
										</div>
										<div class="form-group">
											<label>Small input</label> <input type="text"
												class="form-control form-control-sm" placeholder="Username"
												aria-label="Username">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">결제내역</h4>

										<div class="form-group">
											<label for="exampleFormControlSelect1">Large select</label> <select
												class="form-control form-control-lg"
												id="exampleFormControlSelect1">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
											</select>
										</div>
										<div class="form-group">
											<label for="exampleFormControlSelect2">Default select</label>
											<select class="form-control" id="exampleFormControlSelect2">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
											</select>
										</div>
										<div class="form-group">
											<label for="exampleFormControlSelect3">Small select</label> <select
												class="form-control form-control-sm"
												id="exampleFormControlSelect3">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">내가 쓴 글</h4>

										<!-- =========================== 내가 쓴 글 데이터 가져오기 ====================================== -->

										<table class="table table-bordered">
											<thead>
												<tr>
													<th style="width: 5%">글번호</th>
													<th style="width: 35%">제목</th>
													<th style="width: 40%">작성일</th>
													<th style="width: 20%">${sessionScope.user.nickname}</th>

												</tr>
											</thead>

											<tbody>
												<c:if test="${not empty boardList }">
													<c:forEach var="board" items="${boardList }">
														<c:if test="${board.email == sessionScope.user.email}">
															<tr>
																<td class="center">${board.board_id }</td>
																<td>${board.title }</td>
																<td>${board.b_regdate }</td>
																<td><a
																	href="getBoard.do?board_id=${board.board_id }">보러가기</a></td>
															</tr>
														</c:if>
													</c:forEach>
												</c:if>
											</tbody>
										</table>

									</div>
								</div>
							</div>
							<div class="col-md-6 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">내가 쓴 댓글</h4>

										<!-- =========================== 내가 쓴 댓글 데이터 가져오기 ====================================== -->

										<table class="table table-bordered">
											<thead>
												<tr>
													<th style="width: 5%">글번호</th>
													<th style="width: 35%">댓글내용</th>
													<th style="width: 40%">작성일</th>
													<th style="width: 20%"></th>

												</tr>
											</thead>

											<tbody>
												<c:if test="${not empty rlist }">
													<c:forEach var="reply" items="${rlist }">
														<c:if test="${reply.r_writer == sessionScope.user.email}">
															<tr>
																<td class="center">${reply.r_id }</td>
																<td>${reply.r_content }</td>
																
																<td>${reply.r_regdate }</td>
																<td><a
																	href="getBoard.do?board_id=${reply.board_id }">보러가기</a></td>
															</tr>
														</c:if>
													</c:forEach>
												</c:if>

											</tbody>
										</table>
									</div>
									<div class="card-body"></div>
								</div>
							</div>
							<div class="col-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">Inline forms</h4>
										<p class="card-description">
											Use the
											<code>.form-inline</code>
											class to display a series of labels, form controls, and
											buttons on a single horizontal row
										</p>
										<form class="form-inline">
											<label class="sr-only" for="inlineFormInputName2">Name</label>
											<input type="text" class="form-control mb-2 mr-sm-2"
												id="inlineFormInputName2" placeholder="Jane Doe"> <label
												class="sr-only" for="inlineFormInputGroupUsername2">Username</label>
											<div class="input-group mb-2 mr-sm-2">
												<div class="input-group-prepend">
													<div class="input-group-text">@</div>
												</div>
												<input type="text" class="form-control"
													id="inlineFormInputGroupUsername2" placeholder="Username">
											</div>
											<div class="form-check mx-sm-2">
												<label class="form-check-label"> <input
													type="checkbox" class="form-check-input" checked="">
													Remember me <i class="input-helper"></i></label>
											</div>
											<button type="submit" class="btn btn-primary mb-2">Submit</button>
										</form>
									</div>
								</div>
							</div>
							<div class="col-12 grid-margin">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">Horizontal Two column</h4>
										<form class="form-sample">
											<p class="card-description">Personal info</p>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">First Name</label>
														<div class="col-sm-9">
															<input type="text" class="form-control">
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Last Name</label>
														<div class="col-sm-9">
															<input type="text" class="form-control">
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Gender</label>
														<div class="col-sm-9">
															<select class="form-control">
																<option>Male</option>
																<option>Female</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Date of
															Birth</label>
														<div class="col-sm-9">
															<input class="form-control" placeholder="dd/mm/yyyy">
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Category</label>
														<div class="col-sm-9">
															<select class="form-control">
																<option>Category1</option>
																<option>Category2</option>
																<option>Category3</option>
																<option>Category4</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Membership</label>
														<div class="col-sm-4">
															<div class="form-check">
																<label class="form-check-label"> <input
																	type="radio" class="form-check-input"
																	name="membershipRadios" id="membershipRadios1" value=""
																	checked=""> Free <i class="input-helper"></i></label>
															</div>
														</div>
														<div class="col-sm-5">
															<div class="form-check">
																<label class="form-check-label"> <input
																	type="radio" class="form-check-input"
																	name="membershipRadios" id="membershipRadios2"
																	value="option2"> Professional <i
																	class="input-helper"></i></label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<p class="card-description">Address</p>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Address 1</label>
														<div class="col-sm-9">
															<input type="text" class="form-control">
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">State</label>
														<div class="col-sm-9">
															<input type="text" class="form-control">
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Address 2</label>
														<div class="col-sm-9">
															<input type="text" class="form-control">
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Postcode</label>
														<div class="col-sm-9">
															<input type="text" class="form-control">
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">City</label>
														<div class="col-sm-9">
															<input type="text" class="form-control">
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Country</label>
														<div class="col-sm-9">
															<select class="form-control">
																<option>America</option>
																<option>Italy</option>
																<option>Russia</option>
																<option>Britain</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>





						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	</div>
	<div class="card-body"></div>
	</div>
	</div>
	</div>


</body>
</html>