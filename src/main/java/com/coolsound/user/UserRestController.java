package com.coolsound.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.coolsound.common.EncryptUtils;
import com.coolsound.user.bo.UserBO;
import com.coolsound.user.entity.UserEntity;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpSession session) {
		
		String hashedPassword = EncryptUtils.getSHA256(password);
		
		UserEntity userEntity = userBO.getUserEntityByLoginIdPassword(loginId, hashedPassword);
		
		Map<String, Object> result = new HashMap<>();
		if (userEntity != null) {
			session.setAttribute("userId", userEntity.getId());
			session.setAttribute("userName", userEntity.getName());
			
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 사용자입니다.");
		}
		return result;
	}
}
