package com.coolsound.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@GetMapping("/sign_out")
	public String signOut(HttpSession session,
			Model model) {
		session.removeAttribute("adminId");
		session.removeAttribute("adminLoginId");
		session.removeAttribute("adminName");
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
	
	@GetMapping("/update_product_view")
	public String adUpdateProductView(
			@RequestParam("id") int id,
			Model model) {
		model.addAttribute("product", productBO.getProductById(id));
		return "admin/updateProduct";
	}
}
