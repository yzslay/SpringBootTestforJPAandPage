package com.petpet.order;

import java.util.Date;
import java.util.NoSuchElementException;

import org.hibernate.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petpet.bean.MockMemberBean;
import com.petpet.bean.OrderBean;
import com.petpet.bean.OrderDetailBean;
import com.petpet.bean.OrderStatus;
import com.petpet.bean.PaymentMethod;
import com.petpet.bean.ProductBean;
import com.petpet.event.MockMemberRepository;
import com.petpet.upload.ProductRepository;


@Service("OrderBeanService")
@Transactional
public class OrderService {

	@Autowired 
	private OrderRepository orderRepository;
	@Autowired
	private MockMemberRepository mockMemberRepository;
	@Autowired
	private ProductRepository productRepository;

	public void addNewOrder(){
		MockMemberBean member = mockMemberRepository.findById((long)10002).orElse(null) ;
		ProductBean product = productRepository.findById(35).orElse(null);
		OrderBean order =new OrderBean();
		order.setOrdertime(new Date( ));
		order.setMockmember(member);
		order.setMembername(member.getUserName());
		order.setShippongCost(10);
		order.setProductCost((float)product.getProductPrice());
		order.setTax(0);
		order.setSubtotal((float)product.getProductPrice());
		order.setTotal((float)product.getProductPrice()+10);
		order.setPaymentMethod(PaymentMethod.CREDIT_CARD);
		order.setStatus(OrderStatus.NEW);
		order.setDeliverDate(new Date());
		order.setAddress(member.getAddress());
		
		OrderDetailBean orderdetail = new OrderDetailBean();
		orderdetail.setProduct(product);
		orderdetail.setOrder(order);
		orderdetail.setProductCost((float)product.getProductPrice());
		orderdetail.setShippongCost(10);
		orderdetail.setQuantity(3);
		orderdetail.setSubtotal((float)product.getProductPrice());
		orderdetail.setUnitPrice((float)product.getProductPrice());
		
		order.getOrderDetails().add(orderdetail);
		OrderBean saveorder =  orderRepository.save(order);
	
				
	}
	public void listOrder(){
		Iterable<OrderBean> order= orderRepository.findAll();
		order.forEach(System.out::println);
		
	}
	
	public Page<OrderBean> orderQueryAllPage(int pageNum, String sortField, String sortDir){
		int pageSize = 8;
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize,
				  sortDir.equals("asc") ? Sort.by(sortField).ascending()
                          : Sort.by(sortField).descending()
                          );//因為由0開始
		return orderRepository.findAll(pageable);
	};
	
	public OrderBean get(Integer id ) throws NoSuchElementException{
		try {
			return orderRepository.findById(id).get();
		}catch (NoSuchElementException ex) {
			throw new NoSuchElementException(id+"is not found");
		}
	}
	
}
