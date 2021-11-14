<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<div class="content-wrapper">
	<div style="text-align: center; width: 100%; margin-bottom: 50px;">
		<h2>관리자 패널</h2>
	</div>
	<div class="row">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card position-relative">
				<div class="card-body">
					<h4 class="card-title" style="margin-bottom: 30px;">관리자 목록</h4>
					<div class="table-responsive"> 
						<table class="table">
							<thead>
								<tr>
									<th>No</th>
									<th>관리자 닉네임</th>
									<th>이름</th>
									<th>생성 날짜</th>
									<th colspan="2" style="text-align: center;">권한여부</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${user.rank == '마스터 관리자' }">
									<tr>
										<td>1</td>
										<td>테스트1</td>
										<td>이름1</td>
										<td>2021/11/09</td>
										<td style="text-align: center;"><a href="#">수정</a></td>
										<td style="text-align: center;"><a href="#">삭제</a></td>
									</tr>
								</c:if>
								<c:if test="${user.rank == '관리자' }">
									<tr>
										<td>1</td>
										<td>테스트1</td>
										<td>이름1</td>
										<td>2021/11/09</td>
										<td colspan="2" style="text-align: center;">관리자</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${visitcnt.month }월 전체 지점 매출통계</h4>
					<div style="float: left; margin-top: 30px; width: 70%">
						<h2>￦${Monthsale }원</h2>
					</div>
					<div style="float: left; margin-top: 30px; text-align: right; width: 30%">
						<c:if test="${Monthsale > lastMonthsale}">
							<h5 style="color: blue; font: bold;">전월대비 매출액&nbsp&nbsp&nbsp&nbsp&nbsp▲</h5>
						</c:if>
						<c:if test="${Monthsale == lastMonthsale}">
							<h5 style="color: gray; font: bold;">전월대비 매출액&nbsp&nbsp&nbsp&nbsp&nbsp━</h5>
						</c:if>	
						<c:if test="${Monthsale < lastMonthsale}">
							<h5 style="color: red; font: bold;">전월대비 매출액&nbsp&nbsp&nbsp&nbsp&nbsp▼</h5>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${visitcnt.month }월 방문자 통계</h4>
					<div style="float: left; margin-top: 30px; width: 70%">
						<h2>총 ${visitcnt.visitcnt }명</h2>
					</div>
					<div style="float: left; margin-top: 30px; text-align: right; width: 30%">
						<c:if test="${visitcnt.visitcnt > lastMonth_visitcnt.visitcnt}">
							<h5 style="color: blue; font: bold;">전월대비 방문자 수&nbsp&nbsp&nbsp&nbsp&nbsp▲</h5>
						</c:if>
						<c:if test="${visitcnt.visitcnt == lastMonth_visitcnt.visitcnt}">
							<h5 style="color: gray; font: bold;">전월대비 방문자 수&nbsp&nbsp&nbsp&nbsp&nbsp━</h5>
						</c:if>	
						<c:if test="${visitcnt.visitcnt < lastMonth_visitcnt.visitcnt}">
							<h5 style="color: red; font: bold;">전월대비 방문자 수&nbsp&nbsp&nbsp&nbsp&nbsp▼</h5>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
	</div>
		
</div>