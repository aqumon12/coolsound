package com.coolsound.admin.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coolsound.admin.dao.AdminRepository;
import com.coolsound.admin.entity.AdminEntity;

@Service
public class AdminBO {

	@Autowired
	private AdminRepository adminRepository;
	
	public AdminEntity getAdminEntityByLoginIdPassword(String loginId, String password) {
		return adminRepository.findByLoginIdAndPassword(loginId, password);
	}
}
