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
import com.gentleflo.complimentSticker.post.like.bo.LikeBO;
import com.gentleflo.complimentSticker.post.model.Post;
import com.gentleflo.complimentSticker.post.model.PostDetail;
import com.gentleflo.complimentSticker.post.stickerBoard.bo.StickerBoardBO;
import com.gentleflo.complimentSticker.post.stickerBoard.model.StickerBoard;
import com.gentleflo.complimentSticker.post.stickerNumber.bo.StickerNumberBO;
import com.gentleflo.complimentSticker.post.stickerNumber.model.StickerNumber;
import com.gentleflo.complimentSticker.post.wishList.bo.WishListBO;
import com.gentleflo.complimentSticker.post.wishList.model.WishListDetail;

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
	@Autowired
	private LikeBO likeBO;



	
	@GetMapping("/compliment_edit_view")
	public String complimentEdit(Model model) {
		List<StickerBoard> stickerBoardImgPathList = stickerBoardBO.getBoardImgStickerImg();
		model.addAttribute("stickerBoardImgPathList",stickerBoardImgPathList);
		return "post/complimentEdit";
	}
	
	
	
	@GetMapping("/compliment_preview")
	public String complimentPreview(
			@RequestParam("loginId") String loginId
			, Model model) {
		
		List<PostDetail> postDetailForPreview = postBO.getPostDetail(loginId);
		model.addAttribute("postDetailForPreview", postDetailForPreview);
		return "post/complimentPreview";
	}
	
	
	@GetMapping("/compliment_detail_view")
	public String complimentDetailView(
			 @RequestParam("postId") int postId
			 , HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Post post = postBO.getPost(postId);
		StickerBoard stickerBoard = stickerBoardBO.getBoardImgIdStickerImgId(post.getStickerBoardId());
		List<ComplimentDetail> complimentDetailList = complimentBO.getCompliment(postId);
		List<WishListDetail> wishListDetailList = wishListBO.getWishList(postId);
		List<StickerNumber> stickerNumber = stickerNumberBO.getStickerNumber(postId);
		int countLike = likeBO.getCountLikeByPostId(postId);
		boolean isLike = likeBO.getLikeByUserIdPostId(userId, postId);
		
		// 스티커 보드, 스티커 이미지들 select해와서 모델에 저장
		model.addAttribute("post", post);
		model.addAttribute("stickerBoard", stickerBoard);
		model.addAttribute("compliment", complimentDetailList);
		model.addAttribute("wishList", wishListDetailList);
		model.addAttribute("stickerNumber",stickerNumber);
		model.addAttribute("isLike", isLike);
		model.addAttribute("countLike", countLike);
		
		return "post/complimentDetailView";
	}
	
}
