package com.gentleflo.complimentSticker.post.wishList.bo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.wishList.dao.WishListDAO;
import com.gentleflo.complimentSticker.post.wishList.model.WishList;

@Service
public class WishListBO {
	@Autowired
	private WishListDAO wishListDAO;
	
	public int addwishList(int userId, String loginId, int postId, String wishList, String url) {
		String[] wishListSplit = wishList.split("/");
		
		List<String> wishListList = Arrays.asList(wishListSplit);
		
		List<WishList> wishListContentList = new ArrayList<>();
		
		for(String wishListContent : wishListList) {
			WishList element = new WishList();
			element.setUserId(userId);
			element.setLoginId(loginId);
			element.setPostId(postId);
			element.setWishList(wishListContent);
			element.setUrl(url);
			wishListContentList.add(element);
		}
		return wishListDAO.insertWishList(wishListContentList);
	}
	
	
	public List<WishList> getWishList(int userId, int postId) {
		return wishListDAO.selectWishListByUserIdPostId(userId, postId);
	}
	
	
	// url 업데이트
	public int addUrl(int id, int userId, String url) {
		return wishListDAO.updateUrl(id, userId, url);
	}
}
