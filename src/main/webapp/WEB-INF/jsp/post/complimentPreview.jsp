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
	<link rel="stylesheet" href="/static/css/style_compliment_preview.css" type="text/css">
	
	<title>칭찬 스티커 미리보기 화면</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section>
			<!-- 프로필 -->
			<div class="preview-header d-flex mt-3">
				<div class="d-flex mt-1 mr-4">
					<i class="bi bi-person-square profile-icon"></i> 
					<div class="ml-3 mt-4">
						<!-- loginId -->
						<h5 class="userName-box">${param.loginId }</h5>
						<!-- 칭찬 스티커 진행 상황 -->
						<div class="text-success mr-5">
							<small class="mr-5"><b>칭찬 스티커 진행중</b></small>
						</div>
					</div>
				</div>
					<!-- 사용자 리스트 링크 modal -->
				<div class="d-flex mt-4 ml-5">
					<div class="mt-5 ml-5">
						<a href="#" class="text-dark ml-5"><i class="bookmark-icon bi bi-bookmark-star-fill ml-5"></i>
						<small><b>칭찬친구 보러가기</b></small></a>
					</div>
				</div>
			</div>
			
		
			
			<!-- 칭찬 스티커 미리보기 섹션 -->
			<div class="preview-section d-flex mt-2">
				<!-- 스티커판 메인 이미지 -->
				<div class="preview-main mt-3 ml-5">
					<c:choose>
						<c:when test="${not empty postDetailForPreview[0]}">
							<!-- 디테일뷰로 넘어갈 수 있게 해주는 a태그 -->
							<a href="/post/compliment_detail_view?postId=${postDetailForPreview[0].post.id }">
							<img src="${postDetailForPreview[0].stickerBoard.stickerBoardImgUrl }" alt="스티커보드 이미지 미리보기" class="stickerBoardImgPreview">
							</a>
						</c:when>
						<c:otherwise>
							<img src="" alt="비어있는 이미지" class="stickerBoardImgPreview">
						</c:otherwise>
					</c:choose>
					<!-- 선물 아이콘 -->
					<c:if test="${postDetailForPreview[0].getGiftAlarmStatus >= 1}">
						<a href="#"><i class="gift-icon bi bi-gift text-danger"></i></a>
					</c:if>
				</div>
				
				<div>
					<!-- 스티커판 왼쪽 상단 작은 이미지 -->	
					<div class="preview-aside ml-3">
						<c:choose>
							<c:when test="${not empty postDetailForPreview[1]}">
								<a href="/post/compliment_detail_view?postId=${postDetailForPreview[1].post.id }">
								<img src="${postDetailForPreview[1].stickerBoard.stickerBoardImgUrl }" class="stickerBoardImgPreview">
								</a>
							</c:when>
							<c:otherwise>
								<div class="preview-aside"><img src="" alt="비어있는 이미지" class="stickerBoardImgPreview"></div>
							</c:otherwise>
						</c:choose>
						<!-- 선물 아이콘 -->
						<c:if test="${postDetailForPreview[1].getGiftAlarmStatus >= 1}">
							<a href="#"><i class="gift-icon bi bi-gift text-danger"></i></a>
						</c:if>
					</div>
							
					<!-- 스티커판 왼쪽 하단 작은 이미지 -->
					<div class="preview-aside ml-3 mt-3">
						<c:choose>
							<c:when test="${not empty postDetailForPreview[2] }">
								<a href="/post/compliment_detail_view?postId=${postDetailForPreview[2].post.id }">
								<img src="${postDetailForPreview[2].stickerBoard.stickerBoardImgUrl }" class="stickerBoardImgPreview">
								</a>
							</c:when>
							<c:otherwise>
								<div class="preview-aside"><img src="" alt="비어있는 이미지" class="stickerBoardImgPreview"></div>
							</c:otherwise>
						</c:choose>
						<!-- 선물 아이콘 -->
						<c:if test="${postDetailForPreview[2].getGiftAlarmStatus >= 1}">
							<a href="#"><i class="gift-icon bi bi-gift text-danger"></i></a>
						</c:if>
					</div>	
				</div>
				
				<div>
					<!-- 스티커판 오른쪽 상단 작은 이미지 -->
					<div class="preview-aside ml-3">
						<c:choose>
							<c:when test="${not empty postDetailForPreview[3] }">
								<a href="/post/compliment_detail_view?postId=${postDetailForPreview[3].post.id }">
								<img src="${postDetailForPreview[3].stickerBoard.stickerBoardImgUrl }" class="stickerBoardImgPreview">
								</a>
							</c:when>
							<c:otherwise>
								<img src="" alt="비어있는 이미지" class="stickerBoardImgPreview">
							</c:otherwise>
						</c:choose>
						<!-- 선물 아이콘 -->
						<c:if test="${postDetailForPreview[3].getGiftAlarmStatus >= 1}">
							<a href="#"><i class="gift-icon bi bi-gift text-danger"></i></a>
						</c:if>
					</div>
							
					<!-- 스티커판 오른쪽 하단 작은 이미지 -->
					<div class="preview-aside ml-3 mt-3">
						<c:choose>
							<c:when test ="${not empty postDetailForPreview[4] }">
								<a href="/post/compliment_detail_view?postId=${postDetailForPreview[4].post.id }">
								<img src="${postDetailForPreview[4].stickerBoard.stickerBoardImgUrl }" class="stickerBoardImgPreview">
								</a>
							</c:when>
							<c:otherwise>
								<img src="" alt="비어있는 이미지" class="stickerBoardImgPreview">
							</c:otherwise>
						</c:choose>	
						<!-- 선물 아이콘 -->
						<c:if test="${postDetailForPreview[4].getGiftAlarmStatus >= 1}">
							<a href="#"><i class="gift-icon bi bi-gift text-danger"></i></a>
						</c:if>	
					</div>		
				</div>
			</div>
			
			<!-- compliment_edit_view로 이동 -->
			<c:if test="${loginId eq param.loginId }">
				<div class="d-flex justify-content-end mr-4">
					<div class="go-to-edit-view">
						<a href="/post/compliment_edit_view" class="text-dark"><small>새로운 스티커판 만들러 가기:)</small></a>
					</div>
				</div>
			</c:if>
		</section>
	

		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			$(".gift-icon").on("click", function(){
				
			});
			
			
		});
	</script>
</body>
</html>