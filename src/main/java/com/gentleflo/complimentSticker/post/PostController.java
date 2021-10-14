package com.gentleflo.complimentSticker.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gentleflo.complimentSticker.post.bo.PostBO;
import com.gentleflo.complimentSticker.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired 
	private PostBO postBO;

	
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
}
