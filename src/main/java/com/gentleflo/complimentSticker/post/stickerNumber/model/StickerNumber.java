package com.gentleflo.complimentSticker.post.stickerNumber.model;

import java.util.Date;

public class StickerNumber {
	private int id;
	private int postId;
	private int stickerNumber;
	private Date createdAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getStickerNumber() {
		return stickerNumber;
	}
	public void setStickerNumber(int stickerNumber) {
		this.stickerNumber = stickerNumber;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}
