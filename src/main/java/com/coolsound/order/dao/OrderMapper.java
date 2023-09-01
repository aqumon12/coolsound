package com.coolsound.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.coolsound.order.domain.Order;
import com.coolsound.order.domain.OrderProduct;

@Repository
public interface OrderMapper {

	public void insertOrder(Map<String, Object> map);
	public void insertOrderProduct(
			@Param("orderId") int orderId, 
			@Param("productId")  int productId, 
			@Param("count") int count, 
			@Param("orderPrice") int orderPrice);
	
	public List<Order> selectOrderList();
	
	public List<OrderProduct> selectOrderProductListByOrderId(int id);
}
