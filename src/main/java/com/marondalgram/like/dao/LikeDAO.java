package com.marondalgram.like.dao;

import org.springframework.stereotype.Repository;

import com.marondalgram.like.model.Like;

@Repository
public interface LikeDAO {

	Like checkPostLikedByUserIdAndPostId(Like like);

}
