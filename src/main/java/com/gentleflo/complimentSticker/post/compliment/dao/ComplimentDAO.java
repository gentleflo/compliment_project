package com.gentleflo.complimentSticker.post.compliment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.compliment.model.Compliment;

@Repository
public interface ComplimentDAO {
	
	public int insertCompliment(@Param("compliment") List<Compliment> complimentList);
	
	public List<Compliment> selectComplimentByUserIdPostId(@Param("postId") int postId);
	
	public int deleteComplimentByComplimentId(@Param("complimentId") int complimentId);
	
	public List<Compliment> selectComplimentByPostId(@Param("postId") int postId);
}
