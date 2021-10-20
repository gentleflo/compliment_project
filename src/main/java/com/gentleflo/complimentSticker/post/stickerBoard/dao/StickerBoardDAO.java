package com.gentleflo.complimentSticker.post.stickerBoard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.stickerBoard.model.StickerBoard;

@Repository
public interface StickerBoardDAO {
	
	public List<StickerBoard> selectBoardImgStickerImg();
	
	// post insert시에 선택된 스티커보드에 해당하는 스티커 이미지 url 정보까지 넘겨주기 위한 DAO
	public StickerBoard selectBoardImgStickerImgById(@Param("id") int id);
}
