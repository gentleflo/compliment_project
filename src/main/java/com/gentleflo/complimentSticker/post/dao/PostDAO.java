package com.gentleflo.complimentSticker.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.model.Post;


@Repository
public interface PostDAO {
	
	public int insertPost(Post post);
	
	
	// compliment_preview 화면에 스티커판 미리보여주기
	public List<Post> selectPostList(
			@Param("loginId") String loginId);

	
	// compliment_detail_view 페이지 - post 내용 싹 긁어오기
	public Post selectPostByUserIdPostId(@Param("postId") int postId);

}
