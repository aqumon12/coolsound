package com.coolsound.shop.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.coolsound.common.FileManagerService;
import com.coolsound.shop.dao.ProductMapper;
import com.coolsound.shop.domain.Product;

@Service
public class ProductBO {
	
	@Autowired
	private FileManagerService fileManager;
	
	@Autowired
	private ProductMapper productMapper;
	
	public List<Product> getProductListByCategoryId(Integer categoryId) {
		return productMapper.selectProductListByCategoryId(categoryId);
	}
	
	public Product getProductById(int id) {
		return productMapper.selectProductById(id);
	}
	
	public void addProduct(String loginId, String name, int categoryId, String artist, String producer, int price, int stock, Date releaseDate, String detail, MultipartFile image1, MultipartFile image2) {
		String imagePath1 = fileManager.saveFile(loginId, image1);
		String imagePath2 = null;
		if (image2 != null) {
			imagePath2 = fileManager.saveFile(loginId, image2);
		}
		productMapper.insertProduct(name, categoryId, artist, producer, price, stock, releaseDate, detail, imagePath1, imagePath2);
	}
}
