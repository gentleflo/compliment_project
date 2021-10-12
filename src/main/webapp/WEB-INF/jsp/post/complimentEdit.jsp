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
		
		<section class="mt-4">
			<!-- 프로필 -->
			<div class="profile d-flex">
				<i class="bi bi-person-square profile-icon"></i> 
				<!--<i class="bi bi-person-badge profile-icon"></i>-->
				<div class="ml-2 mt-4">
					<!-- userName -->
					<c:if test="${not empty loginId }">
						<h5 class="userName-box">${loginId }</h5>
					</c:if>
					<!-- 팔로우, 팔로잉 정보 -->
					<div><small>칭찬친구 11명</small></div>
				</div>
			</div>
			
			
			<!-- 플랜 입력 부분 -->
			<div class="plan-section">
				<form id="complimentEditForm">
				<!-- 기간 설정 -->
				<div class="d-flex">
					<div class="plan-section-nav d-flex">
						<i class="bi bi-calendar2-date calendar-icon"></i>
						<div class="date-box ml-3 my-5 mr-5">기간 설정</div>
					</div>
					<div class="d-flex ml-5">
						<div class="startDate mt-5 ml-1"><small>시작일</small></div>
						<input type="date" id="startDateInput" class="start-date-input form-control mr-4 mt-4" placeholder="시작일을 선택하세요">
						<div class="endDate mt-5"><small>종료일</small></div>
						<input type="date" id="endDateInput" class="end-date-input form-control mt-4" placeholder="종료일을 선택하세요">
					</div>
				</div>
				
				
				<!-- 무엇을 했을때 나에게 칭찬하실 건가요? -->
				<div class="d-flex">
					<div class="d-flex">
						<i class="bi bi-clipboard-check compliment-list-icon"></i>
						<div class="plan-section-nav my-4 ml-2">
							<div class="compliment-list-box ml-2">무엇을 했을때</div>
							<div class="ml-2">나에게 칭찬하실건가요?</div>
						</div>
					</div>
					<div class="mt-3">
						<input type="text" id="complimentListInput" class="input-class form-control" placeholder="내용을 입력해주세요">
						<div class="text-secondary text-right"><small>내용은 ' / '로 구분해주세요 :)</small></div>
					</div>
				</div>
			
				
				<!-- 스티커를 다 모았을때 나에게 줄 보상 -->
				<div class="d-flex mt-3">
					<i class="bi bi-award award-icon"></i>
					<div class="plan-section-nav ml-3 my-4">
						<div>스티커를 다 모았을때</div>
						<div class="award-list-box">나에게 줄 보상!:)</div>
					</div>
					
					<div class="mt-3">
						<input type="text" id="wishListInput" class="input-class form-control" placeholder="언제나 즐거운 위시리스트 작성!">
						<div class="text-secondary text-right"><small>내용은 ' / '로 구분해주세요 :)</small></div>
					</div>
				</div>
			
				
				<!-- 스티커 판을 골라보아요  -->
				<div class="d-flex mt-2">
					<i class="bi bi-plus-square-dotted stickerBoard-icon ml-1"></i>
					<div class="plan-section-nav my-2">
						<div class="sticker-board-box ml-3 my-4">스티커 판을 골라보아요!</div>
					</div>
				</div>
				<div class="d-flex justify-content-center mt-1">
					<c:forEach var="stickerBoardPreview" items="${stickerBoardImgPathList }">
						<div class="stickerBoardImgBox text-center mr-3">
							<img src="${stickerBoardPreview.imagePath }" class="stickerBoardImgPreview d-block" alt="스티커 보드 임시 이미지">
							<input type="radio" value="" name="stickerBoard">
						</div>
					</c:forEach>
				</div>
			
				
				<!-- 공유 여부 선택 -->
				<div class="d-flex mt-4">
					<i class="bi bi-share share-icon"></i>
					<div class="plan-section-nav">
						<div class="share-box ml-3 my-4">공유 여부 선택</div>
					</div>
					<div class="ml-3 my-4">
						<input type="radio" name="share" value="share" id="shareChecked" class="mr-1" checked>
							<label for="shareChecked" class="mr-5">공유</label>
						<input type="radio" name="share" value="nonShare" id="nonShareChecked" class="mr-1">
							<label for="nonShareChecked">비공개</label>
					</div>
				</div>
				
				
				<!-- 저장 버튼 -->
				<div class="text-right">
					<button type="submit" class="btn btn-outline-success save-btn text-dark"><span class="btn-box">저장</span></button>
				</div>
				</form>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		
	</script>
</body>
</html>