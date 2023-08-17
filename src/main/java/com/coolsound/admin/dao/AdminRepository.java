package com.coolsound.admin.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.coolsound.admin.entity.AdminEntity;

@Repository
public interface AdminRepository extends JpaRepository<AdminEntity, Integer>{
	public AdminEntity findByLoginIdAndPassword(String loginId, String password);
}
