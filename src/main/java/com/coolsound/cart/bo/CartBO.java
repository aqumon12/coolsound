package com.coolsound.cart.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coolsound.cart.dao.CartMapper;
import com.coolsound.cart.domain.Cart;

@Service
public class CartBO {

	@Autowired
	private CartMapper cartMapper;
	
	public void addCart(int userId, int productId, int count) {
		cartMapper.insertCart(userId, productId, count);
	}
	
	public List<Cart> getCartListByUserId(int userId) {
		return cartMapper.selectCartListByUserId(userId);
	}
	
	public void updateCart(int userId, int productId, int count) {
		cartMapper.updateCart(userId, productId, count);
	}
	
	public void deleteCartById(int cartId) {
		cartMapper.deleteCartById(cartId);
	}
}
