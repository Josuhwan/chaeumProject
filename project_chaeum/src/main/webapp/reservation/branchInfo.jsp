<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="content-wrapper" align="center">





	<div class="row" style="width: 75%">
		<div class="col-md-12 grid-margin stretch-card">
			<div class="card position-relative">
				<div class="card-body">
				
				
					<h1 align="center">${branch.branch_name }</h1>
					<br><br><br>
					<div class="col_6">
						<div id=branch_img>
							<img
								src="resources/images/branch/${branch.branch_id }_branch.jpg"
								width=550 height=336 align="left">
						</div>
					</div>
					<div id=branch_contents align="left" style="margin-left: 40%">
						
						<br>
						<h4>전화번호 : ${branch.branch_tel }</h4>
						<br>
						<h4>주소 : ${branch.branch_addr }</h4>
						<br><br><br><br><br>
						<button type="button" class="btn btn-outline-primary btn-fw" onclick="location.href='getStudyroomList.do'">예약하기</button>
						<br><br><br><br><br><br><br>		
					</div>
					

				<hr class="one">
				<br>
                 <p class="font-weight-500" align="left">${branch.branch_info }</p>









				</div>
			</div>
		</div>

<!--  
		<div class="row">
			<div class="col_6">
				<div class="branch_img1">
					<img
						src="https://www.spoany.co.kr/ActiveFile/spoany.smms/branch_img/spoany75_20200203165014.jpg">
				</div>
			</div>
			<div class="col_6">

				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="branch_summery">
					<tbody>
						<tr>
							<th width="15%">브랜드</th>
							<td>피트니스</td>
						</tr>
						<tr>
							<th width="15%">연락처</th>
							<td>02-855-9618</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>서울 금천구 벚꽃로 286 (가산동, 삼성리더스타워) 지하 1층</td>
						</tr>
						<tr>
							<th>개관일</th>
							<td>2020-02-03</td>
						</tr>
						<tr>
							<th>규모</th>
							<td>300평</td>
						</tr>
					</tbody>
				</table>
				<div class="branch_btns">
					<a class="btn_buy" href="/member/membership.html">회원권 구매</a>
					<a href="https://blog.naver.com/spoany75/222031877208"
						target="_blank" class="btn_blog">지점블로그</a>
				</div>
			</div>
			<div class="clr"></div>
		</div>
-->



	</div>







</div>






