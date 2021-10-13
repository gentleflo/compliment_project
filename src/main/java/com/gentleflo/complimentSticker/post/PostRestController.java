package com.gentleflo.complimentSticker.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gentleflo.complimentSticker.post.bo.PostBO;



@RestController
@RequestMapping("/post")
public class PostRestController {
	@Autowired
	private PostBO postBO;

	
	@PostMapping("/create_post")
	public Map<String, String> createPost(
			@RequestParam("startDate") String startDate
			, @RequestParam("endDate") String endDate
			, @RequestParam("compliment") String compliment
			, @RequestParam("wishList") String wishList
			, @RequestParam("stickerBoardId") int stickerBoardId
			, @RequestParam("share") boolean share
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String loginId = (String)session.getAttribute("loginId");
		
		boolean post = postBO.addPost(startDate, endDate, compliment, wishList, stickerBoardId, share, userId, loginId);
		Map<String, String> result = new HashMap<>();
		if(post) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
