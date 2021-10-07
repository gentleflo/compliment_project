package com.gentleflo.complimentSticker.user.bo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.common.EncryptUtils;
import com.gentleflo.complimentSticker.user.dao.UserDAO;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	public int signUp(String email, String loginId, String userName, String password) {
		// password 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		if(encryptPassword.equals("")) {
			logger.error("[UserBO signUp] 암호화 실패!!!!!");
			return 0;
		}
		
		return userDAO.insertUser(email, loginId, userName, encryptPassword);
	}
}
