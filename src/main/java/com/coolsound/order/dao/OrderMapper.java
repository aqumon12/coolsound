package com.coolsound.order.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderMapper {
	public void insertOrder(
			@Param("userId") int userId,
			@Param("post") int post,
			@Param("address1") String address1,
			@Param("address2") String address2,
			@Param("request") String request,
			@Param("price") int price);
}
