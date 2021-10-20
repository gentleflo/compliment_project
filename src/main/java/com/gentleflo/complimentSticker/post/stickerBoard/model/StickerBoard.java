package com.gentleflo.complimentSticker.post.stickerBoard.model;

import java.util.Date;

public class StickerBoard {
	private int id;
	private String imagePath;
	private String beforeClickStickerUrl;
	private String afterClickStickerUrl;
	private Date createdAt;
	private Date updatedAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getBeforeClickStickerUrl() {
		return beforeClickStickerUrl;
	}
	public void setBeforeClickStickerUrl(String beforeClickStickerUrl) {
		this.beforeClickStickerUrl = beforeClickStickerUrl;
	}
	public String getAfterClickStickerUrl() {
		return afterClickStickerUrl;
	}
	public void setAfterClickStickerUrl(String afterClickStickerUrl) {
		this.afterClickStickerUrl = afterClickStickerUrl;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
