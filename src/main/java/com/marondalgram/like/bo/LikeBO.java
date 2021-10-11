package com.marondalgram.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.like.dao.LikeDAO;
import com.marondalgram.like.model.Like;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;

	public boolean isPostLikedByUserIdAndPostId(Integer userId, int postId) {
		
		Like like = new Like();
		like.setUserId(userId);
		like.setPostId(postId);
		
		Like likedPost = likeDAO.checkPostLikedByUserIdAndPostId(like);
		
		
		
		
		return false;
	}

}
