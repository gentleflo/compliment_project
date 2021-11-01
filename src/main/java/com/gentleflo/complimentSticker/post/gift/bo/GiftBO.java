package com.gentleflo.complimentSticker.post.gift.bo;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.gift.dao.GiftDAO;
import com.gentleflo.complimentSticker.post.gift.model.Gift;


@Service 
public class GiftBO {
	@Autowired
	private GiftDAO giftDAO;
	
	// detail_view에서 '선물알림:)' 버튼 클릭시 gift table에 insert하기용
	public int addGift(int userId, int postId, String loginId, int wishListId) {
		return giftDAO.insertGift(userId, postId, loginId, wishListId);
	}
	
	
	// preview에서 post별로 확인하지 않은 알람이 있는지 조회하기용
	public int getGiftAlarmStatus(int postId) {
		return giftDAO.selectGiftAlarmByPostIdAlarmStatus(postId);
	}
	
	
	// preview 화면에서 아이콘 클릭시 gift의 alarmStatus 컬럼 내용 업데이트용
	public int updateAlarmStatus(int giftId, int userId) {
		return giftDAO.updateGiftAlarmStatus(giftId, userId);
	}
	
	// detail_view에서 위시리스트에 해당하는 알람상태 가져오기
	public Gift getGift(int wishListId){
		return giftDAO.selectGiftByWishListId(wishListId);
	}
	
}
