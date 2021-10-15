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
	<link rel="stylesheet" href="/static/css/style_compliment_detail.css" type="text/css">
	<title>칭찬스티커 디테일 화면</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex">
			<!-- 좌측 프로필과 위시리스트 섹션 -->
			<div class="profile-wishList-section">
				<!-- 프로필 -->
				<div class="profile d-flex ml-3 mt-4">
					<i class="bi bi-person-circle profile-icon"></i>
					<div class="ml-2 mt-3">
						<div class="loginId">${post.loginId }</div>
						<div class="status text-success"><small><b>칭찬스티커 진행중</b></small></div>
						<div class="date"><small>${post.startDate } ~ ${post.endDate }</small></div>
					</div>
				</div>
				<div class="compliment-friend ml-3 mt-1">칭찬친구 11명</div>
				
				<!-- 위시리스트 -->
				<div class="d-flex ml-3 mt-4">
					<i class="bi bi-cart3 wishList-icon"></i>
					<div class="ml-2 mt-3">위시리스트</div>
				</div>
				<div class="form-check ml-3 mt-2">
					<div class="d-flex">
						<c:forEach var="wishListContent" items="${wishList }">
							<input class="form-check-input" type="checkbox" value="" id="wishListCheck">
								<label class="form-check-label wishList-content ml-1 mr-4">${wishListContent.wishList }</label><br>
						</c:forEach>
						<!-- 선물하기 링크 일단 숨겨놓음!  -->
						<div><a href="#" class="gift-link text-info text-right d-none"><small>선물하기</small></a></div>
					</div>
					<div class="d-flex">
						<input class="form-check-input" type="checkbox" value="" id="wishListCheck">
							<label class="form-check-label wishList-content ml-1 mr-4">시스템 겨울 아우터</label><br>
						<div><a href="#" class="gift-link text-info text-right d-none"><small>선물하기</small></a></div>
					</div>
					<div class="d-flex">
						<input class="form-check-input" type="checkbox" value="" id="wishListCheck">
							<label class="form-check-label wishList-content ml-1 mr-4">브라운 컬러 로퍼</label><br>
						<div><a href="#" class="gift-link text-info text-right d-none"><small>선물하기</small></a></div>
					</div>
				</div>
			</div>
			
			<!-- 우측 스티커보드와 칭찬리스트, 좋아요, 댓글 섹션 -->
			<div class="stickerBoard-complimentList-section">
				<!-- 스티커 보드 -->
				<div class="d-flex align-items-end">
					<div class="sticker-board mt-3"><img src="/static/image/board_img1.png" width="680px" class="stickerBoard-img"></div>
					<i class="bi bi-hand-thumbs-up like-icon ml-1"></i>
				</div>
				<div class="text-right mr-2 compliment-count">칭찬 11개</div>
				<!-- 칭찬 리스트 -->
				<div class="compliment-list mt-4">
					<div class="d-flex justify-content-between">
						<div class="d-flex">
							<div class="number-box"><h3>1</h3></div>
							<div class="ml-3 mt-2">자기 전에 스트레칭 하고 자기!</div>
						</div>
						<div class="mt-2"><a href="#" class="text-secondary"><small>칭찬 펼치기</small></a></div>
					</div>
					<div class="line-box mt-2"></div>
					
				
				</div>
				
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>