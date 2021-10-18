package com.gentleflo.complimentSticker.post.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.comment.dao.CommentDAO;


@Service
public class CommentBO {
	@Autowired
	private CommentDAO commentDAO;

	public int addComment(int userId, int complimentListId, String Comment) {
		return commentDAO.insertComment(userId, complimentListId, Comment);
	}
}
