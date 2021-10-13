package com.gentleflo.complimentSticker.post.compliment.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public interface ComplimentDAO {
	
	public int insertCompliment(
			@RequestParam("userId") int userId
			, @RequestParam("loginId") String loginId
			, @RequestParam("postId") int postId
			, @RequestParam("compliment") List<String> complimentList);
}
