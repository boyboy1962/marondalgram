package com.marondalgram.timeline.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.like.bo.LikeBO;
import com.marondalgram.like.model.Like;
import com.marondalgram.post.bo.PostBO;
import com.marondalgram.post.model.Post;
import com.marondalgram.timeline.model.Content;

@Service
public class TimelineBO {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private LikeBO likeBO;

	public List<Content> createCardList(Integer userId) {
		List<Post> postList = postBO.getPostList();
		
		List<Content> contentList = new ArrayList<Content>();
		for (Post post : postList) {
			Content content = new Content();
			content.setPost(post);
			Like like = likeBO.findPostLikedByUserIdAndPostId(userId, content.getPost().getId());
			content.setLike(like);
			
			
			
			contentList.add(content);
		}
		return contentList;
	}	
	
}
