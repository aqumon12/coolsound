package com.coolsound.order.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Order {
	private int id;
	private int userId;
	private int post;
	private String address1;
	private String address2;
	private String request;
	private int price;
	private int deliveryFee;
	private String state;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
