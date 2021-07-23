package com.petpet.upload;

import org.springframework.data.jpa.repository.JpaRepository;

import com.petpet.bean.ProductBean;

public interface ProductRepository extends JpaRepository<ProductBean, Integer>{

	}

