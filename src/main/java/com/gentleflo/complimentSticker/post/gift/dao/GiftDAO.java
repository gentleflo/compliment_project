package com.gentleflo.complimentSticker.post.gift.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface GiftDAO {

	// detail_view에서 '선물알림:)' 버튼 클릭시 gift table에 insert하기용
	public int insertGift(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("loginId") String loginId
			, @Param("wishListId") int wishListId);
	
	
	// preview에서 post별로 확인하지 않은 알람이 있는지 조회하기용
	public int selectGiftAlarmByPostIdAlarmStatus(
			@Param("postId") int postId);
	
	
	// preview 화면에서 아이콘 클릭시 gift의 alarmStatus 컬럼 내용 업데이트용
	public int updateGiftAlarmStatus(
			@Param("giftId") int giftId
			, @Param("userId") int userId);
}

