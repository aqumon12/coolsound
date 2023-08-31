package com.coolsound.cart.domain;

import com.coolsound.shop.domain.Product;

import lombok.Data;

@Data
public class CartView {
	private Product product;
	
	private Cart cart;
}
