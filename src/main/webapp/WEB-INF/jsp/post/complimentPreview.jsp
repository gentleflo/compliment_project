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
						<a href="#" class="text-dark ml-5" data-toggle="modal" data-target="#exampleModalCenter">
						<i class="bookmark-icon bi bi-bookmark-star-fill ml-5"></i>
						<small><b>칭찬친구 보러가기</b></small></a>
					</div>
				</div>
			</div>
			
			<!-- 사용자 리스트 링크 Modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <div class="modal-title" id="exampleModalLongTitle">친구들에게 칭찬하러 가볼까요?<b><i class="bi bi-emoji-wink ml-1 mb-3"></i></b></div>
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
						</c:when>
						<c:otherwise>
							<img src="" alt="비어있는 이미지" class="stickerBoardImgPreview">
						</c:otherwise>
					</c:choose>
					<!-- 선물 아이콘 -->
					<div class="gift-icon-position">
						<c:choose>
							<c:when test="${postDetailForPreview[0].getGiftAlarmStatus >= 1 && postDetailForPreview[0].post.loginId eq loginId}">
								<a href="#" class="gift-icon" data-post-id="${postDetailForPreview[0].post.id }"><i class="bi bi-gift-fill text-danger"></i></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="gift-icon d-none" data-post-id="${postDetailForPreview[0].post.id }"><i class="bi bi-gift-fill text-danger"></i></a>
							</c:otherwise>
						</c:choose>
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
							</c:when>
							<c:otherwise>
								<div class="preview-aside"><img src="" alt="비어있는 이미지" class="stickerBoardImgPreview"></div>
							</c:otherwise>
						</c:choose>
						<!-- 선물 아이콘 -->
						<div class="gift-icon-position">
						<c:choose>
							<c:when test="${postDetailForPreview[1].getGiftAlarmStatus >= 1 && postDetailForPreview[1].post.loginId eq loginId}">
								<a href="#" class="gift-icon" data-post-id="${postDetailForPreview[1].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="gift-icon d-none" data-post-id="${postDetailForPreview[1].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:otherwise>
						</c:choose>
						</div>
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
						<div class="gift-icon-position">
						<c:choose>
							<c:when test="${postDetailForPreview[2].getGiftAlarmStatus >= 1 && postDetailForPreview[2].post.loginId eq loginId}">
								<a href="#" class="gift-icon" data-post-id="${postDetailForPreview[2].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="gift-icon d-none" data-post-id="${postDetailForPreview[2].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:otherwise>
						</c:choose>
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
							</c:when>
							<c:otherwise>
								<img src="" alt="비어있는 이미지" class="stickerBoardImgPreview">
							</c:otherwise>
						</c:choose>
						<!-- 선물 아이콘 -->
						<div class="gift-icon-position">
						<c:choose>
							<c:when test="${postDetailForPreview[3].getGiftAlarmStatus >= 1 && postDetailForPreview[3].post.loginId eq loginId}">
								<a href="#" class="gift-icon" data-post-id="${postDetailForPreview[3].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="gift-icon d-none" data-post-id="${postDetailForPreview[3].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:otherwise>
						</c:choose>
						</div>
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
						<div class="gift-icon-position">
						<c:choose>
							<c:when test="${postDetailForPreview[4].getGiftAlarmStatus >= 1 && postDetailForPreview[4].post.loginId eq loginId}">
								<a href="#" class="gift-icon" data-post-id="${postDetailForPreview[4].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="gift-icon d-none" data-post-id="${postDetailForPreview[4].post.id }"><i class="small-gift-icon bi bi-gift-fill text-danger"></i></a>
							</c:otherwise>
						</c:choose>
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
			
			
			
			<!-- 선물하기 아이콘 클릭시 뜨는 modal -->
			<!-- Modal -->
		    <!-- <div class="modal fade" id="empModal" role="dialog">
			    <div class="modal-dialog">
				    <div class="modal-content">
					    <div class="modal-header">
						    <h4 class="modal-title">친구가 선물을 했어요!</h4>
						    <button type="button" class="close" data-dismiss="modal">&times;</button>
					    </div>
					    <div class="modal-body">
					 	'선물하기를 누른 사용자의 loginId'님께서 '선물알람을 누른 위시리스트 항목'에 선물 알람을 눌렀어요~!
					    </div>
					    <div class="modal-footer">
					   		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					    </div>
				    </div>
			    </div>
		    </div>  -->
		   
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
							alert("친구가 선물을 보냈어요! 확인해볼까요?:)");
							//$('.modal-body').html("로그인 성공");
				            // Display Modal
				            //$('#empModal').modal('show'); 
						} else {
							alert("선물하기 알람상태 업데이트 실패");
						}
					}, error:function(e) {
						alert("error...........");
					}
				});
			});
			
			
		});
	</script>
</body>
</html>