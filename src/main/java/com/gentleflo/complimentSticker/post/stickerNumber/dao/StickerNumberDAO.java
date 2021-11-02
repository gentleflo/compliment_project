package com.gentleflo.complimentSticker.post.stickerNumber.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.stickerNumber.model.StickerNumber;

@Repository
public interface StickerNumberDAO {

	public int insertStickerNumber(
			@Param("postId") int postId
			, @Param("stickerNumber") int stickerNumber);
	
	public List<StickerNumber> selectStickerNumberByPostId(
			@Param("postId") int postId);
	
	public int deleteStickerNumberByPostId(@Param("postId") int postId);
}
