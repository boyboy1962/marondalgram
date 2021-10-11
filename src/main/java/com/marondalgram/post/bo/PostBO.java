package com.marondalgram.post.bo;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.common.FileManagerService;
import com.marondalgram.post.dao.PostDAO;
import com.marondalgram.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManagerService;

	public int createPost(Integer userId, String userLoginId, String userName, String content, MultipartFile file) {
		
		Post post = new Post();
		
		String imgUrl = null;

		if (file != null) {
			// 이미지 변환하는 거 만들기 새로운 클라스를 만들어서 쓴다.
			try {
				imgUrl = fileManagerService.saveFile(userLoginId, file);
			} catch (IOException e) {
				imgUrl = null;
			}
		}
		
		post.setContent(content);
		post.setUserId(userId);
		post.setImgUrl(imgUrl);
		post.setUserName(userName);

		return postDAO.insertPost(post);
	}

	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}

}
