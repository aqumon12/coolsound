package com.coolsound.order.domain;

import lombok.Data;

@Data
public class OrderProduct {
	private int id;
	private int orderId;
	private int productId;
	private int count;
	private int price;
}
