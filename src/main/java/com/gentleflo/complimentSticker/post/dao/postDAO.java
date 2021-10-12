package com.gentleflo.complimentSticker.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {
	
	public List<String> selectStickerBoardImgPath();

}
