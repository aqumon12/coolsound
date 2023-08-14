package com.coolsound.user.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coolsound.cart.bo.CartBO;
import com.coolsound.cart.domain.Cart;
import com.coolsound.shop.bo.ProductBO;
import com.coolsound.user.dao.UserRepository;
import com.coolsound.user.domain.CartView;
import com.coolsound.user.entity.UserEntity;

@Service
public class UserBO {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CartBO cartBO;
	
	@Autowired
	private ProductBO productBO;
	
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
	
	public List<CartView> generateCartViewList(int userId) {
		List<CartView> cartViewList = new ArrayList<>();
		
		List<Cart> cartList = cartBO.getCartListByUserId(userId);
		for (Cart cart : cartList) {
			
			CartView cartView = new CartView();
			
			cartView.setCart(cart);
			cartView.setProduct(productBO.getProductById(cart.getProductId()));
			cartViewList.add(cartView);
		}
		return cartViewList;
	}
}
