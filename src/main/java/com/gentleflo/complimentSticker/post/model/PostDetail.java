package com.gentleflo.complimentSticker.post.model;

import java.util.List;

import com.gentleflo.complimentSticker.post.gift.model.Gift;
import com.gentleflo.complimentSticker.post.stickerBoard.model.StickerBoard;

public class PostDetail {
	private Post post;
	private StickerBoard stickerBoard;
	private List<Gift> gift;
	private int getAlarmStatusCount;
	
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
	public List<Gift> getGift() {
		return gift;
	}
	public void setGift(List<Gift> gift) {
		this.gift = gift;
	}
	public int getGetAlarmStatusCount() {
		return getAlarmStatusCount;
	}
	public void setGetAlarmStatusCount(int getAlarmStatusCount) {
		this.getAlarmStatusCount = getAlarmStatusCount;
	}
}
