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
						<div class="loginId-box"><h4><a href="/post/compliment_preview?loginId=${post.loginId }" class="text-dark">${post.loginId }</a></h4></div>
						<div class="d-flex justify-content-between">
							<div class="status text-success"><small><b>칭찬스티커 진행중</b></small></div>
							
							<c:if test="${post.loginId eq loginId }">
								<div class="ml-4"><a href="/post/compliment_edit_view" class="go-to-edit text-secondary"><b>스티커판 추가</b></a></div>
							</c:if>
						</div>
						<div class="date"><small>${post.startDate } ~ ${post.endDate }</small></div>
					</div>
				</div>
				<!-- <div class="compliment-friend ml-3 mt-1">칭찬친구 11명</div> -->
				
				<!-- 위시리스트 -->
				<div class="d-flex ml-3 mt-5">
					<i class="bi bi-cart3 wishList-icon"></i>
					<div class="mt-2">
						<span class="ml-2"><b>스티커를 다 모으면</b></span><br>
						<span class="ml-2 wishList-box"><b>나에게 줄 상 :)</b></span>
					</div>
				</div>
				<div class="form-check ml-3 mt-4">
					<c:forEach var="wishListContent" items="${wishList }">
					<div class="d-flex">
						<!-- 위시리스트 체크박스와 내용 -->
						<c:choose>
							<c:when test="${not empty wishListContent.gift.id }">
								<input class="form-check-input" type="checkbox" value="" id="wishListCheck" checked disabled>
									<label class="form-check-label wishList-content ml-1 mr-4">${wishListContent.wishList.wishList }</label><br>
							</c:when>
							<c:otherwise>
								<input class="form-check-input" type="checkbox" value="" id="wishListCheck" disabled>
									<label class="form-check-label wishList-content ml-1 mr-4">${wishListContent.wishList.wishList }</label><br>
							</c:otherwise>
						</c:choose>
						
						
						<!-- 구매좌표 추가/수정, 스스로에게 선물, 친구에게 선물 -->
						<c:choose>
							<c:when test="${empty wishListContent.wishList.url && post.loginId eq loginId }" >
								<a href="#" class="add-url text-secondary text-right" data-toggle="modal" data-target="#updateUrl" 
									data-wishlist-id="${wishListContent.wishList.id }"><small>구매 좌표 <b>추가!</b></small></a>
							</c:when>
							<c:when test="${empty wishListContent.wishList.url && post.loginId ne loginId }">
								<a href="#" class="gift-link text-info text-right d-none" data-toggle="modal" data-target="#giftUrl" data-gift-person="friend"
									data-wishlist-id="${wishListContent.wishList.id }" data-wishlist-wishlist="${wishListContent.wishList.wishList }" data-wishlist-url="${wishListContent.wishList.url }" data-post-id="${wishListContent.wishList.postId }">
									<small>친구에게 선물하기!</small></a>
							</c:when>
							<c:when test="${not empty wishListContent.gift.id && post.loginId eq loginId }">
								<span></span>
							</c:when>
							<c:when test="${not empty wishListContent.wishList.url && post.loginId eq loginId }">
								<div class="d-flex">
									<a href="#" class="add-url text-secondary text-right" data-toggle="modal" data-target="#updateUrl" 
										data-wishlist-id="${wishListContent.wishList.id }"><small>구매 좌표 <b>수정 </b></small></a>
									<a href="#" class="gift-link text-secondary text-right" data-toggle="modal" data-target="#giftUrl" data-gift-person="me"
										data-wishlist-id="${wishListContent.wishList.id }" data-wishlist-wishlist="${wishListContent.wishList.wishList }" data-wishlist-url="${wishListContent.wishList.url }" data-post-id="${wishListContent.wishList.postId }">
										<small>/ 나에게 <b>선물</b>하기</small></a>
								</div>
							</c:when>
							<c:when test="${not empty wishListContent.gift.id && post.loginId ne loginId }">
								<a href="#" class="gift-link text-info text-right d-none" data-toggle="modal" data-target="#giftUrl" data-gift-person="friend"
									data-wishlist-id="${wishListContent.wishList.id }" data-wishlist-wishlist="${wishListContent.wishList.wishList }" data-wishlist-url="${wishListContent.wishList.url }" data-post-id="${wishListContent.wishList.postId }">
									<small>친구에게 선물하기!</small></a>
							</c:when>
							<c:when test="${not empty wishListContent.wishList.url && post.loginId ne loginId }">
								<a href="#" class="gift-link text-info text-right" data-toggle="modal" data-target="#giftUrl" data-gift-person="friend"
									data-wishlist-id="${wishListContent.wishList.id }" data-wishlist-wishlist="${wishListContent.wishList.wishList }" data-wishlist-url="${wishListContent.wishList.url }" data-post-id="${wishListContent.wishList.postId }">
									<small>친구에게 선물하기!</small></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="gift-link text-info text-right" data-toggle="modal" data-target="#giftUrl" data-gift-person="friend"
									data-wishlist-id="${wishListContent.wishList.id }" data-wishlist-wishlist="${wishListContent.wishList.wishList }" data-wishlist-url="${wishListContent.wishList.url }" data-post-id="${wishListContent.wishList.postId }">
									<small>친구에게 선물하기!</small></a>
							</c:otherwise>
						</c:choose>
					</div>
					</c:forEach>
				</div>
				
			<!-- 구매 좌표 추가용 Modal -->
			<div class="modal fade" id="updateUrl" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <div class="modal-title"><i class="wink-icon bi bi-emoji-wink mr-1"></i>구매 좌표 추가</div>
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
			
			
			
			<!-- 나에게 선물하기용 + 다른 사용자가 친구에게 선물하기용 Modal -->
			<div class="modal fade" id="giftUrl" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <div class="modal-title"><i class="heart-eyes bi bi-emoji-heart-eyes mr-1"></i><span id="modalHeader">친구에게 선물하기!</span></div>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <a href="#" id="showGiftUrl" target="_blank" class="text-success">선물사러가기</a>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal"><b>닫기</b></button>
			        <button type="button" class="btn btn-outline-info btn-sm" id="sendGiftBtn"><b><span id="sendGiftAlarm">선물 알림 :)</span></b></button>
			      </div>
			    </div>
			  </div>
			</div>

			</div>
			
			
			<!-- 우측 스티커보드와 칭찬리스트, 좋아요, 댓글 섹션 -->
			<div class="stickerBoard-complimentList-section">
				<!-- 스티커 보드 -->
				<div class="d-flex align-items-end">
					<div class="sticker-board mt-3"><img src="${stickerBoard.stickerBoardImgUrl }" id="stickerBoardImg" width="680px" class="stickerBoard-img"></div>
					<!-- 좋아요 -->
					<c:choose>
						<c:when test="${isLike }">
							<a href="#" id="likeBtn" data-post-id="${post.id }"><i class="bi bi-hand-thumbs-up-fill like-icon ml-1"></i></a>
						</c:when>
						<c:otherwise>
							<a href="#" id="likeBtn" data-post-id="${post.id }"><i class="bi bi-hand-thumbs-up like-icon ml-1"></i></a>
						</c:otherwise>
					</c:choose>
				</div>	
				<div class="text-right mr-2 compliment-count"><b>칭찬 ${countLike }개</b></div>
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
				obj.attr("src", "${stickerBoard.beforeClickStickerUrl }");
				obj.css("width","28px");
				obj.css("height", "33px");
				obj.css("position", "absolute");
				obj.css("left", (leftPositions[i]) + "px");
				obj.css("top", (topPositions[i]) + "px");
				$("#stickerBoardImg").after(obj);
				obj.data("stickernumber", i + 1);
				
				for(var j = 0; j < stickerClicked.length; j++) {
					if(i + 1 == stickerClicked[j]) {
						obj.attr("src", "${stickerBoard.afterClickStickerUrl }");
						stickerClicked.splice(j, 1);
						break;
					}
				}
				
				<c:if test="${post.loginId eq loginId}">
				obj.on("click", function(){
					$(this).attr("src", "${stickerBoard.afterClickStickerUrl }");
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
				</c:if>
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
			
		
			// url 주소 '저장하기' 버튼이 실행될때 필요한 wishListId를 부여해주기 위한 클릭 이벤트
			$(".add-url").on("click", function(){
				var wishListId = $(this).data("wishlist-id");
				$("#addUrlBtn").data("wishlist-id", wishListId);
			});
			
			
			$("#addUrlBtn").on("click", function(){
				var wishListId = $(this).data("wishlist-id");
				var url = $("#urlAddressInput").val();
				
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
			
			
			// 디테일뷰에서 '선물하기' 링크가 클릭되었을때 wishListId를 부여해주기 위한 클릭 이벤트
			$(".gift-link").on("click", function(){
				var wishListId = $(this).data("wishlist-id");
				var wishList = $(this).data("wishlist-wishlist");
				var wishListUrl = $(this).data("wishlist-url")
				var postId = $(this).data("post-id");
				var giftFrom = $(this).data("gift-person");
				$("#showGiftUrl").data("wishlist-id", wishListId);
				$("#showGiftUrl").attr("href", wishListUrl);
				
				$("#sendGiftBtn").data("wishlist-wishlist", wishList);
				$("#sendGiftBtn").data("wishlist-id", wishListId);
				$("#sendGiftBtn").data("post-id", postId);
				
				if(giftFrom == "me") {
					$("#modalHeader").text("나에게 선물하기");
					$("#sendGiftAlarm").text("선물 완료:)");
				} 
			});
			
			
			// 친구에게 선물하기! modal에서 '선물 알림:)' 클릭시 insert 되는 클릭 이벤트
			$("#sendGiftBtn").on("click", function(){
				var wishListId = $("#sendGiftBtn").data("wishlist-id");
				var wishList = $("#sendGiftBtn").data("wishlist-wishlist");
				var postId = $("#sendGiftBtn").data("post-id"); 
				var giftFrom = $(".gift-link").data("gift-person");
				
				$.ajax({
					type:"post",
					url:"/post/create_gift",
					data:{"postId":postId, "wishList":wishList, "wishListId":wishListId},
					success:function(data) {
						if(data.result == "success" && giftFrom == "friend") {
							alert("친구에게 선물 알림을 보냈어요~!:)")
							location.reload();
						} else if(data.result == "success" && giftFrom == "me") {
							alert("스스로에게 칭찬 선물 완료! :^)")
							location.reload();
						} else {
							alert("선물알림 실패");
						}
					}, error:function(e) {
						alert(error);
					}
				});
			});
			
			
			// 좋아요 버튼
			$("#likeBtn").on("click",function(e){
				e.preventDefault();
				
				var likePostId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/like",
					data:{"postId":likePostId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("칭찬 클릭 실패애...!");
						}
					} ,error:function(e) {
						alert("error......");
					}
				});
				
			});
		
		});
	</script>
</body>
</html>