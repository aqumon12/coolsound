package com.coolsound.order.bo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coolsound.cart.domain.CartView;
import com.coolsound.order.dao.OrderMapper;

@Service
public class OrderBO {
	@Autowired
	private OrderMapper orderMapper;
	
	@Transactional
	public int addOrder(int userId, List<CartView> prdList, int post, String address1, String address2, String request, int price) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("post", post);
		map.put("address1", address1);
		map.put("address2", address2);
		map.put("request", request);
		map.put("price", price);
		orderMapper.insertOrder(map);
		int orderId = (int)map.get("id");
		orderMapper.insertOrderProduct(orderId, prdList);
		// Order order = new Order();
		// order.setuserId("userId");
		return 1;
		
	}
}
