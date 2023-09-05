package com.coolsound.order.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coolsound.order.dao.OrderMapper;
import com.coolsound.order.domain.Order;
import com.coolsound.order.domain.OrderProduct;
import com.coolsound.shop.bo.ProductBO;
import com.coolsound.shop.domain.Product;

@Service
public class OrderBO {
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private ProductBO productBO;
	
	@Transactional
	public int addOrder(int userId, int[] productId, int[] count, int[] orderPrice, int post, String address1, String address2, String request, int price) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("post", post);
		map.put("address1", address1);
		map.put("address2", address2);
		map.put("request", request);
		map.put("price", price);
		orderMapper.insertOrder(map);
		int orderId = Integer.valueOf(String.valueOf(map.get("id")));
		for (int i = 0; i < count.length; i++) {
			orderMapper.insertOrderProduct(orderId, productId[i], count[i], orderPrice[i]);
		}
		return 1;
	}
	
	public List<Order> getOrderList() {
		return orderMapper.selectOrderList();
	}
	
	public List<Product> getProductListById(int id) {
		List<Product> productList = new ArrayList<>();
		List<OrderProduct> opList = orderMapper.selectOrderProductListByOrderId(id);
		for (OrderProduct op : opList) {
			productList.add(productBO.getProductById(op.getProductId()));
		}
		return productList;
	}
	
	public void updateOrder(String state, int orderId) {
		orderMapper.updateOrder(state, orderId);
	}
}
