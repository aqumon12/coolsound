package com.coolsound.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.coolsound.admin.bo.AdminBO;
import com.coolsound.admin.entity.AdminEntity;
import com.coolsound.common.EncryptUtils;
import com.coolsound.shop.bo.ProductBO;

@RestController
@RequestMapping("/admin")
public class AdminRestController {
	
	@Autowired
	private AdminBO adminBO;
	
	@Autowired
	private ProductBO productBO;
	
	@PostMapping("/sign_in")
	public Map<String, Object> adSignIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpSession session) {
		String hashedPassword = EncryptUtils.getSHA256(password);
		AdminEntity adminEntity = adminBO.getAdminEntityByLoginIdPassword(loginId, hashedPassword);
		
		Map<String, Object> result = new HashMap<>();
		if (adminEntity != null) {
			session.setAttribute("userId", adminEntity.getId());
			session.setAttribute("userName", adminEntity.getName());
				
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 관리자입니다.");
		}
	
		return result;
	}
	

}
