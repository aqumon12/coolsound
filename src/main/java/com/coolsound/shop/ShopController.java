package com.coolsound.shop;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@GetMapping("/main_view")
	public String mainView(Model model) {
		model.addAttribute("view", "shop/main");
		return "template/layout";
	}
}
