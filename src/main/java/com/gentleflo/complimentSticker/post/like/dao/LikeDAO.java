package com.gentleflo.complimentSticker.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	// like insert
	public int insertLikeByUserIdPostId(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	// select like list
	public int selectLikeListByUserIdPostId(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	// like delete 
	public int deleteLikeByUserIdPostId(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	// count like
	public int selectLikeForCountByPostId(
			@Param("postId") int postId);
}
