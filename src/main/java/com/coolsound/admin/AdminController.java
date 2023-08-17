package com.coolsound.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coolsound.shop.bo.ProductBO;
import com.coolsound.shop.domain.Product;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private ProductBO productBO;
	
	@GetMapping("/sign_in_view")
	public String adSignInView(Model model) {
		model.addAttribute("view", "admin/signIn");
		return "template/adminLayout";
	}
	
	@GetMapping("/main_view")
	public String adMainView(Model model) {
		model.addAttribute("view", "admin/main");
		return "template/adminLayout";
	}
	
	@GetMapping("/product_list_view")
	public String adProductListView(Model model) {
		List<Product> productList = productBO.getProductListByCategoryId(null);
		model.addAttribute("productList", productList);
		model.addAttribute("view", "admin/productList");
		return "template/adminLayout";
	}
	
	@GetMapping("/add_product_view")
	public String adAddProductView(Model model) {
		model.addAttribute("view", "admin/addProduct");
		return "template/adminLayout";
	}
	
	@GetMapping("/order_list_view")
	public String adOrderListView(Model model) {
		model.addAttribute("view", "admin/orderList");
		return "template/adminLayout";
	}
}
