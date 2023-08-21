package com.coolsound.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
	
	@PostMapping("add_product")
	public Map<String, Object> addProduct(
			@RequestParam("name") String name,
			@RequestParam("categoryId") int categoryId,
			@RequestParam("artist") String artist,
			@RequestParam("producer") String producer,
			@RequestParam("price") int price,
			@RequestParam("stock") int stock,
			@RequestParam("releaseDate") Date releaseDate,
			@RequestParam("detail") String detail,
			@RequestParam("image1") MultipartFile image1,
			@RequestParam(value = "image2", required = false) MultipartFile image2,
			HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		productBO.addProduct(loginId, name, categoryId, artist, producer, price, stock, releaseDate, detail, image1, image2);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}

}
