package com.gentleflo.complimentSticker.post.stickerNumber.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.stickerNumber.dao.StickerNumberDAO;
import com.gentleflo.complimentSticker.post.stickerNumber.model.StickerNumber;

@Service
public class StickerNumberBO {
	@Autowired
	private StickerNumberDAO stickerNumberDAO;
	
	public int addStickerNumber(int postId, int stickerNumber) {
		return stickerNumberDAO.insertStickerNumber(postId, stickerNumber);
	}
	
	// 숫자만 가져오는 리스트
	public List<StickerNumber> getStickerNumber(int postId) {
		return stickerNumberDAO.selectStickerNumberByPostId(postId);	
	}
	
	// preview 페이지에서 포스트 삭제
	public int deleteStickerNumber(int postId) {
		return stickerNumberDAO.deleteStickerNumberByPostId(postId);
	}
	
}
