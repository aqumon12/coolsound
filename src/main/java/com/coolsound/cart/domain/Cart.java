package com.coolsound.cart.domain;

import java.time.ZonedDateTime;

import lombok.Data;
@Data
public class Cart {
	private int id;
	private int userId;
	private int productId;
	private int count;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
	
}
