package com.coolsound.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.coolsound.shop.bo.ProductBO;

@RestController
@RequestMapping("/shop")
public class ShopRestController {
	
	@Autowired
	private ProductBO productBO;
	
	
}
