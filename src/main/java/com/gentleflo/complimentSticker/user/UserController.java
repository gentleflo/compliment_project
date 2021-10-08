package com.gentleflo.complimentSticker.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {
	
	// 회원가입 화면
	@GetMapping("/signup_view")
	public String signupView() {
		return "user/signUp";
	}
	
	//로그인 화면
	@GetMapping("/signin_view")
	public String signinView() {
		return "user/signIn";
	}
	
	// 로그아웃
	@GetMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("loginId");
		session.removeAttribute("userName");
		
		return "redirect:/user/signin_view";
	}
}
