package com.petpet.event;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petpet.bean.EventBean;


@Service("EventService")
@Transactional
public class EventService implements IEventService {
	
	@Autowired @Qualifier("EventRepository")
	private EventRepository eventRepository;
//	private IEventDAO EventDAO;
	

	@Override
	public List<EventBean> queryall() {
		return eventRepository.findAll();
//		return EventDAO.queryall();
	}
	@Override
	public EventBean query(int eventid){
		
		EventBean eventbean = eventRepository.findById(eventid).orElse(null);
		return eventbean;
	   
	

//		return eventRepository.query(eventid);
	}
	@Override
	public EventBean insert(EventBean eventbean)  {
		return eventRepository.save(eventbean);
		
//		return EventDAO.insert(eventbean);
	}
	@Override
	public EventBean update(EventBean eventbean)  {
		return eventRepository.save(eventbean);
//		return EventDAO.update(eventbean);
	}
	@Override
	public EventBean delete(int eventid)  {
		EventBean eventbean = eventRepository.findById(eventid).orElse(null);
		eventRepository.deleteById(eventid);
		return eventbean;
//		return EventDAO.delete(eventid);
	}
}
