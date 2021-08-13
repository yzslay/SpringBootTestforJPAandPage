package com.petpet.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class OrderBean {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public float getProductCost() {
		return productCost;
	}

	public void setProductCost(float productCost) {
		this.productCost = productCost;
	}

	public float getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}

	public float getTax() {
		return tax;
	}

	public void setTax(float tax) {
		this.tax = tax;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public Date getDeliverDate() {
		return deliverDate;
	}

	public void setDeliverDate(Date deliverDate) {
		this.deliverDate = deliverDate;
	}

	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	public MockMemberBean getMockmember() {
		return mockmember;
	}

	public void setMockmember(MockMemberBean mockmember) {
		this.mockmember = mockmember;
	}

	public Set<OrderDetailBean> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetailBean> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Column(name = "order_address", nullable = true)
	private String address;
	
	private String membername;
	private Date ordertime;
	private float productCost;	
	private float subtotal;
	private float tax;
	private float shippongCost;
	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public float getShippongCost() {
		return shippongCost;
	}

	public void setShippongCost(float shippongCost) {
		this.shippongCost = shippongCost;
	}

	private float total;
	private  Date deliverDate;
	
	@Enumerated(EnumType.STRING)
	private PaymentMethod paymentMethod;
	
	@Enumerated(EnumType.STRING)
	private OrderStatus status;
	
	@ManyToOne
	@JoinColumn (name= "customer_id")
	private MockMemberBean mockmember;
	
	@OneToMany(mappedBy ="order",  cascade = {CascadeType.PERSIST, CascadeType.MERGE}  )
	private Set<OrderDetailBean> orderDetails = new HashSet<>();

	@Override
	public String toString() {
		return "OrderBean [id=" + id + ", address=" + address + ", membername=" + membername + ", ordertime="
				+ ordertime + ", productCost=" + productCost + ", subtotal=" + subtotal + ", tax=" + tax
				+ ", shippongCost=" + shippongCost + ", total=" + total + ", deliverDate=" + deliverDate
				+ ", paymentMethod=" + paymentMethod + ", status=" + status + ", mockmember=" + mockmember
				+ ", orderDetails=" + orderDetails + "]";
	}
	

	

}
