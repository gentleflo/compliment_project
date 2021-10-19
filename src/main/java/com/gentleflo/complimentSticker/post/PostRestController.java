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
import com.gentleflo.complimentSticker.post.comment.bo.CommentBO;
import com.gentleflo.complimentSticker.post.wishList.bo.WishListBO;




@RestController
@RequestMapping("/post")
public class PostRestController {
	@Autowired
	private PostBO postBO;
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private WishListBO wishListBO;

	
	@PostMapping("/create_post")
	public Map<String, String> createPost(
			@RequestParam("startDate") String startDate
			, @RequestParam("endDate") String endDate
			, @RequestParam("compliment") String compliment
			, @RequestParam("wishList") String wishList
			, @RequestParam("stickerBoardImgUrl") String stickerBoardImgUrl
			, @RequestParam("share") boolean share
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String loginId = (String)session.getAttribute("loginId");
		
		boolean post = postBO.addPost(startDate, endDate, compliment, wishList, stickerBoardImgUrl, share, userId, loginId);
		Map<String, String> result = new HashMap<>();
		if(post) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	
	@PostMapping("/create_comment")
	public Map<String, String> createComment(
			@RequestParam("complimentListId") int complimentListId
			, @RequestParam("comment") String comment
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String loginId = (String)session.getAttribute("loginId");
		
		int count = commentBO.addComment(userId, loginId, complimentListId, comment);
		Map<String, String> result = new HashMap<>();
		if(count == 0) {
			result.put("result", "fail");
		} else {
			result.put("result", "success");
		}
		return result;
	}
	
	
	@PostMapping("/update_url")
	public Map<String, String> updateUrl(
			@RequestParam("wishListId") int id
			, @RequestParam("url") String url
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = wishListBO.addUrl(id, userId, url);
		
		Map<String, String> result = new HashMap<>();
		if(count == 0) {
			result.put("result", "fail");
		} else {
			result.put("result", "success");
		}
		return result;
	}
	
	
}
