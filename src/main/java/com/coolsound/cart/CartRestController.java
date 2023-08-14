package com.coolsound.cart;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.coolsound.cart.bo.CartBO;

@RestController
@RequestMapping("/cart")
public class CartRestController {

	@Autowired
	private CartBO cartBO;
	
	@PostMapping("/add_to_cart")
	public Map<String, Object> addToCart(
			@RequestParam("productId") int productId,
			@RequestParam("count") int count,	
			HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		Map<String, Object> result = new HashMap<>();
		if(userId != null) {
			cartBO.addCart(userId, productId, count);
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "로그인이 필요합니다.");
		}
		
		return result;
	}
	
	
}
