
//package com.petpet.bean;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Table;
//import javax.persistence.Transient;
//
//import org.springframework.data.annotation.Id;
//import org.springframework.stereotype.Component;
//
//
//
//@Entity
//@Table(name = "mockmember")
//@Component("memberbean")
//public class MemberBean implements java.io.Serializable {
//	@Transient //無視
//	private static final long serialVersionUID = 1L;
//	
//		@Id
//	    @GeneratedValue(strategy = GenerationType.IDENTITY)
//	    @Column(name="memberid")
//	    private Long memberId;
//	 	@Column(name="user_name")
//	    private String userName;
//
// 	 @ManyToMany(targetEntity = EventBean.class, cascade = CascadeType.ALL)
// 	 @JoinTable( name = "member_event",
// 	 			joinColumns = {@JoinColumn(name = "Member_id", referencedColumnName = "user_id")},
//	
//	
//
//}
