package com.gentleflo.complimentSticker.post.stickerBoard.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.stickerBoard.model.StickerBoard;

@Repository
public interface StickerBoardDAO {
	
	public List<StickerBoard> selectBoardImgStickerImgById();
}
