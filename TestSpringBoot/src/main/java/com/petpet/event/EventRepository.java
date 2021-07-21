package com.petpet.event;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.petpet.bean.EventBean;

@Repository("EventRepository")
public interface EventRepository extends JpaRepository <EventBean, Integer>{
	
}
