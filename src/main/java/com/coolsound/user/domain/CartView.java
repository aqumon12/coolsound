package com.coolsound.user.domain;

import com.coolsound.cart.domain.Cart;
import com.coolsound.shop.domain.Product;

import lombok.Data;

@Data
public class CartView {
	private Product product;
	
	private Cart cart;
}
