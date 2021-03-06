package com.petpet.event.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petpet.event.IMockMemberService;
import com.petpet.event.model.Event;
import com.petpet.event.service.IEventService;
import com.petpet.bean.MockMemberBean;

@Controller
public class EventRestController {

	
	@Autowired
	private IEventService EventService;
	@Autowired
	private IMockMemberService MockMemberService;
	
	
	@RequestMapping(path={"/queryallevent.rest",}, method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public List<Event>   listAllEvents(Model m) {
		List<Event> event = EventService.queryall();
		m.addAttribute("events", event);
		return  event	;
	}
	
	@RequestMapping(path={"/queryalluser.rest",}, method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public List<MockMemberBean>   listAllUser(Model m) {
		
		List<MockMemberBean> Memberbean = MockMemberService.queryall();
		
		 if(Memberbean.size()>0) {
			 List<MockMemberBean> MemberModels = new ArrayList<>();
			 
		
			 
		 }
		m.addAttribute("events", Memberbean);
		return  Memberbean	;
	
	}
}
