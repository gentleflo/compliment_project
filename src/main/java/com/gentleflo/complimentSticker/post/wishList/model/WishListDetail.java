package com.gentleflo.complimentSticker.post.wishList.model;

import com.gentleflo.complimentSticker.post.gift.model.Gift;

public class WishListDetail {
	private WishList wishList;
	private Gift gift;
	
	public WishList getWishList() {
		return wishList;
	}
	public void setWishList(WishList wishList) {
		this.wishList = wishList;
	}
	public Gift getGift() {
		return gift;
	}
	public void setGift(Gift gift) {
		this.gift = gift;
	}
}
