package com.gentleflo.complimentSticker.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	public int insertUser(
			@Param("email") String email
			, @Param("loginId") String loginId
			, @Param("userName") String userName
			, @Param("password") String password);
	
}
