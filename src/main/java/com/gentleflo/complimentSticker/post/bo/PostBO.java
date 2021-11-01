package com.gentleflo.complimentSticker.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.compliment.bo.ComplimentBO;
import com.gentleflo.complimentSticker.post.dao.PostDAO;
import com.gentleflo.complimentSticker.post.gift.bo.GiftBO;
import com.gentleflo.complimentSticker.post.model.Post;
import com.gentleflo.complimentSticker.post.model.PostDetail;
import com.gentleflo.complimentSticker.post.stickerBoard.bo.StickerBoardBO;
import com.gentleflo.complimentSticker.post.stickerBoard.model.StickerBoard;
import com.gentleflo.complimentSticker.post.wishList.bo.WishListBO;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private ComplimentBO complimentBO;
	@Autowired
	private WishListBO wishListBO;
	@Autowired
	private StickerBoardBO stickerBoardBO;
	@Autowired
	private GiftBO giftBO;

	
	// post insert
	// bo에서 post model 객체를 생성해서 파라미터로 전달된 값들을 다 셋한다
	public boolean addPost(String startDate, String endDate, String compliment, String wishList, 
			int stickerBoardId, boolean share, int userId, String loginId) {
		
		Post post = new Post();
		post.setStartDate(startDate);
		post.setEndDate(endDate);
		post.setStickerBoardId(stickerBoardId);
		post.setShare(share);
		post.setUserId(userId);
		post.setLoginId(loginId);
		
		if(postDAO.insertPost(post) == 0) {
			return false;
		} 
		int postId = post.getId();   // postId 얻음
		
		if(complimentBO.addCompliment(userId, loginId, postId, compliment) == 0) {
			return false;
		}
		
		if(wishListBO.addwishList(userId, loginId, postId, wishList, null) == 0) {
			return false;
		}
		return true;
	}
	
	
	// compliment_preview 페이지에서 user가 선택해서 진행중이거나 종료한 스티커판 이미지와 선물하기 알람의 상태를 보여주기 위해!
	public List<PostDetail> getPostDetail(String loginId) {
		List<Post> postList = postDAO.selectPostList(loginId);
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		// postId로 gift 테이블 조회 (확인안한 알람이 있는지 count쿼리 0,1)
		for(Post post : postList) {
			StickerBoard stickerBoard = stickerBoardBO.getBoardImgIdStickerImgId(post.getStickerBoardId());
			int getGiftAlarmStatus = giftBO.getGiftAlarmStatus(post.getId());
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setStickerBoard(stickerBoard);
			postDetail.setGetGiftAlarmStatus(getGiftAlarmStatus);
			postDetailList.add(postDetail);
		}
		return postDetailList;
	}
	
	
	// compliment_detail_view 페이지
	public Post getPost(int postId) {
		return postDAO.selectPostByPostId(postId);
	}
	

}
