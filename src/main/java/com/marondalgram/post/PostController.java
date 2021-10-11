package com.marondalgram.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@RequestMapping("/post_timeline_view")
	public String postCreateView (Model model) {
		
		return "template/layoutPost";
	}
	
}
