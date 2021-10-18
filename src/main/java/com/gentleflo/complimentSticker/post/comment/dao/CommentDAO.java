package com.gentleflo.complimentSticker.post.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("userId") int userId
			, @Param("complimentListId") int complimentListId
			, @Param("comment") String comment);
}
