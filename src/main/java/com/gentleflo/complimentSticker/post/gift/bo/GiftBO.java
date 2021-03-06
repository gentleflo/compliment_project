package com.gentleflo.complimentSticker.post.gift.bo;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.gift.dao.GiftDAO;
import com.gentleflo.complimentSticker.post.gift.model.Gift;


@Service 
public class GiftBO {
	@Autowired
	private GiftDAO giftDAO;
	
	// detail_view에서 '선물알림:)' 버튼 클릭시 gift table에 insert하기용
	public int addGift(int userId, int postId, String loginId, int wishListId, String wishList) {
		return giftDAO.insertGift(userId, postId, loginId, wishListId, wishList);
	}
	
	
	// preview에서 post별로 확인하지 않은 알람이 있는지 조회하기하고 gift 정보 모두 긁어오기용
	public List<Gift> getGiftAlarmStatus(int postId, String loginId) {
		return giftDAO.selectGiftAlarmByPostId(postId, loginId);
	}
	// preview에서 post별로 확인하지 않은 알람이 몇개가 있는지 count하기용
	public int getAlaramStatusCount(int postId) {
		return giftDAO.selectAlarmStatusCountByPostId(postId);
	}
	
	
	// preview 화면에서 아이콘 클릭시 gift의 alarmStatus 컬럼 내용 업데이트용
	public int updateAlarmStatus(int postId) {
		return giftDAO.updateGiftAlarmStatus(postId);
	}
	
	// detail_view에서 위시리스트에 해당하는 알람상태 가져오기
	public Gift getGift(int wishListId){
		return giftDAO.selectGiftByWishListId(wishListId);
	}
	
	// priview에서 칭찬스티커 포스트 삭제하기
	public int deleteGift(int postId) {
		return giftDAO.deleteGiftByPostId(postId);
	}
	
}
