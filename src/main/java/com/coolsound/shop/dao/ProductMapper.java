package com.coolsound.shop.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.coolsound.shop.domain.Product;

@Repository
public interface ProductMapper {
	public List<Product> selectProductListByCategoryId(Integer categoryId);
	
	public Product selectProductById(int id);
	
	public void insertProduct(
			@Param("name") String name,
			@Param("categoryId") int categoryId,
			@Param("artist") String artist,
			@Param("producer") String producer,
			@Param("price") int price,
			@Param("stock") int stock,
			@Param("releaseDate") Date releaseDate,
			@Param("detail") String detail,
			@Param("image1") String image1,
			@Param("image2") String image2);
	
	public List<Product> selectProductListByNameOrArtist(String search);
}
