package com.gentleflo.complimentSticker.user.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.common.EncryptUtils;
import com.gentleflo.complimentSticker.user.dao.UserDAO;
import com.gentleflo.complimentSticker.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	// 회원가입
	public int signUp(String email, String loginId, String userName, String password) {
		// password 암호화
		String encryptPassword = EncryptUtils.md5(password);
	
		if(encryptPassword.equals("")) {
			logger.error("[UserBO signUp] 암호화 실패!!!!!");
			return 0;
		}
		
		return userDAO.insertUser(email, loginId, userName, encryptPassword);
	}
	
	
	// 아이디 중복확인
	public boolean isDuplicatedId(String loginId) {
		int count = userDAO.selectByLoginId(loginId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	
	// 로그인
	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.selectByLoginIdPassword(loginId, encryptPassword);
	}
	
	
	// 사용자 리스트 모두 긁어오기_preview 페이지에 뿌리기용
	public List<User> getUserList() {
		return userDAO.selectAllUserList();
	}
}
