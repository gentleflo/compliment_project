package com.gentleflo.complimentSticker.post.compliment.bo;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.complimentSticker.post.compliment.dao.ComplimentDAO;
import com.gentleflo.complimentSticker.post.compliment.model.Compliment;


@Service
public class ComplimentBO {
	@Autowired
	private ComplimentDAO complimentDAO;
	
	public int addCompliment(int userId, String loginId, int postId, String compliment) {
		
		// '/' 기준으로 칭찬 내용을 끊어주고
		String[] splitCompliment = compliment.split("/"); 
		// 끊어주어 배열형태로 저장되어 있는 칭찬 내용 배열을 리스트에 저장해준다!
		List<String> complimentContentList = Arrays.asList(splitCompliment);
		
		List<Compliment> complimentList = new ArrayList<>();
		
		for(String complimentContent : complimentContentList) {
			Compliment element = new Compliment();
			element.setUserId(userId);
			element.setLoginId(loginId);
			element.setPostId(postId);
			element.setCompliment(compliment);
			complimentList.add(element);
		}
		
		complimentDAO.insertCompliment(userId, loginId, postId, complimentContent);
				
	}
}