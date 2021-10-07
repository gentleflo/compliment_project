package com.gentleflo.complimentSticker.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gentleflo.complimentSticker.user.bo.UserBO;

@Controller
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	private UserBO userBO;
	
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
}
