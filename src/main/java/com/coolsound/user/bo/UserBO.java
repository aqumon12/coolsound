package com.coolsound.user.bo;

import javax.websocket.ClientEndpointConfig.Builder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.info.ProjectInfoProperties.Build;
import org.springframework.stereotype.Service;

import com.coolsound.user.dao.UserRepository;
import com.coolsound.user.entity.UserEntity;

@Service
public class UserBO {
	
	@Autowired
	private UserRepository userRepository;
	
	public UserEntity getUserEntityByLoginIdPassword(String loginId, String password) {
		return userRepository.findByLoginIdAndPassword(loginId, password);
	};
	
	public UserEntity getUserEntityByLoginId(String loginId) {
		return userRepository.findByLoginId(loginId);
	}
	
	public Integer addUser(String name, String loginId, String password, String email, int post, String address1, String address2, String tel) {
		UserEntity userEntity = userRepository.save(
				UserEntity.builder()
				.name(name)
				.loginId(loginId)
				.password(password)
				.email(email)
				.post(post)
				.address1(address1)
				.address2(address2)
				.tel(tel)
				.build());
		return userEntity == null ? null : userEntity.getId();
	}
}
