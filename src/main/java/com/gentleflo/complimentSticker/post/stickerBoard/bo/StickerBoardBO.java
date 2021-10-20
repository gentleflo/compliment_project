package com.gentleflo.complimentSticker.post.stickerBoard.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.stickerBoard.dao.StickerBoardDAO;
import com.gentleflo.complimentSticker.post.stickerBoard.model.StickerBoard;

@Service
public class StickerBoardBO {
	@Autowired
	private StickerBoardDAO stickerBoardDAO;
	
	public List<StickerBoard> getBoardImgStickerImg() {  // 행이 여러개이니까 리스트
		return stickerBoardDAO.selectBoardImgStickerImg();
	}
	
	public StickerBoard getBoardImgIdStickerImgId(int id) {
		return stickerBoardDAO.selectBoardImgStickerImgById(id);
	}

}
