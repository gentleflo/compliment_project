package com.gentleflo.complimentSticker.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gentleflo.complimentSticker.post.bo.PostBO;
import com.gentleflo.complimentSticker.post.compliment.bo.ComplimentBO;
import com.gentleflo.complimentSticker.post.compliment.model.ComplimentDetail;
import com.gentleflo.complimentSticker.post.model.Post;
import com.gentleflo.complimentSticker.post.wishList.bo.WishListBO;
import com.gentleflo.complimentSticker.post.wishList.model.WishList;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired 
	private PostBO postBO;
	@Autowired
	private ComplimentBO complimentBO;
	@Autowired
	private WishListBO wishListBO;


	
	@GetMapping("/compliment_edit_view")
	public String complimentEdit(Model model) {
		List<String> stickerBoardImgPathList = postBO.getStickerBoardImgPath();
		model.addAttribute("stickerBoardImgPathList",stickerBoardImgPathList);
		return "post/complimentEdit";
	}
	
	
	@GetMapping("/compliment_preview")
	public String complimentPreview(
			HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String loginId = (String)session.getAttribute("loginId");
		
		List<Post> stickerBoardImgPathForPreview = postBO.getStickerBoardImgUrl(userId, loginId);
		model.addAttribute("stickerBoardImgPathForPreview", stickerBoardImgPathForPreview);
		return "post/complimentPreview";
	}
	
	
	@GetMapping("/compliment_detail_view")
	public String complimentDetailView(
			HttpServletRequest request
			, @RequestParam("postId") int postId
			, Model model) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Post post = postBO.getPost(userId, postId);
		List<ComplimentDetail> ComplimentDetailList = complimentBO.getCompliment(userId, postId);
		List<WishList> wishList = wishListBO.getWishList(userId, postId);
		
		
		model.addAttribute("post", post);
		model.addAttribute("compliment", ComplimentDetailList);
		model.addAttribute("wishList", wishList);
		
		
		return "post/complimentDetailView";
	}
}
