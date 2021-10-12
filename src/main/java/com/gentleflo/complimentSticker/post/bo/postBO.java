package com.gentleflo.complimentSticker.post.bo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.gentleflo.complimentSticker.post.dao.PostDAO;
import com.gentleflo.complimentSticker.post.model.Post;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	// /post/compliment_edit_view에 칭찬스티커보드 이미지 미리보기를 위해-
	public List<String> getStickerBoardImgPath() {
		return postDAO.selectStickerBoardImgPath();
	}

	// bo에서 post model 객체를 생성해서 파라미터로 전달된 값들을 다 셋한다
	public int addPost(String startDate
			,String endDate
			,String compliment
			,String wishList
			,int stickerBoardId
			,boolean share
			,int userId
			,String loginId) {
		
		Post post = new Post();
		post.setStartDate(startDate);
		post.setEndDate(endDate);
		post.setStickerBoardId(stickerBoardId);
		post.setShare(share);
		post.setUserId(userId);
		post.setLoginId(loginId);
		
		postDAO.insertPost(post);
		int postId = post.getId();
		
		// complimentBO.addCompliment(compliment, userId, loginId, postId);
		
	
	}
	
	
	
}
