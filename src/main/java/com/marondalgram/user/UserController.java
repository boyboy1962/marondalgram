package com.marondalgram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userLoginId");
		return "redirect:/user/login_view";
	}
}
