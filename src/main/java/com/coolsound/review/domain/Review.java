package com.coolsound.review.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Review {
	private int id;
	private int userId;
	private int productId;
	private String content;
	private int rate;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
