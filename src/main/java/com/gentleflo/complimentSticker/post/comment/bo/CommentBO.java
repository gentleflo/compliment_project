package com.gentleflo.complimentSticker.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.comment.dao.CommentDAO;
import com.gentleflo.complimentSticker.post.comment.model.Comment;


@Service
public class CommentBO {
	@Autowired
	private CommentDAO commentDAO;

	public int addComment(int userId, String loginId, int complimentListId, String Comment) {
		return commentDAO.insertComment(userId, loginId, complimentListId, Comment);
	}
	
	// 칭찬리스트아이디에 해당하는 댓글 가져오기
	public List<Comment> getCommentList(int complimentListId) {
		return commentDAO.selectCommentByComplimentListId(complimentListId);
	}
	
	// comment 지우기
	public int deleteComment(int complimentListId) {
		return commentDAO.deleteCommentByComplimentListId(complimentListId);
	}
}
