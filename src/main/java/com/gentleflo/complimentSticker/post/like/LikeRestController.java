package com.gentleflo.complimentSticker.post.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gentleflo.complimentSticker.post.like.bo.LikeBO;

@RestController
@RequestMapping("/post")
public class LikeRestController {
	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/like")
	public Map<String, String> addlike(
			HttpServletRequest request
			, @RequestParam("postId") int postId) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		boolean isLike = likeBO.like(userId, postId);  // true로 like가 insert되었다면..?
		
		Map<String, String> result = new HashMap<>();
		if(isLike) {  // true
			result.put("result","success");
		} else {      // false
			result.put("result", "fail");
		}
		return result;
	}
}
