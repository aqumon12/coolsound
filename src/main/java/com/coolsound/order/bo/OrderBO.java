package com.coolsound.order.bo;

import java.util.HashMap;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coolsound.order.dao.OrderMapper;

@Service
public class OrderBO {
	@Autowired
	private OrderMapper orderMapper;
	
	@Transactional
	public int addOrder(int userId, int[] productId, int count, int orderPrice, int post, String address1, String address2, String request, int price) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("post", post);
		map.put("address1", address1);
		map.put("address2", address2);
		map.put("request", request);
		map.put("price", price);
		orderMapper.insertOrder(map);
		
		// Order order = new Order();
		// order.setuserId("userId");
		return 1;
		
	}
}
