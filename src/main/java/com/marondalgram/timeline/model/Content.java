package com.marondalgram.timeline.model;

import com.marondalgram.like.model.Like;
import com.marondalgram.post.model.Post;

public class Content {
	private Post post;
	private Like like;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public Like getLike() {
		return like;
	}
	public void setLike(Like like) {
		this.like = like;
	}
	
}
