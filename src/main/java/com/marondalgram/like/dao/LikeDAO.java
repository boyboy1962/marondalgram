package com.marondalgram.like.dao;

import org.springframework.stereotype.Repository;

import com.marondalgram.like.model.Like;

@Repository
public interface LikeDAO {

	Like selectLikePostByUserIdAndPostId(Like like);

	void updateLikePostByUserIdAndPostId(Like like);

	void insertLike(Like like);

}
