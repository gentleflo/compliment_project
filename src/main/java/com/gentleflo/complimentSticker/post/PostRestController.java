package com.gentleflo.complimentSticker.post;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gentleflo.complimentSticker.post.bo.PostBO;
import com.gentleflo.complimentSticker.post.compliment.bo.ComplimentBO;


@RestController
@RequestMapping("/post")
public class PostRestController {
	@Autowired
	private PostBO postBO;
	@Autowired
	private ComplimentBO complimentBO;
	
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

		
	}
	
}
