package com.coolsound.order.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coolsound.order.dao.OrderMapper;

@Service
public class OrderBO {
	@Autowired
	private OrderMapper orderMapper;
	
	public void addOrder(int userId, int post, String address1, String address2, String request, int price) {
		orderMapper.insertOrder(userId, post, address1, address2, request, price);
	}
}
