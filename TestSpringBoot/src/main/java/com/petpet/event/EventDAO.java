package com.petpet.event;

import java.util.List;
import javax.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;
import com.petpet.bean.EventBean;
//目前沒在用
@Repository("EventDAO")
public class EventDAO implements IEventDAO {
	
	@Autowired
	EntityManager entityManager;
	
	@Override
	public List<EventBean> queryall() {
		return  entityManager.createQuery("from EventBean",EventBean.class).getResultList();
//		return  entityManager.createQuery("from EventBean",EventBean.class).getResultList();
	}
	
	@Override
	public  EventBean query(int eventid) {	
		Pageable p = PageRequest.of(0 ,5);   // of(int page, int size, Sort.Direction direction, String... properties)
		
		
		return entityManager.find(EventBean.class,eventid);
		
	}
	
	@Override
	public  EventBean insert(EventBean eventbean) {  //要在前面塞eventstatus=1,因為那個不能是空值
		EventBean result = entityManager.find(EventBean.class, eventbean.getEventID());
		if(result==null) {
			entityManager.persist(eventbean);
			return eventbean;
		}
		return null;
	};
	@Override
	public  EventBean update(EventBean eventbean) {
		
		EventBean result = entityManager.find(EventBean.class, eventbean.getEventID());
		
		if(result!=null) {
			result.setEventName(eventbean.getEventName());
			result.setEventDate(eventbean.getEventDate());
			result.setEventStratTime(eventbean.getEventStratTime());
			result.setEventEndTime(eventbean.getEventEndTime());
			result.setEventLocation(eventbean.getEventLocation());
			result.setEventType(eventbean.getEventType());
			result.setEventType1(eventbean.getEventType1());
			result.setEventType2(eventbean.getEventType2());
			result.setEventTypeCustom(eventbean.getEventTypeCustom());
			result.setEventMaxLimit(eventbean.getEventMaxLimit());
			result.setEventFee(eventbean.getEventFee());
			result.setEventDescribe(eventbean.getEventDescribe());	
		}		
		entityManager.merge(result);
		return result;
	}
	@Override
	public EventBean delete(int eventid) {
		EventBean result = entityManager.find(EventBean.class, eventid);
		
		entityManager.remove(result);
			return result;
		}

	
	
}


	
	

