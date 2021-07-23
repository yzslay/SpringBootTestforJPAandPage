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
		productRepository.save(product);	
	}

	@Override
	public List<ProductBean> getAllActiveProducts() {
		return productRepository.findAll();
	}

	@Override
	public Optional<ProductBean> getProductById(int id) {
		return productRepository.findById(id);
	}
	
	@Override
	public void deleteProduct(int id) {
		productRepository.deleteById(id);	
	}


}
