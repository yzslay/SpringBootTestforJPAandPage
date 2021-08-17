package com.petpet.event.service;

import java.util.List;
import org.springframework.data.domain.Page;
import com.petpet.event.model.Event;


public interface  IEventService {
	
	public List<Event> queryall();
	public Event query(int eventid);
	public Event insert(Event EventBean);
	public Event update(Event eventbean);
	public Event delete(int eventid);
	public Page<Event> memberQueryAllPage(int pageNum,String sortField, String sortDir);
}