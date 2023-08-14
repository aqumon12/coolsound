package com.coolsound.shop.domain;

import java.time.ZonedDateTime;
import java.util.Date;

import lombok.Data;
@Data
public class Product {
	private int id;
	private String name;
	private int categoryId;
	private String artist;
	private String producer;
	private int price;
	private String image1;
	private String image2;
	private String image3;
	private String detail;
	private Date releaseDate;
	private String stock;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
