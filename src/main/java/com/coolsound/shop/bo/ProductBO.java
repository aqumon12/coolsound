package com.coolsound.shop.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coolsound.shop.dao.ProductMapper;
import com.coolsound.shop.domain.Product;

@Service
public class ProductBO {
	@Autowired
	private ProductMapper productMapper;
	
	public List<Product> getProductListByCategoryId(int categoryId) {
		return productMapper.selectProductListByCategoryId(categoryId);
	}
	
	public Product getProductById(int id) {
		return productMapper.selectProductById(id);
	}
	
}
