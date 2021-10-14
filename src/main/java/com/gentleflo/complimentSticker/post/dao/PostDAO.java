package com.gentleflo.complimentSticker.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.model.Post;

@Repository
public interface PostDAO {
	
	
	public List<String> selectStickerBoardImgPath();
	
	
	public int insertPost(Post post);
	
	
	// compliment_preview 화면에 스티커판 미리보여주기
	public List<Post> selectStickerBoardImgByUserIdLoginId(
			@Param("userId") int userId
			, @Param("loginId") String loginId);
	
}
