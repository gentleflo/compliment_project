package com.gentleflo.complimentSticker.post.compliment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.compliment.model.Compliment;

@Repository
public interface ComplimentDAO {
	
	public int insertCompliment(@Param("compliment") List<Compliment> complimentList);
	
	public List<Compliment> selectComplimentByUserIdPostId(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public Compliment selectComplimentByComplimentListIdPostId(
			@Param("complimentListId") int complimentListId
			, @Param("postId") int postId);
}
