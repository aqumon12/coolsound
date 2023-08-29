package com.coolsound.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coolsound.shop.bo.ProductBO;
import com.coolsound.shop.domain.Product;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private ProductBO productBO;
	
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
}
