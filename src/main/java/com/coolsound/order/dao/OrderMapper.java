package com.coolsound.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.coolsound.cart.domain.CartView;

@Repository
public interface OrderMapper {

	public void insertOrder(Map<String, Object> map);
	public void insertOrderProduct(int userId, List<CartView> prdList);
	
}
