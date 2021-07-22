package com.petpet.event;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
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
	public List<EventBean> queryallpage() {
        int page = 1; //page:当前页的索引。注意索引都是从 0 开始的。
        int size = 5;// size:每页显示 3 条数据
		PageRequest pageable= PageRequest.of(page, size,Sort.by("eventFee"));
		Page<EventBean> p = this.eventRepository.findAll(pageable);

		 System.out.println("Total page："+p.getTotalElements());
	     System.out.println("总页数："+p.getTotalPages());
	     List<EventBean> list = p.getContent();
		return list;
//		return EventDAO.queryall();
	}
	
	@Override
	public EventBean query(int eventid){
		EventBean eventbean = eventRepository.findById(eventid).orElse(null) ;
		return eventbean;
	}   	

//		return eventRepository.query(eventid);
	
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
