package com.gentleflo.complimentSticker.post.gift.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GiftDAO {

	public int insertGift(
			@Param("userId") int userId
			, @Param("loginId") String loginId
			, @Param("wishListId") int wishListId);
}
