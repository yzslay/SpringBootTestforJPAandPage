package com.petpet.event.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.petpet.event.model.Event;
import com.petpet.event.repository.EventRepository;




@Service("EventService")
@Transactional
public class EventService implements IEventService {
	

	@Autowired
	private EventRepository eventRepository;

	@Override
	public List<Event> queryall() {
		return eventRepository.findAll();

	}
	
	
	public Page<Event> memberQueryAllPage(int pageNum, String sortField, String sortDir){
		int pageSize = 9;
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize,
				  sortDir.equals("asc") ? Sort.by(sortField).ascending()
                          : Sort.by(sortField).descending()
                          );//因為由0開始
		return eventRepository.findAll(pageable);
	};
	
	@Override
	public Event query(int eventid){
		Event eventbean = eventRepository.findById(eventid).orElse(null) ;
		return eventbean;
	}   	


	
	@Override
	public Event insert(Event eventbean)  {
		return eventRepository.save(eventbean);
		

	}
	@Override
	public Event update(Event eventbean)  {
		return eventRepository.save(eventbean);

	}
	@Override
	public Event delete(int eventid)  {
		Event eventbean = eventRepository.findById(eventid).orElse(null);
		eventRepository.deleteById(eventid);
		return eventbean;

	}
}
