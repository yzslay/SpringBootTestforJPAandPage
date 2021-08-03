package com.petpet.event;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
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

	}
	
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
