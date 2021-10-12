package com.marondalgram.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.like.dao.LikeDAO;
import com.marondalgram.like.model.Like;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public Like findPostLikedByUserIdAndPostId(Integer userId, int postId) {
	
		Like likeInput = new Like();
		likeInput.setUserId(userId);
		likeInput.setPostId(postId);
		
		return likeDAO.selectLikePostByUserIdAndPostId(likeInput);
	}

	public boolean isPostLikedByUserIdAndPostId(Integer userId, int postId) {
		
		Like likeInput = new Like();
		likeInput.setUserId(userId);
		likeInput.setPostId(postId);
		
		Like likeFound = new Like();
		likeFound = likeDAO.selectLikePostByUserIdAndPostId(likeInput);
		
		if (likeFound == null) {
			likeInput.setLikePost(1);
			likeDAO.insertLike(likeInput);
			return true;
		} else if (likeFound.getLikePost() == 0) {
			likeInput.setLikePost(1);
			likeDAO.updateLikePostByUserIdAndPostId(likeInput);
			return true;
		} else if (likeFound.getLikePost() == 1) {
			likeInput.setLikePost(0);
			likeDAO.updateLikePostByUserIdAndPostId(likeInput);
			return false;
		} 
		
		return false;
	}

}
