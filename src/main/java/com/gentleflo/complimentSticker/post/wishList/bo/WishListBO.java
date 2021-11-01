package com.gentleflo.complimentSticker.post.wishList.bo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.gift.bo.GiftBO;
import com.gentleflo.complimentSticker.post.gift.model.Gift;
import com.gentleflo.complimentSticker.post.wishList.dao.WishListDAO;
import com.gentleflo.complimentSticker.post.wishList.model.WishList;
import com.gentleflo.complimentSticker.post.wishList.model.WishListDetail;

@Service
public class WishListBO {
	@Autowired
	private WishListDAO wishListDAO;
	@Autowired
	private GiftBO giftBO;
	
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
	
	
	public List<WishListDetail> getWishList(int postId) {
		List<WishList> wishListList = wishListDAO.selectWishListByPostId(postId);
		List<WishListDetail> wishListDetailList = new ArrayList<>();
		
		// 위시리스트 한개당 알림 상태 가져오기
		for(WishList wishList : wishListList) {
			// 해당하는 위시리스트의 알람상태 가져오기
			Gift gift = giftBO.getGift(wishList.getId());
			
			// 위시리스트와 선물알람상태 매칭
			WishListDetail wishListDetail = new WishListDetail();
			wishListDetail.setWishList(wishList);
			wishListDetail.setGift(gift);
			
			wishListDetailList.add(wishListDetail);
		}
		return wishListDetailList;
		
		//return wishListDAO.selectWishListByUserIdPostId(postId);
	}
	
	
	// url 업데이트
	public int addUrl(int id, int userId, String url) {
		return wishListDAO.updateUrl(id, userId, url);
	}
}
