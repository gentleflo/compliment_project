package com.gentleflo.complimentSticker.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	
	@GetMapping("/compliment_edit_view")
	public String complimentEdit() {
		return "post/complimentEdit";
	}
}
