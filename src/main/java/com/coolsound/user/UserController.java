package com.coolsound.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coolsound.cart.bo.CartBO;
import com.coolsound.cart.domain.Cart;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private CartBO cartBO;
	
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
	
	@GetMapping("/myPage_view")
	public String myPageView(Model model) {
		model.addAttribute("view", "user/myPage");
		return "template/layout";
	}
	
	@GetMapping("/order_history_view")
	public String orderHistoryView(Model model) {
		model.addAttribute("view", "user/orderHistory");
		return "template/layout";
	}
	
	@GetMapping("/cart_view")
	public String cartView(Model model, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		List<Cart> cartList = cartBO.getCartListByUserId(userId);
		model.addAttribute("cartList", cartList);
		model.addAttribute("view", "user/cart");
		return "template/layout";
	}
}
