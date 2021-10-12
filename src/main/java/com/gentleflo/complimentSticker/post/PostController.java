package com.gentleflo.complimentSticker.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gentleflo.complimentSticker.post.bo.PostBO;

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
}
