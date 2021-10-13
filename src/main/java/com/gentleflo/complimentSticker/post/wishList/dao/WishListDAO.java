package com.gentleflo.complimentSticker.post.wishList.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.wishList.model.WishList;

@Repository
public interface WishListDAO {
	
	public int insertWishList(
			@Param("wishList") List<WishList> wishList);
}