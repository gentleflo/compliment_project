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
						<div class="loginId-box"><h4>${post.loginId }</h4></div>
						<div class="status text-success"><small><b>칭찬스티커 진행중</b></small></div>
						<div class="date"><small>${post.startDate } ~ ${post.endDate }</small></div>
					</div>
				</div>
				<div class="compliment-friend ml-3 mt-1">칭찬친구 11명</div>
				
				<!-- 위시리스트 -->
				<div class="d-flex ml-3 mt-4">
					<i class="bi bi-cart3 wishList-icon"></i>
					<div class="mt-2">
						<span class="ml-2"><b>스티커를 다 모으면</b></span><br>
						<span class="ml-2 wishList-box"><b>나에게 줄 상 :)</b></span>
					</div>
				</div>
				<div class="form-check ml-3 mt-4">
					<c:forEach var="wishListContent" items="${wishList }">
					<div class="d-flex">
						<input class="form-check-input" type="checkbox" value="" id="wishListCheck">
							<label class="form-check-label wishList-content ml-1 mr-4">${wishListContent.wishList }</label><br>	
						<!-- 선물하기 링크 일단 숨겨놓음!  -->
						<a href="#" class="add-url text-secondary text-right" data-toggle="modal" data-target="#updateUrl" 
							data-wishlist-id="${wishListContent.id }"><small>구매 좌표 추가!</small></a>
						<a href="#" class="gift-link text-info text-right d-none"><small>선물하기</small></a>
					</div>
					</c:forEach>
				</div>
				
			<!-- Modal -->
			<div class="modal fade" id="updateUrl" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <div class="modal-title" id="exampleModalLongTitle"><i class="wink-icon bi bi-emoji-wink mr-1"></i>구매 좌표 추가</div>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <textarea class="form-control" id="urlAddressInput"></textarea>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal"><b>닫기</b></button>
			        <button type="button" class="btn btn-outline-info btn-sm" id="addUrlBtn"><b>저장하기</b></button>
			      </div>
			    </div>
			  </div>
			</div>
				
				
			</div>
			
			<!-- 우측 스티커보드와 칭찬리스트, 좋아요, 댓글 섹션 -->
			<div class="stickerBoard-complimentList-section">
				<!-- 스티커 보드 -->
				<div class="d-flex align-items-end">
					<div class="sticker-board mt-3"><img src="${post.stickerBoardImgUrl }" id="stickerBoardImg" width="680px" class="stickerBoard-img"></div>
					<i class="bi bi-hand-thumbs-up like-icon ml-1"></i>
				</div>
				<div class="text-right mr-2 compliment-count"><b>칭찬 11개</b></div>
				<!-- 칭찬 리스트 -->
				<c:forEach var="complimentContent" items="${compliment }" varStatus="status">
					<div class="compliment-list mt-4">
						<div class="d-flex justify-content-between">
							<div class="d-flex">
								<div class="number-box text-center"><h3>${status.count }</h3></div>
								<div class="ml-3 mt-2">${complimentContent.compliment.compliment }</div>
							</div>
							<div class="mt-2"><a href="#" class="commentOpenBtn text-secondary" data-compliment-id="${complimentContent.compliment.id }" data-status="close"><small>칭찬 펼치기</small></a></div>
						</div>
						<div class="line-box mt-2"></div>
				
						
						<!-- 댓글 -->
						<div class="d-none ml-5" id="comment-box-${complimentContent.compliment.id }">
							<div class="d-flex">
								<input type="text" placeholder="친구의 계획을 칭찬해주세요 :)" id="commentInput-${complimentContent.compliment.id }" class="comment-input col-8 form-control mt-2">
								<a href="#" class="commentBtn text-secondary mt-3 ml-1" data-compliment-id="${complimentContent.compliment.id }"><small>게시</small></a>
							</div>
								
							<c:forEach var="commentList" items="${complimentContent.commentList }">
								<div class="d-flex mt-1">
									<div class="mr-4 comment-loginId"><i class="bi bi-emoji-wink mr-1"></i>${commentList.loginId }</div>
									<div class="comment-content">${commentList.comment }</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			var stickerClicked = [
			<c:forEach var="sticker" items="${stickerNumber }">
				${sticker.stickerNumber}, 
			</c:forEach> ];
			
			var leftPositions = [65, 135, 210, 365, 445, 530, 615, 520, 30, 90, 175, 220, 440, 465, 620, 540, 45, 130, 225, 595];
			var topPositions = [65, 135, 45, 35, 125, 170, 100, 55, 170, 235, 275, 175, 230, 340, 235, 280, 310, 355, 375, 375];
			for(var i = 0; i < 20; i++) {
				var obj = $("<img>");
				obj.text(i);
				obj.css("display", "block");
				obj.attr("src", "/static/image/board_img1_beforeClick.png");
				obj.css("width","25px");
				obj.css("height", "25px");
				obj.css("position", "absolute");
				obj.css("left", (leftPositions[i]) + "px");
				obj.css("top", (topPositions[i]) + "px");
				$("#stickerBoardImg").after(obj);
				obj.data("stickernumber", i + 1);
				
				for(var j = 0; j < stickerClicked.length; j++) {
					if(i + 1 == stickerClicked[j]) {
						obj.attr("src", "/static/image/board_img1_afterClick.png");
						stickerClicked.splice(j, 1);
						break;
					}
				}
				
				
				obj.on("click", function(){
					$(this).attr("src", "/static/image/board_img1_afterClick.png");
					var postId = ${post.id };
					var stickerId = $(this).data("stickernumber");
					
					$.ajax({
						type:"post",
						url:"/post/sticker_count",
						data:{"postId":postId, "stickerNumber":stickerId},
						success:function(data) {
							if(data.result == "success") {
							} else {
								location.reload();
							}
						}, error:function(e) {
							alert("error");
						}
					});
				});
			}
			
			
			
			$(".commentOpenBtn").on("click", function(e){
				e.preventDefault();
				var complimentId = $(this).data("compliment-id");
				var status = $(this).data("status");
				if(status == "close") {
					$("#comment-box-" + complimentId).removeClass("d-none");
					$(this).html("<small>칭찬 닫기</small>");
					$(this).data("status", "open");
				} else {
					$("#comment-box-" + complimentId).addClass("d-none");
					$(this).html("<small>칭찬 펼치기</small>");
					$(this).data("status", "close");
				}
			});
			
			
			
			$(".commentBtn").on("click", function(e){
				e.preventDefault();	
				
				var complimentListId = $(this).data("compliment-id");
				var commentContent = $("#commentInput-" + complimentListId).val();
				
				if(commentContent == null || commentContent == "") {
					alert("칭찬 내용을 입력해주세요:)");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/create_comment",
					data:{"complimentListId":complimentListId, "comment":commentContent},
					success:function(data) {
						if(data.result == "success") {
							location.reload();	
						} else {
							alert("댓글 등록 실패");
						}
					}, error:function(e) {
						alert("error");
					}
				});
			});
			
		
		
			$(".add-url").on("click", function(){
				var wishListId = $(this).data("wishlist-id");
				$("#addUrlBtn").data("wishlist-id", wishListId);
			});
			
			
			
			$("#addUrlBtn").on("click", function(){
				var wishListId = $(this).data("wishlist-id");
				var url = $("#urlAddressInput").val();
				alert(wishListId);
				alert(url);
				if(url == null || url == "") {
				 	alert("");
				 	return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/update_url",
					data:{"wishListId":wishListId, "url":url},
					success:function(data) {
						if(data.result == "success") {
							location.reload();	
						} else {
							alert("url 저장 실패");
						}
					}, error:function(e) {
						alert("error");
					}
					
				});
			});
		
		});
	</script>
</body>
</html>