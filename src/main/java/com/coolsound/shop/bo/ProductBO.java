package com.coolsound.shop.bo;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.coolsound.common.FileManagerService;
import com.coolsound.shop.dao.ProductMapper;
import com.coolsound.shop.domain.Product;

@Service
public class ProductBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	
	public void addProduct(String adminLoginId, String name, int categoryId, String artist, String producer, int price, int stock, Date releaseDate, String detail, MultipartFile image1, MultipartFile image2) {
		String imagePath1 = fileManager.saveFile(adminLoginId, image1);
		String imagePath2 = null;
		if (image2 != null) {
			imagePath2 = fileManager.saveFile(adminLoginId, image2);
		}
		productMapper.insertProduct(name, categoryId, artist, producer, price, stock, releaseDate, detail, imagePath1, imagePath2);
	}
	
	public List<Product> getProductListByNameOrArtist(String search) {
		return productMapper.selectProductListByNameOrArtist(search);
	}
	
	public void updateProduct(int id, String adminLoginId, String name, int categoryId, String artist, String producer, int price, int stock, Date releaseDate, String detail, MultipartFile image1, MultipartFile image2) {
				Product product = productMapper.selectProductById(id);
				if (product == null) {
					logger.warn("###[상품수정] product is null. id:{}", id);
					return;
				}
				String imagePath1 = null;
				String imagePath2 = null;
				
				if (image1 != null) {
					imagePath1 = fileManager.saveFile(adminLoginId, image1);
					
					if (imagePath1 != null && product.getImage1() != null) {
						fileManager.deleteFile(product.getImage1());
					}
				}
				if (image2 != null) {
					imagePath2 = fileManager.saveFile(adminLoginId, image2);
					
					if (imagePath2 != null && product.getImage2() != null) {
						fileManager.deleteFile(product.getImage2());
					}
				}
				// 글 업데이트
				productMapper.updateProduct(id, name, categoryId, artist, producer, price, stock, releaseDate, detail, imagePath1, imagePath2);
	}
}
