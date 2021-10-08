package com.gentleflo.complimentSticker.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gentleflo.complimentSticker.user.bo.UserBO;
import com.gentleflo.complimentSticker.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	private UserBO userBO;
	
	// 회원가입
	@PostMapping("/sign_up")
	public Map<String, String> signUp(@RequestParam("email") String email
			, @RequestParam("loginId") String loginId
			, @RequestParam("userName") String userName
			, @RequestParam("password") String password) {
		
		int count = userBO.signUp(email, loginId, userName, password);
		Map<String, String> result = new HashMap<>();
		if(count == 0) {
			result.put("result", "fail");
		} else {
			result.put("result", "success");
		}
		return result;
	}
	
	
	// 아이디 중복확인
	@GetMapping("/is_duplicated_id")
	public Map<String, Boolean> isDuplicatedId(@RequestParam("loginId") String loginId) {
		Map<String, Boolean> result = new HashMap<>();
		result.put("is_duplicate", userBO.isDuplicatedId(loginId));
		return result;
	}
	
	
	// 로그인
	@PostMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request){
		
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("loginId", user.getLoginId());
			session.setAttribute("userName", user.getUserName());
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
}
