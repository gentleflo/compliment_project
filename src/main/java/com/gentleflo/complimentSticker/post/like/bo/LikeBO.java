package com.gentleflo.complimentSticker.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.like.dao.LikeDAO;


@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;

	
	// userId와 postId로 좋아요 여부 확인
	public boolean getLikeByUserIdPostId(int userId, int postId) {
		int count = likeDAO.selectLikeListByUserIdPostId(userId, postId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	
	// userId와 postId로 좋아요 여부 확인 후 삭제
	public int deleteLikeByUserIdPostId(int userId, int postId) {
		return likeDAO.deleteLikeByUserIdPostId(userId, postId);
	}
	
	
	// 좋아요 입력 또는 취소
	public boolean like(int userId, int postId) {
		// 좋아요 상태이면 좋아요 취소
		if(this.getLikeByUserIdPostId(userId, postId)) {
			int count = likeDAO.deleteLikeByUserIdPostId(userId, postId);
			if(count == 0) {
				return false;  // 좋아요 상태가 아닌것
			} else {
				return true;   // 좋아요 상태인것
			}
		} else {  // 좋아요 취소 상태이면 좋아요
			int count = likeDAO.insertLikeByUserIdPostId(userId, postId);
			if(count == 1) {
				return true;
			} else {
				return false;
			}
		}    // return이 true인 경우는... 좋아요가 insert된것!
	}
	
	
	// postId에 해당하는 좋아요 갯수 가져오기
	public int getCountLikeByPostId(int postId) {
		return likeDAO.selectLikeForCountByPostId(postId);
	}
	
	
	// preview 페이지에서 칭찬 포스트 삭제하기
	public int deleteLike(int postId) {
		return likeDAO.deleteLikeByPostId(postId);
	}


}
