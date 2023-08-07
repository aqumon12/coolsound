package com.coolsound.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.coolsound.shop.domain.Product;

@Repository
public interface ProductMapper {
	public List<Product> selectProductListByCategoryId(int categoryId);
	
	public Product selectProductById(int id);
}
