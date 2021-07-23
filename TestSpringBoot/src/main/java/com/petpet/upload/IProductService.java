package com.petpet.upload;

import java.util.List;
import java.util.Optional;

import com.petpet.bean.ProductBean;

public interface IProductService {

	void saveProductBean(ProductBean product);

	List<ProductBean> getAllActiveProducts();

	Optional<ProductBean> getProductById(int id);

	void deleteProduct(int id);

}
