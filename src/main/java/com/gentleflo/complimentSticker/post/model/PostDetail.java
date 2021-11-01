package com.gentleflo.complimentSticker.post.model;

import com.gentleflo.complimentSticker.post.stickerBoard.model.StickerBoard;

public class PostDetail {
	private Post post;
	private StickerBoard stickerBoard;
	private int getGiftAlarmStatus;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public StickerBoard getStickerBoard() {
		return stickerBoard;
	}
	public void setStickerBoard(StickerBoard stickerBoard) {
		this.stickerBoard = stickerBoard;
	}
	public int getGetGiftAlarmStatus() {
		return getGiftAlarmStatus;
	}
	public void setGetGiftAlarmStatus(int getGiftAlarmStatus) {
		this.getGiftAlarmStatus = getGiftAlarmStatus;
	}
}
