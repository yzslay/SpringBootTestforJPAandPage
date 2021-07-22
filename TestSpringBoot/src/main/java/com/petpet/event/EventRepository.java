package com.petpet.event;

import java.util.List;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.petpet.bean.EventBean;

@Repository("EventRepository")
public interface EventRepository extends JpaRepository <EventBean, Integer>{
//      List<EventBean> findAllByEventFee(int eventFee, Pageable pageable);
}
