package com.marondalgram.timeline;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marondalgram.post.bo.PostBO;
import com.marondalgram.post.model.Post;
import com.marondalgram.timeline.bo.TimelineBO;
import com.marondalgram.timeline.model.Content;

@Controller
@RequestMapping("/post")
public class TimelineController {
	
	@Autowired
	private TimelineBO timelineBO; 
	
	@RequestMapping("/post_timeline_view")
	public String postCreateView (HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		// 글 목록을 가져온다.
		List<Content> contentList = timelineBO.createCardList(userId);
		
		model.addAttribute("contentList", contentList);
		
		return "template/layoutPost";
	}
	
}
