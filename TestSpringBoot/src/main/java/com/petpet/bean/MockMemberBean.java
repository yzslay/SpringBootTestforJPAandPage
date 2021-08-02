
package com.petpet.bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;



@Entity
@Table(name = "mockmember")
@Component("memberbean")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,	property = "memberId")
public class MockMemberBean implements java.io.Serializable {
	@Transient //無視
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="memberid")
    private Long memberId;
 	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Column(name="member_name")
    private String userName;
 	
 	
 	@ManyToMany(mappedBy = "members",targetEntity = EventBean.class, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
 	private List<EventBean> events = new ArrayList<>();
	
	 public List<EventBean> getEvents() {
	        return events;
	    }
	 public void setEvents(List<EventBean> events) {
	        this.events = events;
	    }

}
