package com.gentleflo.complimentSticker.post.gift.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.gift.dao.GiftDAO;

@Service 
public class GiftBO {
	@Autowired
	private GiftDAO giftDAO;
	
	public int addGift(int userId, String loginId, int wishListId) {
		return giftDAO.insertGift(userId, loginId, wishListId);
	}
}
