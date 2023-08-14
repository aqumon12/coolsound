package com.coolsound.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.coolsound.cart.domain.Cart;

@Repository
public interface CartMapper {
	public void insertCart(
			@Param("userId") int userId,
			@Param("productId") int productId,
			@Param("count") int count);
	
	public List<Cart> selectCartListByUserId(int userId);
	
	public void updateCart(
			@Param("userId") int userId,
			@Param("productId") int productId,
			@Param("count") int count);
	
	public void deleteCartById(int cartId);
}

