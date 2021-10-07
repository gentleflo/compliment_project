<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- 부트스트랩 아이콘 cdn -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<!-- css 파일 cdn -->
	<link rel="stylesheet" href="/static/css/style_user.css" type="text/css">
	
	<title>compliment_sticker 회원가입 페이지</title>
</head>
<body>
	<div id="wrap">
		<header></header>
		
		<section class="d-flex justify-content-center">
			<div class="signup-box">
				<div class="welcomeHead text-center mb-1">환영합니다!</div>
				<div class="welcomeBody text-center text-secondary mb-4">이곳에 들어온 당신에게 칭찬을 드립니다</div>
				
				<div class="d-flex justify-content-center">
					<div class="input-box">
						<input type="text" class="form-control mb-2 border-top-0 border-right-0 border-left-0 rounded-0" 
							placeholder="E-mail" id="emailInput">
						<!-- 아이디 중복확인 -->
						<div class="input-group">
							<input type="text" class="form-control mb-2 border-top-0 border-right-0 border-left-0 rounded-0" 
								placeholder="LoginId" id="loginIdInput">
							<div class="input-group-append">
   								 <button class="btn btn-sm mb-2 border-bottom text-info bg-white" 
   								 	type="button"><small>중복확인</small></button>
							</div>
						</div>
						<input type="text" class="form-control mb-2 border-top-0 border-right-0 border-left-0 rounded-0" 
							placeholder="UserName" id="userNameInput">
						<input type="password" class="form-control mb-2 border-top-0 border-right-0 border-left-0 rounded-0" 
							placeholder="password" id="passwordInput">
						<input type="password" class="form-control mb-2 border-top-0 border-right-0 border-left-0 rounded-0" 
							placeholder="password confirm" id="passwordCfmInput">
					</div>
				</div>
				
				<div class="d-flex justify-content-center mt-3">
					<input type="submit" id="signUpBtn" value="회원가입" class="btn signUp-Btn col-3 text-white"> 
				</div>
				
				<div class="d-flex justify-content-center mt-5">
					<a href="#"><img src="/static/image/kakao_login_medium_narrow.png" alt="카카오톡 로그인 버튼" class="mr-3" width="150px"></a>
					<a href="#"><img src="/static/image/naver_login.png" alt="네이버 로그인 버튼" width="170px"></a>
				</div>
				
				<div class="d-flex justify-content-center">
					<button type="button" class="btn starloginbtn btn-outline-secondary btn-sm mt-3">스타계정으로 로그인하기</button>
				</div>
			</div>
		</section>	
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#signUpBtn").on("click",function(){
				e.preventDefault();
				
				var email = $("#emailInput").val();
				var loginId = $("#loginIdInput").val();
				var userName = $("#userNameInput").val();
				var password = $("#passwordInput").val();
				var passwordCfm = $("#passwordCfmInput").val();
				
				if(email == null || email == ""){
					alert("이메일 주소를 입력해주세요.");
					return;
				}
				
				if(loginId == null || loginId == ""){
					alert("이메일 주소를 입력해주세요.");
					return;
				}
				
				// 아이디 중복체크 했는지?
					
						
				// 아이디가 중복이 되었는지 안되었는지?
						
				
				if(userName == null || userName == ""){
					alert("이메일 주소를 입력해주세요.");
					return;
				}
				
				if(password == null || password == ""){
					alert("이메일 주소를 입력해주세요.");
					return;
				}
				
				if(passwordCfm == null || passwordCfm == ""){
					alert("이메일 주소를 입력해주세요.");
					return;
				}
				 
			});	
		});
	</script>
</body>
</html>