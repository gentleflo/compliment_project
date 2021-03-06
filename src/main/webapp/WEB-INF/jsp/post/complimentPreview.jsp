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
					<i class="bi bi-person-circle profile-icon"></i>
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
						<a href="#" class="text-dark ml-5" data-toggle="modal" data-target="#visitFriendModal">
						<i class="bookmark-icon bi bi-bookmark-star-fill ml-5"></i>
						<small><b>칭찬친구 보러가기</b></small></a>
					</div>
				</div>
			</div>
			
			<!-- 사용자 리스트 링크 Modal -->
			<div class="modal fade" id="visitFriendModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content visit-friend-modal">
			      <div class="modal-header">
			        <div class="modal-title">친구들에게 칭찬하러 가볼까요?<b><i class="bi bi-emoji-wink ml-1 mb-3"></i></b></div>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body text-center">
			     	<c:forEach var="userList" items="${userList }">
			       		<a href="/post/compliment_preview?loginId=${userList.loginId }" class="text-dark text-center mb-3">${userList.loginId }</a><br>
			        </c:forEach>
			      </div>
			    </div>
			  </div>
			</div>
			
			
			
			<!-- 칭찬 스티커 미리보기 섹션 -->
			<div class="preview-section d-flex">
				<!-- 스티커판 메인 이미지 -->
				<div class="preview-main mt-3 ml-5">
					<c:choose>
						<c:when test="${not empty postDetailForPreview[0]}">
							<!-- 디테일뷰로 넘어갈 수 있게 해주는 a태그 -->
							<a href="/post/compliment_detail_view?postId=${postDetailForPreview[0].post.id }">
							<img src="${postDetailForPreview[0].stickerBoard.stickerBoardImgUrl }" alt="스티커보드 이미지 미리보기" class="stickerBoardImgPreview">
							</a>
							<!-- 게시물 삭제 아이콘 -->
							<c:if test="${loginId eq param.loginId }">
								<div class="delete-icon-position">
									<a href="#" data-toggle="modal" data-target="#deleteModal" class="deleteModal" data-post-id="${postDetailForPreview[0].post.id }">
										<b><i class="post-delete bi bi-x text-secondary"></i></b></a>
								</div>
							</c:if>
						</c:when>
						<c:otherwise>
							<img src="/static/image/Blank_img_2.png" alt="비어있는 이미지" class="stickerBoardImgPreview">
						</c:otherwise>
					</c:choose>
					<!-- 선물 아이콘 -->
					<div class="gift-icon-position">
						<c:choose>
							<c:when test="${not empty postDetailForPreview[0].gift && postDetailForPreview[0].post.loginId eq loginId }">
								<a href="#" class="gift-icon" data-post-id="${postDetailForPreview[0].post.id }" data-toggle="modal" data-target="#giftAlarmModal">
									<i class="bi bi-gift-fill text-danger"></i></a>								
							</c:when>
							<c:otherwise>
								<a href="#" class="gift-icon d-none" data-post-id="${postDetailForPreview[0].post.id }"><i class="bi bi-gift-fill text-danger"></i></a>
							</c:otherwise>
						</c:choose>
								
						<!-- 선물하기 아이콘 클릭시 뜨는 modal -->
						<c:forEach var="gift" items="${postDetailForPreview[0].gift }" varStatus="status">
							<c:choose>
							<c:when test="${status.index eq 0 }">
								<div class="modal fade" id="giftAlarmModal" role="dialog" >
							</c:when>
							<c:otherwise>
								<div class="modal fade" id="giftAlarmModal${status.index }" role="dialog" >
							</c:otherwise>
							</c:choose>
								<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="giftAlarm-modal-title"><i class="wink-icon bi bi-emoji-wink mr-1"></i><b>친구가 선물알람을 보냈어요!</b></h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body">
										<span class="gift-alarm"><b>${gift.loginId }</b>님께서 <b>${gift.wishList }</b> 선물하셨어요 :)</span>
									</div>
									<div class="modal-footer">
										<c:choose>
										<c:when test="${status.last }">
											<button type="button" class="btn btn-outline-info btn-sm modal-close-btn" data-dismiss="modal">확인</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-outline-info btn-sm"  data-toggle="modal" data-dismiss="modal" data-target="#giftAlarmModal${status.count }">다음</button>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
								</div>
							</div>
						</c:forEach>
							
					</div>
				</div>
				
				
				<div>
					<!-- 스티커판 왼쪽 상단 작은 이미지 -->	
					<div class="preview-aside ml-3">
						<c:choose>
							<c:when test="${not empty postDetailForPreview[1]}">
								<a href="/post/compliment_detail_view?postId=${postDetailForPreview[1].post.id }">
								<img src="${postDetailForPreview[1].stickerBoard.stickerBoardImgUrl }" class="stickerBoardImgPreview">
								</a>
								<!-- 게시물 삭제 아이콘 -->
								<c:if test="${loginId eq param.loginId }">
									<div class="delete-icon-sm-position">
										<a href="#" data-toggle="modal" data-target="#deleteModal" class="deleteModal" data-post-id="${postDetailForPreview[1].post.id }">
											<b><i class="post-delete bi bi-x text-secondary"></i></b></a>
									</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<div class="preview-aside"><img src="/static/image/Blank_img_2.png" alt="비어있는 이미지" class="stickerBoardImgPreview"></div>
							</c:otherwise>
						</c:choose>
						<!-- 선물 아이콘 -->
						<div class="gift-icon-position">
						<c:choose>
							<c:when test="${not empty postDetailForPreview[1].gift && postDetailForPreview[1].post.loginId eq loginId}" >
								<a href="#" class="gift-icon" data-post-id="${postDetailForPreview[1].post.id }" data-toggle="modal" data-target="#giftAlarmModal1">
									<i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="gift-icon d-none" data-post-id="${postDetailForPreview[1].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:otherwise>
						</c:choose>
						
						<!-- 선물하기 아이콘 클릭시 뜨는 modal -->
						<c:forEach var="gift" items="${postDetailForPreview[1].gift }" varStatus="status">
							<c:choose>
							<c:when test="${status.index eq 0 }">
								<div class="modal fade" id="giftAlarmModal1" role="dialog" >
							</c:when>
							<c:otherwise>
								<div class="modal fade" id="giftAlarmModal1${status.index }" role="dialog" >
							</c:otherwise>
							</c:choose>
								<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="giftAlarm-modal-title"><i class="wink-icon bi bi-emoji-wink mr-1"></i><b>친구가 선물알람을 보냈어요!</b></h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body">
										<span class="gift-alarm"><b>${gift.loginId }</b>님께서 <b>${gift.wishList }</b> 선물하셨어요 :)</span>
									</div>
									<div class="modal-footer">
										<c:choose>
										<c:when test="${status.last }">
											<button type="button" class="btn btn-outline-info btn-sm modal-close-btn" data-dismiss="modal">확인</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-outline-info btn-sm"  data-toggle="modal" data-dismiss="modal" data-target="#giftAlarmModal1${status.count }">다음</button>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</div>
							
					<!-- 스티커판 왼쪽 하단 작은 이미지 -->
					<div class="preview-aside ml-3 mt-3">
						<c:choose>
							<c:when test="${not empty postDetailForPreview[2] }">
								<a href="/post/compliment_detail_view?postId=${postDetailForPreview[2].post.id }">
								<img src="${postDetailForPreview[2].stickerBoard.stickerBoardImgUrl }" class="stickerBoardImgPreview">
								</a>
								<!-- 게시물 삭제 아이콘 -->
								<c:if test="${loginId eq param.loginId }">
									<div class="delete-icon-sm-position">
										<a href="#"  data-toggle="modal" data-target="#deleteModal" class="deleteModal" data-post-id="${postDetailForPreview[2].post.id }">
											<b><i class="post-delete bi bi-x text-secondary"></i></b></a>
									</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<div class="preview-aside"><img src="/static/image/Blank_img_2.png" alt="비어있는 이미지" class="stickerBoardImgPreview"></div>
							</c:otherwise>
						</c:choose>
						<!-- 선물 아이콘 -->
						<div class="gift-icon-position">
						<c:choose>
							<c:when test="${not empty postDetailForPreview[2].gift && postDetailForPreview[2].post.loginId eq loginId}">
								<a href="#" class="gift-icon" data-post-id="${postDetailForPreview[2].post.id }" data-toggle="modal" data-target="#giftAlarmModal2">
									<i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="gift-icon d-none" data-post-id="${postDetailForPreview[2].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:otherwise>
						</c:choose>
						
						<!-- 선물하기 아이콘 클릭시 뜨는 modal -->
						<c:forEach var="gift" items="${postDetailForPreview[2].gift }" varStatus="status">
							<c:choose>
							<c:when test="${status.index eq 0 }">
								<div class="modal fade" id="giftAlarmModal2" role="dialog" >
							</c:when>
							<c:otherwise>
								<div class="modal fade" id="giftAlarmModal2${status.index }" role="dialog" >
							</c:otherwise>
							</c:choose>
								<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="giftAlarm-modal-title"><i class="wink-icon bi bi-emoji-wink mr-1"></i><b>친구가 선물알람을 보냈어요!</b></h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body">
										<span class="gift-alarm"><b>${gift.loginId }</b>님께서 <b>${gift.wishList }</b> 선물하셨어요 :)</span>
									</div>
									<div class="modal-footer">
										<c:choose>
										<c:when test="${status.last }">
											<button type="button" class="btn btn-outline-info btn-sm modal-close-btn" data-dismiss="modal">확인</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-outline-info btn-sm"  data-toggle="modal" data-dismiss="modal" data-target="#giftAlarmModal2${status.count }">다음</button>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
								</div>
							</div>
						</c:forEach>
						</div>
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
								<!-- 게시물 삭제 아이콘 -->
								<c:if test="${loginId eq param.loginId }">
									<div class="delete-icon-sm-position">
										<a href="#"  data-toggle="modal" data-target="#deleteModal" class="deleteModal" data-post-id="${postDetailForPreview[3].post.id }">
											<b><i class="post-delete bi bi-x text-secondary"></i></b></a>
									</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<img src="/static/image/Blank_img_2.png" alt="비어있는 이미지" class="stickerBoardImgPreview">
							</c:otherwise>
						</c:choose>
						<!-- 선물 아이콘 -->
						<div class="gift-icon-position">
						<c:choose>
							<c:when test="${not empty postDetailForPreview[3].gift && postDetailForPreview[3].post.loginId eq loginId}">
								<a href="#" class="gift-icon" data-post-id="${postDetailForPreview[3].post.id }" data-toggle="modal" data-target="#giftAlarmModal3">
									<i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="gift-icon d-none" data-post-id="${postDetailForPreview[3].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:otherwise>
						</c:choose>
						
						<!-- 선물하기 아이콘 클릭시 뜨는 modal -->
						<c:forEach var="gift" items="${postDetailForPreview[3].gift }" varStatus="status">
							<c:choose>
							<c:when test="${status.index eq 0 }">
								<div class="modal fade" id="giftAlarmModal3" role="dialog" >
							</c:when>
							<c:otherwise>
								<div class="modal fade" id="giftAlarmModal3${status.index }" role="dialog" >
							</c:otherwise>
							</c:choose>
								<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="giftAlarm-modal-title"><i class="wink-icon bi bi-emoji-wink mr-1"></i><b>친구가 선물알람을 보냈어요!</b></h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body">
										<span class="gift-alarm"><b>${gift.loginId }</b>님께서 <b>${gift.wishList }</b> 선물하셨어요 :)</span>
									</div>
									<div class="modal-footer">
										<c:choose>
										<c:when test="${status.last }">
											<button type="button" class="btn btn-outline-info btn-sm modal-close-btn" data-dismiss="modal">확인</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-outline-info btn-sm"  data-toggle="modal" data-dismiss="modal" data-target="#giftAlarmModal3${status.count }">다음</button>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</div>
							
					<!-- 스티커판 오른쪽 하단 작은 이미지 -->
					<div class="preview-aside ml-3 mt-3">
						<c:choose>
							<c:when test ="${not empty postDetailForPreview[4] }">
								<a href="/post/compliment_detail_view?postId=${postDetailForPreview[4].post.id }">
								<img src="${postDetailForPreview[4].stickerBoard.stickerBoardImgUrl }" class="stickerBoardImgPreview">
								</a>
								<!-- 게시물 삭제 아이콘 -->
								<c:if test="${loginId eq param.loginId }">
									<div class="delete-icon-sm-position">
										<a href="#"  data-toggle="modal" data-target="#deleteModal" class="deleteModal" data-post-id="${postDetailForPreview[4].post.id }">
											<b><i class="post-delete bi bi-x text-secondary"></i></b></a>
									</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<img src="/static/image/Blank_img_2.png" alt="비어있는 이미지" class="stickerBoardImgPreview">
							</c:otherwise>
						</c:choose>	
						<!-- 선물 아이콘 -->
						<div class="gift-icon-position">
						<c:choose>
							<c:when test="${not empty postDetailForPreview[4].gift && postDetailForPreview[4].post.loginId eq loginId}">
								<a href="#" class="gift-icon" data-post-id="${postDetailForPreview[4].post.id }" data-toggle="modal" data-target="#giftAlarmModal4">
									<i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="gift-icon d-none" data-post-id="${postDetailForPreview[4].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:otherwise>
						</c:choose>
						
						<!-- 선물하기 아이콘 클릭시 뜨는 modal -->
						<c:forEach var="gift" items="${postDetailForPreview[4].gift }" varStatus="status">
							<c:choose>
							<c:when test="${status.index eq 0 }">
								<div class="modal fade" id="giftAlarmModal4" role="dialog" >
							</c:when>
							<c:otherwise>
								<div class="modal fade" id="giftAlarmModal4${status.index }" role="dialog" >
							</c:otherwise>
							</c:choose>
								<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="giftAlarm-modal-title"><i class="wink-icon bi bi-emoji-wink mr-1"></i><b>친구가 선물알람을 보냈어요!</b></h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body">
										<span class="gift-alarm"><b>${gift.loginId }</b>님께서 <b>${gift.wishList }</b> 선물하셨어요 :)</span>
									</div>
									<div class="modal-footer">
										<c:choose>
										<c:when test="${status.last }">
											<button type="button" class="btn btn-outline-info btn-sm modal-close-btn" data-dismiss="modal">확인</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-outline-info btn-sm"  data-toggle="modal" data-dismiss="modal" data-target="#giftAlarmModal4${status.count }">다음</button>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
								</div>
							</div>
						</c:forEach>
						</div>
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
			
			<!-- 칭찬스티커판 삭제하기 Modal -->
			<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-body text-center">
			        <a href="#" class="text-dark" id="postDeleteBtn">'칭찬 스티커 삭제하기'</a>
			      </div>
			    </div>
			  </div>
			</div>
		   
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			$(".gift-icon").on("click", function(e){
				e.preventDefault();
				
				var postId = $(this).data("post-id");
				
				$.ajax({
					type:"post",	
					url:"/post/update_gift_alarmStatus",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							// 추가한다면 아이콘 없애는 기능 넣기
						} else {
							alert("선물하기 알람상태 업데이트 실패");
						}
					}, error:function(e) {
						alert("error...........");
					}
				});
			});
		
		
			$(".deleteModal").on("click", function(e){
				e.preventDefault();
				
				var postId = $(this).data("post-id");
				$("#postDeleteBtn").data("post-id", postId);
			});
			
			$("#postDeleteBtn").on("click", function(e) {
				e.preventDefault();
				
				var postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패");
						}
					}, error:function(e) {
						alert("error......");
					}
				});
			});
			
			$(".modal-close-btn").on("click", function(){
				location.reload();
			});
			
		});
	</script>
</body>
</html>