package com.gentleflo.complimentSticker.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.model.Post;

@Repository
public interface PostDAO {
	
	public List<String> selectStickerBoardImgPath();

	public int insertPost(Post post);
	
}
