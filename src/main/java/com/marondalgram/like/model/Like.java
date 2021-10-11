package com.marondalgram.like.model;

import java.util.Date;

public class Like {
	private int postId;
	private int userId;
	private Date createdAt;
	private int likePost;
	private Date updatedAt;
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public int getLikePost() {
		return likePost;
	}
	public void setLikePost(int likePost) {
		this.likePost = likePost;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	

}
