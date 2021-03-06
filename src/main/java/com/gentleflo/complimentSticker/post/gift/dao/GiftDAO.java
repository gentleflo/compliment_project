package com.gentleflo.complimentSticker.post.gift.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.post.gift.model.Gift;


@Repository
public interface GiftDAO {

	// detail_view에서 '선물알림:)' 버튼 클릭시 gift table에 insert하기용
	public int insertGift(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("loginId") String loginId
			, @Param("wishListId") int wishListId
			, @Param("wishList") String wishList);
	
	
	// preview에서 post별로 확인하지 않은 알람이 있는지 조회하기하고 gift 정보 모두 긁어오기용
	public List<Gift> selectGiftAlarmByPostId(
			@Param("postId") int postId
			, @Param("loginId") String loginId);
	// preview에서 post별로 확인하지 않은 알람이 몇개가 있는지 count하기용
	public int selectAlarmStatusCountByPostId(
			@Param("postId") int postId);
	
	
	// preview 화면에서 아이콘 클릭시 gift의 alarmStatus 컬럼 내용 업데이트용
	public int updateGiftAlarmStatus(
			@Param("postId") int postId);

	
	// detail_view에서 위시리스트에 해당하는 알람상태 가져오기
	public Gift selectGiftByWishListId(
			@Param("wishListId") int wishListId);
	
	
	// preview에서 칭찬스티커 포스트 삭제하기
	public int deleteGiftByPostId(
			@Param("postId") int postId);
}

