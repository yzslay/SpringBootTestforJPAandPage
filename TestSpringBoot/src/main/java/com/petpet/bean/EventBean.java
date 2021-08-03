package com.petpet.bean;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="event")
@Component("eventbean")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,	property = "eventID")
public class EventBean implements java.io.Serializable {
	
	@Transient //無視
	private static final long serialVersionUID = 1L;
	@Id @Column(name = "EVENTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int eventID;
	@Column(name = "HOSTID")
	private int hostID;
	@Column(name = "EVENTNAME" , nullable = false)
	private String eventName;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@Column(name = "EVENTSTARTTIME",nullable = false)
	private Timestamp eventStartTime;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@Column(name = "EVENTENDTIME" ,nullable = false)
	private Timestamp eventEndTime;
	
	@Column(name = "EVENTLOCATION" ,nullable = false)
	private String eventLocation;
	@Column(name = "EVENTPICTURE")
	private byte[] eventPicture;
	@Column(name = "EVENTTYPE")
	private String eventType;

	@Column(name = "EVENTMAXLIMIT")
	private int eventMaxLimit;
	@Column(name = "EVENTFEE")
	private int eventFee;
	@Column(name = "EVENTSTATUS")
	private boolean eventStatus;
	@Column(name = "eventdescription")
	private String eventDescription ;
	@Column(name = "eventclick")
	private int eventClick ;
	public int getEventID() {
		return 	eventID;
	}
	
//對應到Event欄位的Members，請用{CascadeType.PERSIST, CascadeType.MERGE}  不要用 CascadeType.PERSIST All
//為什麼請看之前學姊貼的資料，如果用All的話會連帶的資料一併刪除,記得加上Get Set方法
	
	 @ManyToMany(mappedBy = "events",targetEntity = MockMemberBean.class , cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	 private List<MockMemberBean> members;
	 
	 public List<MockMemberBean> getMembers() {
	        return members;
	    }
	 public void setMembers(List<MockMemberBean> members) {
	        this.members = members;
	    }

	 
	public void setEventID(int eventID) {
		this.eventID = eventID;
	}
	public int getHostID() {
		return hostID;
	}
	public void setHostID(int hostID) {
		this.hostID = hostID;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public Timestamp getEventStartTime() {
		return eventStartTime;
	}
	public void setEventStartTime(Timestamp eventStartTime) {
		this.eventStartTime = eventStartTime;
	}
	public Timestamp getEventEndTime() {
		return eventEndTime;
	}
	public void setEventEndTime(Timestamp eventEndTime) {
		this.eventEndTime = eventEndTime;
	}
	public String getEventLocation() {
		return eventLocation;
	}
	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}
	public byte[] getEventPicture() {
		return eventPicture;
	}
	public void setEventPicture(byte[] eventPicture) {
		this.eventPicture = eventPicture;
	}
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	public int getEventMaxLimit() {
		return eventMaxLimit;
	}
	public void setEventMaxLimit(int eventMaxLimit) {
		this.eventMaxLimit = eventMaxLimit;
	}
	public int getEventFee() {
		return eventFee;
	}
	public void setEventFee(int eventFee) {
		this.eventFee = eventFee;
	}
	public boolean isEventStatus() {
		return eventStatus;
	}
	public void setEventStatus(boolean eventStatus) {
		this.eventStatus = eventStatus;
	}
	public String getEventDescription() {
		return eventDescription;
	}
	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}
	public int getEventClick() {
		return eventClick;
	}
	public void setEventClick(int eventClick) {
		this.eventClick = eventClick;
	}
	
	
	
}