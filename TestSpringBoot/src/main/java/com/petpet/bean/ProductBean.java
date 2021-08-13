package com.petpet.bean;

import java.util.Arrays;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@ToString  // 使用了Lombok，試作，請不要學習
@Setter 
@Getter
@Entity
@Table(name = "product")
public class ProductBean implements java.io.Serializable {
	@Transient //無視
	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "productid")
	private int productId;
	
	@Column(name = "productname", nullable = false)
	private String productName;
	
	@Column(name = "productdescription", nullable = true)
	private String productDescription;
	
	@Column(name = "productprice", nullable = false)
	private double productPrice;
	@Lob
	@Column(name = "productimage", nullable = true)
	private byte[] productImage;
	
	@Column(name = "createtime", nullable = false)
    private Date createTime;
	
	public ProductBean() {}
	
	

}
