package com.coolsound.shop;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coolsound.shop.bo.ProductBO;
import com.coolsound.shop.domain.Product;
import com.coolsound.user.bo.UserBO;
import com.coolsound.user.domain.CartView;
import com.coolsound.user.entity.UserEntity;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private UserBO userBO;
	
	@GetMapping("/main_view")
	public String mainView(Model model) {
		List<Product> productList = productBO.getProductListByCategoryId(null);
		model.addAttribute("productList", productList);
		model.addAttribute("view", "shop/main");
		return "template/layout";
	}
	
	@GetMapping("/category_view")
	public String categoryView(
			@RequestParam(value = "categoryId", required = false) Integer categoryId,
			Model model) {
		List<Product> productList = productBO.getProductListByCategoryId(categoryId);
		model.addAttribute("view", "shop/category");
		model.addAttribute("productList", productList);
		return "template/layout";
	}
	
	@GetMapping("/detail_view")
	public String detailView(
			@RequestParam("id") int id,
			Model model) {
		Product product = productBO.getProductById(id);
		model.addAttribute("product", product);
		model.addAttribute("view", "shop/detail");
		return "template/layout";
	}
	
	@GetMapping("/search_view")
	public String searchView(
			@RequestParam("search") String search,
			Model model) {
		List<Product> productList = productBO.getProductListByNameOrArtist(search);
		model.addAttribute("productList", productList);
		model.addAttribute("view", "shop/search");
		return "template/layout";
	}
	
	@GetMapping("/order_view")
	public String orderView(HttpSession session, Model model) {
		int userId = (int)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		List<CartView> list = userBO.generateCartViewList(userId);
		UserEntity userEntity = userBO.getUserEntityByLoginId(userLoginId);
		model.addAttribute("userEntity", userEntity);
		model.addAttribute("list", list);
		model.addAttribute("view", "shop/order");
		return "template/layout";
	}
	
	@GetMapping("/order_complete_view")
	public String reviewView(Model model) {
		model.addAttribute("view", "shop/orderComplete");
		return "template/layout";
	}
}
