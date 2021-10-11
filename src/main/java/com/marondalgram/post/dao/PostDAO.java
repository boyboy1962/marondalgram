package com.marondalgram.post.dao;

import org.springframework.stereotype.Repository;

import com.marondalgram.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(Post post);

}
