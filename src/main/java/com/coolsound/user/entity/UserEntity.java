package com.coolsound.user.entity;

import java.time.ZonedDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name="user")
@Getter
@Entity
public class UserEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="loginId")
	private String loginId;
	
	private String password;
	
	private String name;
	
	private String email;
	
	private int tel;
	
	private int post;
	
	private String address1;
	
	private String address2;
	
	@Column(name="createdAt", updatable = false)
	@UpdateTimestamp
	private ZonedDateTime createdAt;
	
	@Column(name="updatedAt")
	@UpdateTimestamp
	private ZonedDateTime updatedAt;
}
