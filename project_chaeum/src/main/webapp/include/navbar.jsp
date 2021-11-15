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
				//location.href="index.jsp?contentPage=reservation/choiceBranch.jsp";
				location.href="getBranchList.do";
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
				location.href="getNoticeBoardList.do";
			}
			else if(value == "14")	// 자유게시판
			{	
				location.href="getFreeBoardList.do";
			}
			else if(value == "15")	// 질문게시판
			{	
				location.href="index.jsp?contentPage=community/questionBoard.jsp";
			}
			else if(value == "16")	// 1:1 문의
			{	
				location.href="mainView.jsp?contentPage=book/connectionBook.jsp";
			}
			else if(value == "17")	// 로그아웃
			{	
				location.href="logout.do";
			}
			
		}
			
		
	</script>	
	
	
	

<!-- 기능부분 -->	
<script>
	var code = "";
	var ok = "";
	var pwd = "";
	
	
	<!-- 이메일칸 직접입력폼 -->
	$(function(){
		$("#direct").hide();
		
		
		$("#email1").change(function() {
			
		});
	});
	
	<!-- 유효성 검사, 빈칸체크 -->
	function signup() {
		
		var checkMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); 
		var checkId= RegExp(/^[a-zA-Z0-9]{4,12}$/); 
		<!-- 생년월일 체크 
		var birthdayCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
		-->
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		var pass1 = $("#m_pass1").val();
		var pass2 = $("#m_pass2").val();
		var nickname = $("#nickname").val();
		var email = email1 + "@" + email2
		
		if(email1 == null || email1 == "") {
			$("#sEmail").css({color:"red"});
			$("#checkE").html('<h6 style="color:red;">필수 입력 항목입니다.</h6>');
			$("#email1").focus();
			return;
		} 
		
		if (email2 == null || email2 == "") {
			$("#email2").focus();
			return;
		} 
		
		if(pass1 == null || pass1 == "") {
			$("#sPass").css({color:"red"});
			$("#passCheck").html('<h6 style="color:red;">필수 입력 항목입니다.</h6>');
			$("#pass1").focus();
			return;
		} 
		
		if(pass2 == null || pass2 == "") {
			$("#sPass2").css({color:"red"});
			$("#passCheck").html('<h6 style="color:red;">필수 입력 항목입니다.</h6>');
			$("#pass2").focus();
			return;
		} 
		
		
		if(nickname == null || nickname == "") {
			$("#sName").css({color:"red"});
			$("#checkN").html('<h6 style="color:red;">필수 입력 항목입니다.</h6>');
			$("#nickname").focus();
			return;
		}		
	
		if(pwd =! "1") {
			alert("비밀번호가 다릅니다. 다시 입력해주세요");
			$("#pass1").val("");
			$("#pass2").val("");
			$("#pass1").focus();
			
			return;
		}
		
		if(ok =! "1") {
			alert("이메일 인증을 해주세요");
			
			return;
		}
		
		
		$("#signupForm").submit();
		alert("회원가입완료");
		
	}	
	
	<!-- p1 p2 체크, 유효성 검사 -->
	function passCheck() {
		var pass1 = $("#m_pass1").val();
		var pass2 = $("#m_pass2").val();
		var checkPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		
		if(!checkPass.test(pass2)) {
			$("#passCheck").html('<h6 style="color:red;">영문, 숫자, 특수문자를 포함하여 8자이상 가능합니다</h6>');
		} else {
			$("#passCheck").html('<h6 style="color:green;">사용가능합니다.</h6>');
		}
		
		
		if ( pass1 != pass2 ) {
			$("#passCheck").html('<h6 style="color:red;">비밀번호가 일치하지 않습니다</h6>');
			pwd = "0";
		} else {
			$("#passCheck").html('<h6 style="color:green;">사용가능합니다</h6>');
			pwd = "1";
		}
	}
	
	function passVal() {
		var checkPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		var pass1 = $("#m_pass1").val();
		
		if(!checkPass.test(pass1)) {
			$("#passCheck").html('<h6 style="color:red;">영문, 숫자, 특수문자를 포함하여 8자이상 가능합니다</h6>');
		} else {
			$("#passCheck").html('<h6 style="color:green;">사용가능합니다.</h6>');
		}
	}
	
	<!-- 이메일 인증 -->
	function emailCheck() {
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		
		if(email2 == "direct") {
			email2 = $("#direct").val();
		}
		
		var email = email1 + "@" + email2;
		
		
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
				alert("인증번호 : " + code);
				
			}
		});
	}
	
	<!-- 메일인증코드 확인-->
	function checkBtn() {
		var inputCode = $("#checkCode").val();
		var checkMsg = '<h6 style="color:red; >올바른 인증 코드가 아닙니다.</h6>';
		var checkMsg2 = '<h6 style="color:green;> 인증번호가 일치합니다. </h6>';
		if(inputCode != code) {
			$("#check").html(checkMsg);
			
		} else {
			ok = "1";
			$("#check").html(checkMsg2);
			$("#checkCode").prop("disabled",true);
			$("#check").prop("disabled",true);
			$("#emailOk").prop("disabled",true);
			
		}
	}
	
	<!-- 닉네임 중복확인 Ajax -->
	function checkName() {
		var inputName = $("#nickname").val(); 
		var checkName= RegExp(/^[가-힣]{2,8}$/);
		$.ajax({
			url: "checkName.do?nickname=" + inputName,
			type: "POST",
			success:function(rs){
				if(rs == "0") { // 0일경우는 사용 가능한 아이디
					if(!checkName.test(inputName)){
						$("#checkN").html('<h6 style="color:red;">(2~8자)한글만 사용가능합니다</h6>');
					} else {
						$("#checkN").html('<h6 style="color:green;">사용가능한 닉네임입니다</h6>');
					}
				} else { // 아이디가 존재할 경우
					$("#checkN").html('<h6 style="color:red;">이미 사용중인 닉네임입니다</h6>');
				}
				
			},
			error:function(){
				alert("실패!!")
			}
		
		});
	}
	
	<!-- 이메일 중복확인 Ajax 및 유효성 검사 -->
	function checkEmail() {
		var inputEmail1 = $("#email1").val();
		var inputEmail2 = $("#email2").val();
		var email = inputEmail1 + "@" + inputEmail2;
		var checkMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
		if($("#email2").val() == "direct") {
			$("#email2").hide();
			$("#direct").show();
		} else {
			$("#direct").hide();
		}
		
		$.ajax({
			url: "checkEmail.do?email=" + email,
			type: "POST",
			success:function(rs){
				if(rs == "0") { // 0일경우는 사용 가능한 아이디
					
					if(!checkMail.test(email)){
						$("#checkE").html('<br><h6 style="color:red;">이메일 형식이 올바르지 않습니다.</h6>');
					} else {
						$("#checkE").html('<br><h6 style="color:green;">사용가능한 이메일입니다</h6>');
					}
					
				} else { // 아이디가 존재할 경우
					$("#checkE").html('<br><h6 style="color:red;">이미 사용중인 이메일입니다</h6>');
				}
				
			},
			error:function(){
				alert("실패!!")
			}
		
		});
	}	
	
	<!-- 비밀번호 찾기(재설정) -->
	
	function passFind() {
		location.href="passFindPage.do";	
	}
	
</script>	
	
	

<style>

#email1 {
  width: 40%;
  float: left;
}
#email3 {
  text-align: center;
  margin: 0 auto;
}
#email2 {
  width: 50%;
  float: right;
}
</style>	
	
	
	
	
	
	

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
					<a class="dropdown-item" href="#" onclick="changeView(8)">미팅룸 예약</a>
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

		<c:if test="${sessionScope.user == null}"> 	         	
       		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login">로그인</button> 
       		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#signup">회원가입</button>
        </c:if>			
	
		
		<c:if test="${sessionScope.user.email != null}"> 
			
				
			<li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown" aria-expanded="false">
          ${sessionScope.user.nickname}님　　 〓
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href='mypage.do'>
                <i class="ti-settings text-primary"></i>
                마이페이지
              </a>
              <a class="dropdown-item" href='logout.do'>
                <i class="ti-power-off text-primary" ></i>
                로그아웃
              </a>
            </div>
          </li>
			
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
	          <button type="button" class="btn btn-danger" onclick="passFind()">비밀번호재설정</button>
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
	          <h5>sns계정으로 간편가입</h5>
	          <button onclick="kakaoLogin();">카카오</button>
	          <button>네이버</button>
	        </div>
	        
	        <!-- Modal body -->
			<div class="modal-body" >
				<div class="card align-middle"
					style="width: 100%; ">
					<div class="card-title" style="margin-top: 30px;">
						<h1 class="card-title text-center" style="color: #113366;">회원가입</h1>
					</div>
					<div class="card-body">
						<form action="signup.do"  method="post" id="signupForm">
							<h6 id="sEmail" class="form-signup-heading">* 이메일</h6>	
							<div  >
								<span >
								<input
									type="text" name="email1" class="form-control" id="email1"
									placeholder="이메일" required autofocus onchange="checkEmail();" >
								</span>	
								<span id="email3">
								 @
								</span>
								<span >
								<select class="form-control" id="email2" name="email2" onchange="checkEmail();" >
									  <option disabled selected>선택해주세요</option>
		                              <option value="gmail.com">gmail.com</option>
		                              <option value="naver.com">naver.com</option>
		                              <option value="hanmail.net">hanmail.net</option>
		                              <option value="outlook.con">outlook.com</option>
		                              <option value="direct">직접입력</option>
		                        </select>
		                       
								<input type="text"  id="direct" name="direct" placeholder="직접입력111" onchange="checkEmail();">
									
								</span>
							</div>
							<br>
							<div id="checkE"></div>
							<br>             
			
							<input type="button"  id="emailOk" class="btn btn-lg btn-primary btn-block" value="이메일 인증확인" onclick="emailCheck();" >
							<div id="emailCheck">
							</div>
							<br>
							<h6 id="sPass" class="form-signup-heading">* 비밀번호</h6>
							<input
								type="password" id="m_pass1" class="form-control" onkeyup="passVal();"
								placeholder="비밀번호" name="m_pass" required style="display: block;">
								<br>
							<h6 id="sPass2" class="form-signup-heading">* 비밀번호 확인</h6>
							<input
								type="password" id="m_pass2" class="form-control" onkeyup="passCheck();"
								placeholder="비밀번호확인" name="m_pass2" required style="display: block;">
								<br>
							<div id="passCheck" >
							</div>
							<br> 		
							<h6 id="sName" class="form-signup-heading">* 닉네임</h6>
							<input
								type="text"  class="form-control" id="nickname"  oninput="checkName();"
								placeholder="8글자이내" name="nickname" required style="display: block;">
								<br>
								<div id="checkN"></div>
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
	        
	      </div>
	    </div>
	</div>
<!-- partial -->