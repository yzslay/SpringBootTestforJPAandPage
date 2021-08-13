package com.petpet.order;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.petpet.bean.OrderBean;


@Repository("OrderRepository")
public interface OrderRepository extends JpaRepository<OrderBean,Integer> {
	public Page<OrderBean> findAll(Pageable pageable);
	

}
