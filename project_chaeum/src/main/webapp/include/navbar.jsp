<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script type="text/javascript">
		function changeView(value){
			if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동
			{
				location.href="mainView.jsp?contentPage=book/connectionBook.jsp";
			}
			else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
			{	
				location.href="index.jsp?contentPage=login/login.jsp";
			}
			else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
			{	
				location.href="index.jsp?contentPage=login/signup.jsp";
			}
			else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 처리
			{
				//location.href="index?type=logout";
			}else if(value == "4") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
			{
				location.href="memberController?type=memberInfo";
			}
			else if(value == "5")	// 소개
			{
				location.href="index.jsp?contentPage=intro/introduce.jsp";
			}
			else if(value == "6")	// 시설안내
			{
				location.href="index.jsp?contentPage=intro/facilityInfo.jsp";
			}
			else if(value == "7")	// 위치안내
			{	
				location.href="index.jsp?contentPage=intro/locationInfo.jsp";
			}
			else if(value == "8")	// 미팅룸 예약
			{	
				location.href="";
			}
			else if(value == "9")	// 스터디룸 예약
			{	
				location.href="";
			}
			else if(value == "10")	// 이용안내
			{	
				location.href="index.jsp?contentPage=infoUse/infoUse.jsp";
			}
			else if(value == "11")	// 스터디홀
			{	
				location.href="index.jsp?contentPage=infoUse/infoStudyhall.jsp";
			}
			else if(value == "12")	// 스터디룸
			{	
				location.href="index.jsp?contentPage=infoUse/infoStudyroom.jsp";
			}
			else if(value == "13")	// 공지사항
			{	
				location.href="index.jsp?contentPage=community/noticeBoard.jsp";
			}
			else if(value == "14")	// 자유게시판
			{	
				location.href="index.jsp?contentPage=community/freeBoard.jsp";
			}
			else if(value == "15")	// 질문게시판
			{	
				location.href="index.jsp?contentPage=community/questionBoard.jsp";
			}
			else if(value == "16")	// 1:1 문의
			{	
				location.href="mainView.jsp?contentPage=book/connectionBook.jsp";
			}
			
		}			
		
	</script>	

<!-- 기능부분 -->	
<script>
	var code = "";
	
	function signup() {
		alert("눌리나요");
		
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		var pass1 = $("#m_pass1").val();
		var pass2 = $("#m_pass2").val();
		var nickname = $("#nickname").val();
		
		if(email1 == null || email1 == "") {
			alert("이메일을 입력해주세요");
			$("#email1").focus();
			return;
		} else if (email2 == null || email2 == "") {
			alert("이메일을 입력해주세요");
			$("#email2").focus();
			return;
		} else if(pass1 == null || pass1 == "") {
			alert("비밀번호를 입력해주세요");
			$("#pass1").focus();
			return;
		} else if(pass2 == null || pass2 == "") {
			alert("비밀번호를 입력해주세요");
			$("#pass2").focus();
			return;
		} else if(nickname == null || nickname == "") {
			alert("닉네임을 입력해주세요");
			$("#nickname").focus();
			return;
		}		
		
		$("#signup").submit();
		
	}	
	
	function passCheck() {
		var pass1 = $("#m_pass1").val();
		var pass2 = $("#m_pass2").val();
		
		if ( pass1 != pass2 ) {
			$("#passCheck").html("비밀번호가 일치하지 않습니다");
		} else {
			$("#passCheck").html("일치합니다");
		}
	}
	
	function emailCheck() {
		var email = $("#email1").val()+"@"+$("#email2").val();
		alert("여기오나요" + email);
		
		$.ajax({
			type: "GET",
			url: "emailCheck.do?email=" + email,
			success:function(data) {
				alert("확인");
				var html_text = '<br><input type="text" placeholder="인증코드 6자리 입력" id="checkCode" >&nbsp&nbsp';
				var html_btn = '<button onclick="checkBtn();">인증확인</button><div id="check"></div>';
				var html_div = html_text + html_btn; 
				$("#emailCheck").html(html_div);
				
				code = data;
				alert(code);
				
			}
		});
	}
	
	function checkBtn() {
		var inputCode = $("#checkCode").val();
		var checkMsg = '<h6>올바른 인증 코드가 아닙니다.</h6>';
		var checkMsg2 = '<h6> 인증번호가 일치합니다. </h6>';
		if(inputCode != code) {
			$("#check").html(checkMsg);
		
		} else {
			$("#check").html(checkMsg2);
			$("#checkCode").prop("disabled",true);
			$("#check").prop("disabled",true);
			$("#emailOk").prop("disabled",true);
		}
	}
	
	$(function(){
		$("#selectDirect").hide();
		$("#email2").change(function() {
			alert("dd");
			if($("#email2").val() == "direct") {
				$("#email2").hide();
				$("#selectDirect").show();
			} else {
				$("#selectDirect").hide();
			}
		});
	});
</script>



<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
	<div
		class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
		<a class="navbar-brand brand-logo mr-5" href="index.jsp"><img
			src="resources/images/logo_chaeum.PNG" class="mr-2" alt="logo" /></a> <a
			class="navbar-brand brand-logo-mini" href="index.jsp"><img
			src="resources/images/logo-mini.svg" alt="logo" /></a>
	</div>
	<div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
		
			<div class="dropdown">
 				<button class="btn dropdown-toggle" type="button" id="dropdownMenuSizeButton2" 
                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">소개	</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton5">
					<a class="dropdown-item" href="#" onclick="changeView(5)">소개</a>
                    <a class="dropdown-item" href="#" onclick="changeView(6)">시설안내</a>
                    <a class="dropdown-item" href="#" onclick="changeView(7)">위치안내</a>
                </div>
            </div>
			<div class="dropdown">
 				<button class="btn dropdown-toggle" type="button" id="dropdownMenuSizeButton2" 
                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">실시간 예약	</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton5">
					<a class="dropdown-item" href="#">미팅룸 예약</a>
                </div>
            </div>            
			<div class="dropdown">
 				<button class="btn dropdown-toggle" type="button" id="dropdownMenuSizeButton2" 
                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">이용안내	</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton5">
					<a class="dropdown-item" href="#" onclick="changeView(10)">이용안내</a>
                    <a class="dropdown-item" href="#" onclick="changeView(11)">스터디홀</a>
                    <a class="dropdown-item" href="#" onclick="changeView(12)">스터디룸</a>
                </div>
            </div>        
			<div class="dropdown">
 				<button class="btn dropdown-toggle" type="button" id="dropdownMenuSizeButton2" 
                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티	</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton5">
					<a class="dropdown-item" href="#" onclick="changeView(13)">공지사항</a>
                    <a class="dropdown-item" href="#" onclick="changeView(14)">자유게시판</a>
                    <a class="dropdown-item" href="#" onclick="changeView(15)">질문게시판</a>
                    <a class="dropdown-item" href="#">1:1 문의</a>
                </div>
            </div> 
		

		<ul class="navbar-nav navbar-nav-right">

			<c:if test="${loginMember.id == null}">         	
        		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login">로그인</button> 
        		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#signup">회원가입</button>
        	</c:if>		
		
			
	
	
		
		<c:if test="${loginMember.id != null}"> 
			<li class="nav-item dropdown"><a
				class="nav-link count-indicator dropdown-toggle"
				id="notificationDropdown" href="#" data-toggle="dropdown"> <i
					class="icon-bell mx-0"></i> <span class="count"></span>
			</a>
				<div
					class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
					aria-labelledby="notificationDropdown">
					<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
					<a class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-success">
								<i class="ti-info-alt mx-0"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<h6 class="preview-subject font-weight-normal">Application
								Error</h6>
							<p class="font-weight-light small-text mb-0 text-muted">Just
								now</p>
						</div>
					</a> <a class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-warning">
								<i class="ti-settings mx-0"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<h6 class="preview-subject font-weight-normal">Settings</h6>
							<p class="font-weight-light small-text mb-0 text-muted">
								Private message</p>
						</div>
					</a> <a class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-info">
								<i class="ti-user mx-0"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<h6 class="preview-subject font-weight-normal">New user
								registration</h6>
							<p class="font-weight-light small-text mb-0 text-muted">2
								days ago</p>
						</div>
					</a>
				</div></li>
			<li class="nav-item nav-profile dropdown"><a
				class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
				id="profileDropdown"> <img
					src="resources/images/faces/face28.jpg" alt="profile" />
			</a>
				<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
					aria-labelledby="profileDropdown">
					<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
						Settings
					</a> <a class="dropdown-item"> <i class="ti-power-off text-primary"></i>
						Logout
					</a>
				</div></li>
			<li class="nav-item nav-settings d-none d-lg-flex"><a
				class="nav-link" href="#"> <i class="icon-ellipsis"></i>
			</a></li>
			
			</c:if>
		</ul>
		<button
			class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
			type="button" data-toggle="offcanvas">
			<span class="icon-menu"></span>
		</button>
			
	</div>
</nav>

	<!-- 로그인 폼 The Modal -->
	  <div class="modal" id="login">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header" style="border-bottom: 0px;">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
			<div class="modal-body">
				<div class="card align-middle"
					style="width: 100%;">
					<div class="card-title" style="margin-top: 30px;">
						<h2 class="card-title text-center" style="color: #113366;">CHAEUM</h2>
					</div>
					<div class="card-body">
						<form action="login.do" class="form-signin" method="post" >
							<label for="inputEmail" class="sr-only" >이메일</label> 
							<input
								type="text" id="email" class="form-control"
								placeholder="이메일" name="email" required autofocus
								style="display: block;"><BR> 
							<label
								for="inputPassword" class="sr-only" >비밀번호</label> 
							<input
								type="password" id="m_pass" class="form-control"
								placeholder="비밀번호" name="m_pass" required style="display: block;">
								<br>
							<div class="checkbox">
								<label> <input type="checkbox" value="remember-me">
									기억하기
								</label>
							</div>
							<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
								type="submit">로 그 인</button>
						</form>
		
					</div>
				</div>
			</div>
			
						<!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">ID/PW찾기</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">회원가입</button>
	          <br>
	            <button type="button" class="btn btn-danger" data-dismiss="modal">카카오</button>
	            <button type="button" class="btn btn-danger" data-dismiss="modal">네이버</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>
		  
 <!--  회원가입 -->

	  <div class="modal" id="signup">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
			<div class="modal-body">
				<div class="card align-middle"
					style="width: 100%; ">
					<div class="card-title" style="margin-top: 30px;">
						<h2 class="card-title text-center" style="color: #113366;">회원가입</h2>
					</div>
					<div class="card-body">
						<form action="signup.do"  method="post" id="signup">
							<h6 class="form-signup-heading">이메일</h6>
							
							<div class="row">
								<div class="col-sm-5">
								<input
									type="text" name="email" class="form-control" id="email1"
									placeholder="이메일" required autofocus">
								</div>	
								<div>
								@
								</div>
								<div class="col-sm-6">
								<select class="form-control" id="email2" name="email2" >
									  <option disabled selected>선택해주세요</option>
		                              <option value="gmail">gmail.com</option>
		                              <option value="naver">naver.com</option>
		                              <option value="hanmail">hanmail.net</option>
		                              <option value="outlook">outlook.com</option>
		                              <option value="direct">직접입력</option>
		                        </select>
		                       
								<input type="text"  id="selectDirect" name="selboxDirect" placeholder="직접입력111">
									
								</div>
							</div>
							<br>             
			
							<input type="button"  id="emailOk" class="btn btn-lg btn-primary btn-block" value="이메일 인증확인" onclick="emailCheck();" >
							<div id="emailCheck">
							</div>
							<br>
							<h6 class="form-signup-heading">비밀번호</h6>
							<input
								type="password" id="m_pass1" class="form-control"
								placeholder="비밀번호" name="m_pass" required style="display: block;">
								<br>
							<h6 class="form-signup-heading">비밀번호 확인</h6>
							<input
								type="password" id="m_pass2" class="form-control" onkeyup="passCheck();"
								placeholder="비밀번호확인" name="m_pass2" required style="display: block;">
								<br>
							<div id="passCheck" >
							</div>
							<br> 		
							<h6 class="form-signup-heading">닉네임</h6>
							<input
								type="text"  class="form-control" id="nickname"
								placeholder="8글자이내" name="nickname" required style="display: block;">
								<br>
							<h6 class="form-signup-heading">휴대폰번호</h6>
							<input
								type="text"  class="form-control"
								placeholder="'-'생략" name="phone" required style="display: block;">
								<br>
							<h6 class="form-signup-heading">생년월일</h6>
							<input
								type="text"  class="form-control"
								placeholder="생년월일 6글자" name="birth" required style="display: block;">
								<br>			
							<div class="checkbox">
								
							<br>
							</div>
							 <button type="button" class="btn btn-danger" onclick="signup()" >가입</button>
						</form>
	
					</div>
				</div>
			</div>
	
						<!-- Modal footer -->
	        <div class="modal-footer">
	       
	          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        </div>
	        
	      </div>
	    </div>
	</div>
<!-- partial -->