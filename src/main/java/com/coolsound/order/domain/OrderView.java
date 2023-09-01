package com.coolsound.order.domain;

import java.util.List;

import com.coolsound.shop.domain.Product;
import com.coolsound.user.entity.UserEntity;

import lombok.Data;

@Data
public class OrderView {
	
	private Order order;
	
	private UserEntity userEntity;
	
	private List<Product> productList;
}
