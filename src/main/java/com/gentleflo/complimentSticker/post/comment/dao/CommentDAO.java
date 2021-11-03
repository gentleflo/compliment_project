package com.gentleflo.complimentSticker.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.comment.model.Comment;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("userId") int userId
			, @Param("loginId") String loginId
			, @Param("complimentListId") int complimentListId
			, @Param("comment") String comment);
	
	
	// 칭찬리스트아이디에 해당하는 댓글 가져오기
	public List<Comment> selectCommentByComplimentListId(
			@Param("complimentListId") int complimentListId);
	
	
	// 칭찬리스트아이디에 해당하는 댓글 삭제하기
	public int deleteCommentByComplimentListId(
			@Param("complimentListId") int complimentListId);
}
