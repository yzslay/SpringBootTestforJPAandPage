package com.petpet.event;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

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
import com.petpet.bean.MockMemberBean;

@Controller
public class EventControllerSpring {
	
	@Autowired
	private IEventService EventService;
	@Autowired
	private IMockMemberService MockMemberService;
	
	// 一開始查詢所有的
	@RequestMapping(path={"/queryallevent.controller","/"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String listAllEvents(Model m) {
		List<EventBean> event = EventService.queryall();
		m.addAttribute("events", event);
		return 	"event/Event";
	}
	
	//查詢單一活動，點閱+1
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
	// 增加活動
	@RequestMapping(path="/addevent.controller", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<?> addEvent(HttpServletRequest request, Model m, final @RequestParam("image") MultipartFile file) throws IOException {
		//有空Rewrite
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
	
	//圖片SRC直接輸出到網頁上
	@GetMapping("/event/display/{id}")  // 用來匯出資料庫的圖片
	@ResponseBody
	public void showEventImage(@PathVariable("id") int id, HttpServletResponse response, EventBean Event) throws ServletException, IOException {

		Event = EventService.query(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(Event.getEventPicture());
		response.getOutputStream().close();
	}
	
// 刪除Event
	@RequestMapping(path="/deleteevent.controller", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<?>  deleteEvent(HttpServletRequest request, Model m) {
		int eventid =Integer.parseInt(request.getParameter("eventid"));
		EventBean eventbean = EventService.delete(eventid);
//		m.addAttribute("event",eventbean);
//      目前不用回傳
		return new ResponseEntity<>("刪除成功", HttpStatus.OK);
	}

//修改Event，之後修改參數...現在太亂了
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
//		m.addAttribute("event",modifyeventbean);
// 目前不用回傳Bean
		return new ResponseEntity<>("Product Saved With File - ", HttpStatus.OK);
	}catch  (Exception e) {
		e.printStackTrace();
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
//跳轉增加活動頁面
	@RequestMapping(path="/EventAdd", method = RequestMethod.GET)
	public String Eventadd(HttpServletRequest request ) {
		return "event/EventAddMember";
		}
//跳轉刪除活動頁面
	@RequestMapping(path="/Eventdelete", method = RequestMethod.GET)
	public String Eventde(HttpServletRequest request ) {
		return "event/EventDeleteMember";
		}
	
// 新增活動參加人員 給Member Id 跟 Event id ，找出兩筆關聯在做儲存
	@RequestMapping(path="/memberaddevent", method = RequestMethod.GET)
	public  @ResponseBody ResponseEntity<?> Eventaddmember( HttpServletRequest request  ) {
		int eventid;
		long memberid;
		eventid= Integer.parseInt(request.getParameter("eventid"));
		memberid= Long.parseLong(request.getParameter("memberid"));
		if ( EventService.query(eventid) != null ){		
			EventBean memberevent = EventService.query(eventid);
			MockMemberBean member = MockMemberService.query(memberid);
			
			List<EventBean> listbean= member.getEvents();
			
			for (int i = 0; i < listbean.size(); i++) {
				if ((listbean.get(i).getEventID()) ==  memberevent.getEventID()){
					return  new ResponseEntity<>("重複參加活動", HttpStatus.BAD_REQUEST);
				}
			}		
			member.getEvents().addAll(Arrays.asList(memberevent));
			MockMemberService.save(member);
		}else {
		}
		return  new ResponseEntity<>("成功", HttpStatus.OK);
	}
	
// 刪除活動參加人員	
	@RequestMapping(path="/memberdeleteevent", method = RequestMethod.GET)
	public  @ResponseBody ResponseEntity<?> Eventdeletemember( HttpServletRequest request  ) {
		int eventid;
		long memberid;
		eventid= Integer.parseInt(request.getParameter("eventid"));
		memberid= Long.parseLong(request.getParameter("memberid"));
		if ( EventService.query(eventid) != null ){		
			EventBean memberevent = EventService.query(eventid);
			MockMemberBean member = MockMemberService.query(memberid);
			member.getEvents().remove(memberevent);
			memberevent.getMembers().remove(member);
			MockMemberService.save(member);
		}else {
		}
		return  new ResponseEntity<>("成功", HttpStatus.OK);
	}
	
	
	
	
	
	
	
}

