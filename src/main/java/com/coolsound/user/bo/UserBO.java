package com.coolsound.user.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coolsound.cart.bo.CartBO;
import com.coolsound.cart.domain.Cart;
import com.coolsound.cart.domain.CartView;
import com.coolsound.order.bo.OrderBO;
import com.coolsound.order.domain.Order;
import com.coolsound.order.domain.OrderView;
import com.coolsound.shop.bo.ProductBO;
import com.coolsound.user.dao.UserRepository;
import com.coolsound.user.entity.UserEntity;

@Service
public class UserBO {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CartBO cartBO;
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private OrderBO orderBO;
	
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
	
	public List<OrderView> generateOrderViewList() {
		List<OrderView> orderViewList = new ArrayList<>();
		
		List<Order> orderList = orderBO.getOrderList();
		for (Order order : orderList) {
			OrderView orderView = new OrderView();
			 order.getId();
			orderView.setOrder(order);
			userRepository.findById(order.getUserId());
			orderView.setUserEntity(userRepository.findById(order.getUserId()).orElse(null));
			orderViewList.add(orderView);
		}
		return orderViewList;
	}
}
