
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.petpet.event.model.Event;


@Entity
@Table(name = "mockmember")
@Component("memberbean")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,	property = "memberId")  // 使用@JsonIdentityInfo 避免迴圈傳遞資料https://blog.csdn.net/dnc8371/article/details/106701314
public class MockMemberBean implements java.io.Serializable {
	@Transient //無視
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="memberid")
    private Long memberId;
	

	@Column(name="address" )
	private String address;
	
 	public Long getMemberId() {
		return memberId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
 	
 	
 	@ManyToMany(targetEntity = Event.class, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
 	private List<Event> events = new ArrayList<Event>();
// 多對多裡面只能操控一邊的新增刪除，一邊要有MappedBy(這邊不能寫)，另外一邊可以可以操作，這個例子是操作會員參加活動，所以Event那邊寫Map
// 由於在會員這邊的一個會員可以對應到多筆Member，所以這邊要列Arraylist或是Set(不重複)，凱文你給我去用Set+欄位
 	
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE}, mappedBy = "hostmember")
	private List<Event> hostevent;
 	
 	
	 public List<Event> getHostevent() {
		return hostevent;
	}
	public void setHostevent(List<Event> hostevent) {
		this.hostevent = hostevent;
	}
	public List<Event> getEvents() {
	        return events;
	    }
	 public void setEvents(List<Event> events) {
	        this.events = events;
	    }
	 
	

}
