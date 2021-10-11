<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<link rel="stylesheet" href="/static/css/style_compliment_edit.css" type="text/css">
	
	<title>칭찬 스티커 플랜 입력 화면</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="mt-5">
			<div></div>
			
			<form>
				<div>
				</div>
			</form>
			
			
			<!-- 프로필 -->
			<div class="d-flex">
				<i class="bi bi-person-circle profile-icon"></i>
				<i class="bi bi-person-square profile-icon"></i>
				<i class="bi bi-person-badge profile-icon"></i>
				
				<div>
					<!-- userName -->
					<c:if test="${not empty loginId }">
						<h5>${loginId }</h5>
					</c:if>
					<!-- 팔로우, 팔로잉 정보 -->
					<div>칭찬친구 11명</div>
				</div>
			</div>
			
			
			
			<!-- 기간 설정 -->
			<i class="bi bi-calendar-date"></i>
			<i class="bi bi-calendar2-date"></i>
			
			
			<!-- 무엇을 했을때 나에게 칭찬하실 건가요? -->
			<i class="bi bi-pencil-square"></i>
			<i class="bi bi-clipboard-check"></i>
			<i class="bi bi-card-checklist"></i>
			<i class="bi bi-list-stars"></i>
			
			
			<!-- 스티커를 다 모았을때 나에게 줄 보상 -->
			<i class="bi bi-award"></i>
			<i class="bi bi-cart4"></i>
			<i class="bi bi-cash-coin"></i>
			<i class="bi bi-piggy-bank"></i>
			<i class="bi bi-shop"></i>
			
			
			
			<!-- 스티커 판을 골라보아요 -->
			<i class="bi bi-images"></i>
			<i class="bi bi-plus-square-dotted"></i>
			<img>
			<img>
			
			
			<!-- 공유 여부 선택 -->
			<i class="bi bi-gear"></i>
			<i class="bi bi-share"></i>
			
			
			<!-- 저장 버튼 -->
		
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>