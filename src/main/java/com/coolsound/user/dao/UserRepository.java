package com.coolsound.user.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.coolsound.user.entity.UserEntity;
@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
	
	public UserEntity findByLoginIdAndPassword(String loginId, String password);
	
	public UserEntity findByLoginId(String loginId);
}
