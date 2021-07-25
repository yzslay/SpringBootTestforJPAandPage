package com.petpet.upload;

import org.springframework.data.jpa.repository.JpaRepository;

import com.petpet.bean.ProductBean;

public interface ProductRepository extends JpaRepository<ProductBean, Integer>{
// 新建Repo繼承JpaRepository，就直接可以在Service使用方法來查詢資料庫
	}

