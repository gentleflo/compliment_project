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
	
	public List<StickerBoard> getBoardImgStickerImg() {
		return stickerBoardDAO.selectBoardImgStickerImgById();
	}

}
