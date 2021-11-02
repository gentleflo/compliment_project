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
	public Post selectPostByPostId(@Param("postId") int postId);
	
	
	// compliment_preview 페이지에서 칭찬스티커 포스트 삭제하기
	public int deletePostByPostId(@Param("postId") int postId);
}
