package com.marondalgram.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping("/login_view")
	public String login(Model model) {
		
		model.addAttribute("viewName", "user/login");
		
		return "template/layoutUser";
	}
	
	@RequestMapping("sign_up_view")
	public String signIn(Model model) {
		
		model.addAttribute("viewName", "user/signUp");
		
		return "template/layoutUser";
	}
}
