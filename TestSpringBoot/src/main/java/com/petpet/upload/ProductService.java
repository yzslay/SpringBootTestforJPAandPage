package com.petpet.upload;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpet.bean.ProductBean;

@Service("ProductService")
public class ProductService  implements IProductService{
	
	
	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public void saveProductBean(ProductBean product) { 
		productRepository.save(product);	 // 由於在ProductRepository有繼承JpaRepository方法，這邊就可以直接使用方法
	}

	@Override
	public List<ProductBean> getAllActiveProducts() {
		return productRepository.findAll();  // 由於在ProductRepository有繼承JpaRepository方法，這邊就可以直接使用方法
	}

	@Override
	public Optional<ProductBean> getProductById(int id) {
		return productRepository.findById(id); // 由於在ProductRepository有繼承JpaRepository方法，這邊就可以直接使用方法
	}
	
	@Override
	public void deleteProduct(int id) {
		productRepository.deleteById(id);	// 由於在ProductRepository有繼承JpaRepository方法，這邊就可以直接使用方法
	}
	
	


}
