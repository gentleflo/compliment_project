package com.gentleflo.complimentSticker.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.compliment.bo.ComplimentBO;
import com.gentleflo.complimentSticker.post.dao.PostDAO;
import com.gentleflo.complimentSticker.post.model.Post;
import com.gentleflo.complimentSticker.post.wishList.bo.WishListBO;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private ComplimentBO complimentBO;
	@Autowired
	private WishListBO wishListBO;
	
	// /post/compliment_edit_view에 칭찬스티커보드 이미지 미리보기를 위해-
	public List<String> getStickerBoardImgPath() {
		return postDAO.selectStickerBoardImgPath();
	}
	
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
}