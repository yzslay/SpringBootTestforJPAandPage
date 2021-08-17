package com.petpet.event.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.petpet.event.model.Event;



@Repository("EventRepository")
public interface EventRepository extends JpaRepository <Event, Integer>{
	
//	List<EventBean> findByEventStartTime(Timestamp eventStartTime);

	
}
