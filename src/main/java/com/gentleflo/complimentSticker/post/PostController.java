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
import com.gentleflo.complimentSticker.post.model.PostDetail;
import com.gentleflo.complimentSticker.post.stickerBoard.bo.StickerBoardBO;
import com.gentleflo.complimentSticker.post.stickerBoard.model.StickerBoard;
import com.gentleflo.complimentSticker.post.stickerNumber.bo.StickerNumberBO;
import com.gentleflo.complimentSticker.post.stickerNumber.model.StickerNumber;
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
	@Autowired
	private StickerNumberBO stickerNumberBO;
	@Autowired 
	private StickerBoardBO stickerBoardBO;


	
	@GetMapping("/compliment_edit_view")
	public String complimentEdit(Model model) {
		List<StickerBoard> stickerBoardImgPathList = stickerBoardBO.getBoardImgStickerImg();
		model.addAttribute("stickerBoardImgPathList",stickerBoardImgPathList);
		return "post/complimentEdit";
	}
	
	
	@GetMapping("/compliment_preview")
	public String complimentPreview(
			@RequestParam("loginId") String loginId
			, HttpServletRequest request
			, Model model) {
		
	
		List<PostDetail> stickerBoardImgForPreview = postBO.getStickerBoardImgForPreview(loginId);
		model.addAttribute("stickerBoardImgForPreview", stickerBoardImgForPreview);
		return "post/complimentPreview";
		// 클래스 만들기(post, 스티커판정보, gift)
	}
	
	
	@GetMapping("/compliment_detail_view")
	public String complimentDetailView(
			HttpServletRequest request
			, @RequestParam("postId") int postId
			, Model model) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		
		Post post = postBO.getPost(userId, postId);
		StickerBoard stickerBoard = stickerBoardBO.getBoardImgIdStickerImgId(post.getStickerBoardId());
		List<ComplimentDetail> complimentDetailList = complimentBO.getCompliment(userId, postId);
		List<WishList> wishList = wishListBO.getWishList(userId, postId);
		List<StickerNumber> stickerNumber = stickerNumberBO.getStickerNumber(postId);
		
		
		// 스티커 보드, 스티커 이미지들 select해와서 모델에 저장
		model.addAttribute("post", post);
		model.addAttribute("stickerBoard", stickerBoard);
		model.addAttribute("compliment", complimentDetailList);
		model.addAttribute("wishList", wishList);
		model.addAttribute("stickerNumber",stickerNumber);
		
		return "post/complimentDetailView";
	}
}
