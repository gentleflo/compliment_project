package com.gentleflo.complimentSticker.post.compliment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.compliment.model.Compliment;

@Repository
public interface ComplimentDAO {
	
	public int insertCompliment(@Param("compliment") List<Compliment> complimentList);
	
	public List<Compliment> selectComplimentByUserIdPostId(@Param("postId") int postId);
	
	public int deleteComplimentByPostId(@Param("postId") int postId);

}
