package com.gentleflo.complimentSticker.post.gift.model;

import java.util.Date;

public class Gift {
	private int id;
	private int userId;
	private int postId;
	private String loginId;
	private int wishListId;
	private String wishList;
	private String alarmStatus;
	private Date createdAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public int getWishListId() {
		return wishListId;
	}
	public void setWishListId(int wishListId) {
		this.wishListId = wishListId;
	}
	public String getWishList() {
		return wishList;
	}
	public void setWishList(String wishList) {
		this.wishList = wishList;
	}
	public String getAlarmStatus() {
		return alarmStatus;
	}
	public void setAlarmStatus(String alarmStatus) {
		this.alarmStatus = alarmStatus;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}
