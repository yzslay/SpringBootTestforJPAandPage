package com.petpet.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petpet.bean.MockMemberBean;




@Service("MockBeanService")
@Transactional
public class MockMemberService implements IMockMemberService { 
	
	@Autowired
	private MockMemberRepository mockMemberRepository;
	@Autowired
	private EventRepository eventRepository;

	public List<MockMemberBean> queryall(){
		return null;
	};
	public MockMemberBean query(int memberid) {
		return null;
	}
	public MockMemberBean insert(MockMemberBean mockMemberBean) {
		return null;
	}
	public MockMemberBean update(MockMemberBean mockMemberBean) {
		return null;
	}
	public MockMemberBean delete(int memberid) {
		return null;
	}
	public List<MockMemberBean> queryallpage() {
		return null;
	}
	
}