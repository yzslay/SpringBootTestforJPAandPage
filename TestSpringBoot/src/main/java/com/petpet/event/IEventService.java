package com.petpet.event;

import java.util.List;

import org.springframework.data.domain.Page;

import com.petpet.bean.EventBean;

public interface  IEventService {
	
	public List<EventBean> queryall();
	public EventBean query(int eventid);
	public EventBean insert(EventBean EventBean);
	public EventBean update(EventBean eventbean);
	public EventBean delete(int eventid);
	public Page<EventBean> memberQueryAllPage(int pageNum,String sortField, String sortDir);
}