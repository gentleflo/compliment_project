package com.gentleflo.complimentSticker.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.complimentSticker.user.model.User;

@Repository
public interface UserDAO {
	
	// 회원가입
	public int insertUser(
			@Param("email") String email
			, @Param("loginId") String loginId
			, @Param("userName") String userName
			, @Param("password") String password);
	
	
	// 아이디 중복확인
	public int selectByLoginId(@Param("loginId") String loginId);
	
	
	// 로그인
	public User selectByLoginIdPassword(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	
	// 사용자 리스트 모두 긁어오기_preview 페이지에 뿌리기용
	public List<User> selectAllUserList();
}
