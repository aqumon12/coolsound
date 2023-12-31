package com.coolsound.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.coolsound.order.bo.OrderBO;

@RestController
@RequestMapping("/order")
public class OrderRestController {
	
	@Autowired
	private OrderBO orderBO;
	
	@PostMapping("/add_order")
	public Map<String, Object> addOrder(
			@RequestParam("productId") int[] productId,
			@RequestParam("count") int[] count,
			@RequestParam("orderPrice") int[] orderPrice,
			@RequestParam("post") int post,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2,
			@RequestParam(value = "request", required = false) String request,
			@RequestParam("price") int price,
			HttpSession session) {
		int userId  = (int)session.getAttribute("userId");
		orderBO.addOrder(userId, productId, count, orderPrice, post, address1, address2, request, price);
		Map<String, Object> result = new HashMap<>();
		
		result.put("code", 1);
		result.put("result", "성공");
		
		
		return result;
	}
	
	@PostMapping("/update_order")
	public Map<String, Object> updateOrder(
			@RequestParam("state") String state,
			@RequestParam("orderId") int orderId) {
		
		orderBO.updateOrder(state, orderId);
		Map<String, Object> result = new HashMap<>();
		
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
