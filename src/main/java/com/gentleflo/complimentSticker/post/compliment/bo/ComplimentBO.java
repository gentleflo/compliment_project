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
		// 끊어주어 배열형태로 저장되어 있는 칭찬 내용 배열을 리스트로 변환시켜 저장해준다
		List<String> complimentContentList = Arrays.asList(splitCompliment);
		
		// Compliment 모델을 리스트로 받아와서 새로운 리스트를 만들어준다
		List<Compliment> complimentList = new ArrayList<>();
		
		// 쪼개진 칭찬의 내용 한개당 하나의 셋트?같은 리스트를 만들어주기 위해서 반복문을 통해서 칭찬 내용뿐만 아니라 userId, loginId, postId도 넣어준다
		// xml에서 insert에 반복문을 돌려주기 위해서 
		for(String complimentContent : complimentContentList) {
			Compliment element = new Compliment();
			element.setUserId(userId);
			element.setLoginId(loginId);
			element.setPostId(postId);
			element.setCompliment(complimentContent);
			complimentList.add(element);
		}
			return complimentDAO.insertCompliment(complimentList);
	}
	
	public List<Compliment> getCompliment(int userId, int postId) {
		return complimentDAO.selectComplimentByUserIdPostId(userId, postId);
	}
}