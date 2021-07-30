package com.petpet.event;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.petpet.bean.EventBean;

@Controller
public class EventControllerSpring {
	
	@Autowired
	private IEventService EventService;
	
	@RequestMapping(path={"/queryallevent.controller","/"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String listAllEvents(Model m) {
		List<EventBean> event = EventService.queryall();
		m.addAttribute("events", event);
		return 	"event/getallevent";
	}
	
	@RequestMapping(path="/queryevent.controller", method = RequestMethod.GET)
	public String listEvent(@RequestParam("eventid") int eventid,Model m) {
		EventBean event = EventService.query(eventid);
		m.addAttribute("event", event);
		System.out.println("MOO");
		return 	"event/getaevent";
	
	}
	
	@RequestMapping(path="/addevent.controller", method = RequestMethod.POST)
	public String addEvent(HttpServletRequest request, Model m) {
		EventBean eventbean = new EventBean();
		eventbean.setHostID(1);
		eventbean.setEventName((String)(request.getParameter("eventname")));
		System.out.println(request.getParameter("eventstartdate")+" "+request.getParameter("eventstarttime"));
		eventbean.setEventStartTime(Timestamp.valueOf(request.getParameter("eventstartdate")+" "+request.getParameter("eventstarttime")+":01"));
		eventbean.setEventEndTime(Timestamp.valueOf(request.getParameter("eventenddate")+" "+request.getParameter("eventendtime")+":01"));
		eventbean.setEventLocation((String)(request.getParameter("eventlocation")));
		eventbean.setEventType((String)(request.getParameter("eventtype")));
		eventbean.setEventMaxLimit(Integer.parseInt(request.getParameter("eventmaxlimit")));
		eventbean.setEventFee(Integer.parseInt(request.getParameter("eventfee")));
		eventbean.setEventStatus(Boolean.valueOf(request.getParameter("eventstatus")));
		eventbean.setEventDescription((String)(request.getParameter("eventdescription")));		
		eventbean.setEventClick(1);
		EventService.insert(eventbean);
		m.addAttribute("event",eventbean);
		return "event/correct";
	}
	@RequestMapping(path="/deleteevent.controller", method = RequestMethod.GET)
	public String deleteEvent(HttpServletRequest request, Model m) {
		int eventid =Integer.parseInt(request.getParameter("eventid"));
		EventBean eventbean = EventService.delete(eventid);
		m.addAttribute("event",eventbean);
		return "event/deletecorrect";
	}
	
	@RequestMapping(path="/modifyevent.controller", method = RequestMethod.POST)
	public String updateEvent(HttpServletRequest request, Model m) {
		EventBean eventbean = new EventBean();
		eventbean.setEventID(Integer.parseInt(request.getParameter("eventid")));
		eventbean.setEventName((String)(request.getParameter("eventname")));
		System.out.println(request.getParameter("eventstartdate")+" "+request.getParameter("eventstarttime"));
		eventbean.setEventStartTime(Timestamp.valueOf(request.getParameter("eventstartdate")+" "+request.getParameter("eventstarttime")+":01"));
		eventbean.setEventEndTime(Timestamp.valueOf(request.getParameter("eventenddate")+" "+request.getParameter("eventendtime")+":01"));
		eventbean.setEventLocation((String)(request.getParameter("eventlocation")));
		eventbean.setEventType((String)(request.getParameter("eventtype")));
		eventbean.setEventMaxLimit(Integer.parseInt(request.getParameter("eventmaxlimit")));
		eventbean.setEventFee(Integer.parseInt(request.getParameter("eventfee")));
		eventbean.setEventDescription((String)(request.getParameter("eventdescription")));		
		EventBean modifyeventbean = EventService.update(eventbean);
		m.addAttribute("event",modifyeventbean);
		return "event/correct";
	}
	@RequestMapping(path="/createeevent.url", method = RequestMethod.GET)
	public String creatEvent(HttpServletRequest request ) {

		return "event/createvent";
	}
}
