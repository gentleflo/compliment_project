package com.gentleflo.complimentSticker.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.dao.PostDAO;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	// /post/compliment_edit_view에 칭찬스티커보드 이미지 미리보기를 위해-
	public List<String> getStickerBoardImgPath() {
		return postDAO.selectStickerBoardImgPath();
	}
	
	

	
}
