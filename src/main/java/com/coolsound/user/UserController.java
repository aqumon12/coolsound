package com.coolsound.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@GetMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("view", "user/signUp");
		return "template/layout";
	}
	
	@GetMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("view", "user/signIn");
		return "template/layout";
	}
	
	@GetMapping("/sign_out")
	public String signOut(HttpSession session,
			HttpServletRequest request) {
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
	@PostMapping("/myPage_view")
	public String myPageView(Model model) {
		model.addAttribute("view", "user/myPage");
		return "template/layout";
	}
	
	@GetMapping("/order_history_view")
	public String orderHistoryView(Model model) {
		model.addAttribute("view", "user/orderHistory");
		return "template/layout";
	}
}
