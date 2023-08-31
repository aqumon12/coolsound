package com.coolsound.order.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface OrderMapper {

	public void insertOrder(Map<String, Object> map);
	
}
