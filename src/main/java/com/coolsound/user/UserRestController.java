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
import com.coolsound.order.bo.OrderBO;
import com.coolsound.order.domain.Order;
import com.coolsound.user.bo.UserBO;
import com.coolsound.user.entity.UserEntity;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private OrderBO orderBO;
	
	/**
	 * 로그인API
	 * @param loginId
	 * @param password
	 * @param session
	 * @return
	 */
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
			session.setAttribute("userLoginId", userEntity.getLoginId());
			session.setAttribute("userName", userEntity.getName());
			
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 사용자입니다.");
		}
		return result;
	}
	
	/**
	 * ID 중복확인 API
	 * @param loginId
	 * @return
	 */
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		UserEntity userEntity = userBO.getUserEntityByLoginId(loginId);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("isDuplicateId", false);
		
		if (userEntity != null) {
			result.put("isDuplicateId", true);
		}
		return result;
	}
	/**
	 * 회원가입 API
	 * @param name
	 * @param loginId
	 * @param password
	 * @param email
	 * @param post
	 * @param address1
	 * @param address2
	 * @param tel
	 * @return
	 */
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("name") String name,
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("email") String email,
			@RequestParam("post") int post,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2,
			@RequestParam("tel") String tel) {
		
		String hashedPassword = EncryptUtils.getSHA256(password);
		
		Integer userId = userBO.addUser(name, loginId, hashedPassword, email, post, address1, address2, tel);
		Map<String, Object> result = new HashMap<>();
		if (userId != null) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "회원가입에 실패했습니다.");
		}
		
		return result;
	}
	
	@PostMapping("/add_order")
	public Map<String, Object> addOrder(
			@RequestParam("post") int post,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2,
			@RequestParam(value = "request", required = false) String request,
			@RequestParam("price") int price,
			HttpSession session) {
		int userId  = (int)session.getAttribute("userId");
		orderBO.addOrder(userId, post, address1, address2, request, price);
		
		Map<String, Object> result = new HashMap<>();
	
		result.put("code", 1);
		result.put("result", "성공");
		
		
		return result;
	}
}
