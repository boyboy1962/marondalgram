package com.marondalgram.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.marondalgram.like.bo.LikeBO;

@RestController
@RequestMapping("/like")
public class LikeRestController {
	
	@Autowired
	private LikeBO BO;
	
	@GetMapping("/like_click")
	public Map<String, Object> likeClick(
				@RequestParam("postId") int postId
				, HttpServletRequest request
			){
		// user ID가저오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		// 결과 값을 준비합니다.
		Map<String, Object> result = new HashMap<>();
		
		// 만약 세션종료로 로그아웃이 되었다면 로그인 페이지로 보내기 위해 준비합니다.
		if (userId == null) {
			//이거 흠... 인터셉터에서 구현이 가능하지 않을까?
			result.put("result", "userIdIsNull");
			return result;
		}
		
		// DB에 like를 저장할 준비를 합니다.
		boolean likePost = BO.isPostLikedByUserIdAndPostId(userId, postId);
		
		if (likePost) {
			result.put("result", "like");
		} else {
			result.put("result", "dislike");
		}
		
		return result;
	}
}

