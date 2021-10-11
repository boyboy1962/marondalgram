package com.marondalgram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@RequestMapping("/create")
	public Map<String, Object> create(
				@RequestParam("content") String content
				, @RequestParam(value = "file", required = false) MultipartFile file
				, HttpServletRequest request
			){
		// 유저 정보를 불러옴니다.
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String userLoginId = (String) session.getAttribute("userLoginId");
		String userName = (String) session.getAttribute("userName"); 
		
		// 결과 값을 준비합니다.
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// 만약 세션종료로 로그아웃이 되었다면 로그인 페이지로 보내기 위해 준비합니다.
		if (userId == null) {
			//이거 흠... 인터셉터에서 구현이 가능하지 않을까?
			result.put("result", "userIdIsNull"); 
		}
		
		// DB에 저장을 준비하기 위해 BO로 보냄니다.
		int row = postBO.createPost(userId, userLoginId, userName, content, file);
		
		if (row != 1) {
			result.put("result", "error");
		}
		
		return result;
	}
}
