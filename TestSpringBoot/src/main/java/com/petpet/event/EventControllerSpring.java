package com.petpet.event;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.petpet.bean.EventBean;

@Controller
public class EventControllerSpring {
	
	@Autowired
	private IEventService EventService;
	
	@RequestMapping(path={"/queryallevent.controller","/"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String listAllEvents(Model m) {
		List<EventBean> event = EventService.queryall();
		m.addAttribute("events", event);
		return 	"event/Event";
	}
	
	@RequestMapping(path="/queryevent.controller", method = RequestMethod.GET)
	public String listEvent(@RequestParam("eventid") int eventid,Model m) {
		if ( eventid == (-1) ) {
			
		}else {
		EventBean event = EventService.query(eventid);	
		event.setEventClick(event.getEventClick()+1);
		EventBean modifyeventbean = EventService.update(event);	
		m.addAttribute("event", modifyeventbean);
		System.out.println("MOO");
		return 	"event/UpdateEvent";
		}
		return "event/UpdateEvent";
	}
	
	@RequestMapping(path="/addevent.controller", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<?> addEvent(HttpServletRequest request, Model m, final @RequestParam("image") MultipartFile file) throws IOException {
		
	try {
		byte[] imageData = file.getBytes();		
		EventBean eventbean = new EventBean();		
		if(file.isEmpty()) {
			eventbean.setEventPicture(null);		
		}else {
			eventbean.setEventPicture(imageData);
		}
		eventbean.setHostID(1);
		eventbean.setEventName((String)(request.getParameter("eventname")));
		eventbean.setEventStartTime(Timestamp.valueOf(request.getParameter("eventstartdate")+" "+request.getParameter("eventstarttime")+":01")); //處理Timestamp
		eventbean.setEventEndTime(Timestamp.valueOf(request.getParameter("eventenddate")+" "+request.getParameter("eventendtime")+":01"));
		eventbean.setEventLocation((String)(request.getParameter("eventlocation")));
		eventbean.setEventType((String)(request.getParameter("eventtype")));
		eventbean.setEventMaxLimit(Integer.parseInt(request.getParameter("eventmaxlimit")));
		eventbean.setEventFee(Integer.parseInt(request.getParameter("eventfee")));
		eventbean.setEventStatus(Boolean.valueOf(request.getParameter("eventstatus")));
		eventbean.setEventDescription((String)(request.getParameter("eventdescription")));		
		
		EventService.insert(eventbean);
//		m.addAttribute("event",eventbean);
		return new ResponseEntity<>("Product Saved With File - ", HttpStatus.OK);
	}catch  (Exception e) {
		e.printStackTrace();
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("/event/display/{id}")  // 用來匯出資料庫的圖片
	@ResponseBody
	public void showEventImage(@PathVariable("id") int id, HttpServletResponse response, EventBean Event) throws ServletException, IOException {

		Event = EventService.query(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(Event.getEventPicture());
		response.getOutputStream().close();
	}
	
	@RequestMapping(path="/deleteevent.controller", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<?>  deleteEvent(HttpServletRequest request, Model m) {
		int eventid =Integer.parseInt(request.getParameter("eventid"));
		EventBean eventbean = EventService.delete(eventid);
		m.addAttribute("event",eventbean);
		return new ResponseEntity<>("刪除成功", HttpStatus.OK);
	}
	
	@RequestMapping(path="/modifyevent.controller", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<?>  updateEvent(HttpServletRequest request, Model m, final @RequestParam("image") MultipartFile file) throws IOException {
	
	try {
		EventBean eventbean = EventService.query(Integer.parseInt(request.getParameter("eventid")));			
		byte[] imageData = file.getBytes();		
	
		if(file.isEmpty()) {
			eventbean.setEventPicture(null);		
		}else {
			eventbean.setEventPicture(imageData);
		}		
		eventbean.setEventID(Integer.parseInt(request.getParameter("eventid")));
		eventbean.setEventName((String)(request.getParameter("eventname")));
		eventbean.setEventStartTime(Timestamp.valueOf(request.getParameter("eventstartdate")+" "+request.getParameter("eventstarttime")+":01"));
		eventbean.setEventEndTime(Timestamp.valueOf(request.getParameter("eventenddate")+" "+request.getParameter("eventendtime")+":01"));
		eventbean.setEventLocation((String)(request.getParameter("eventlocation")));
		eventbean.setEventType((String)(request.getParameter("eventtype")));
		eventbean.setEventMaxLimit(Integer.parseInt(request.getParameter("eventmaxlimit")));
		eventbean.setEventFee(Integer.parseInt(request.getParameter("eventfee")));
		eventbean.setEventStatus(Boolean.valueOf(request.getParameter("eventstatus")));
		eventbean.setEventDescription((String)(request.getParameter("eventdescription")));		
		eventbean.setEventClick(Integer.parseInt(request.getParameter("eventclick")));
		EventBean modifyeventbean = EventService.update(eventbean);
		m.addAttribute("event",modifyeventbean);
		return new ResponseEntity<>("Product Saved With File - ", HttpStatus.OK);
	}catch  (Exception e) {
		e.printStackTrace();
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		}
	@RequestMapping(path="/createeevent.url", method = RequestMethod.GET)
	public String creatEvent(HttpServletRequest request ) {

		return "event/createvent";
		}
	
	@RequestMapping(path="/eventindex", method = RequestMethod.GET)
	public String Event(HttpServletRequest request ) {

		return "event/Event";
		}
}

