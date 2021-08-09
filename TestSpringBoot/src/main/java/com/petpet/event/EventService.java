package com.petpet.event;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petpet.bean.EventBean;


@Service("EventService")
@Transactional
public class EventService implements IEventService {
	

	@Autowired
	private EventRepository eventRepository;

	@Override
	public List<EventBean> queryall() {
		return eventRepository.findAll();

	}
	
	
	public Page<EventBean> memberQueryAllPage(int pageNum, String sortField, String sortDir){
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize,
				  sortDir.equals("asc") ? Sort.by(sortField).ascending()
                          : Sort.by(sortField).descending()
                          );//因為由0開始
		return eventRepository.findAll(pageable);
	};
	
	@Override
	public EventBean query(int eventid){
		EventBean eventbean = eventRepository.findById(eventid).orElse(null) ;
		return eventbean;
	}   	


	
	@Override
	public EventBean insert(EventBean eventbean)  {
		return eventRepository.save(eventbean);
		

	}
	@Override
	public EventBean update(EventBean eventbean)  {
		return eventRepository.save(eventbean);

	}
	@Override
	public EventBean delete(int eventid)  {
		EventBean eventbean = eventRepository.findById(eventid).orElse(null);
		eventRepository.deleteById(eventid);
		return eventbean;

	}
}
