package com.gentleflo.complimentSticker.post.compliment.model;

import java.util.List;

import com.gentleflo.complimentSticker.post.comment.model.Comment;

public class ComplimentDetail {
	private Compliment compliment;
	private List<Comment> commentList;
	
	public Compliment getCompliment() {
		return compliment;
	}
	public void setCompliment(Compliment compliment) {
		this.compliment = compliment;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

}
