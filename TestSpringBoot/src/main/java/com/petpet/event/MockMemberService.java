package com.petpet.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petpet.bean.MockMemberBean;
import com.petpet.event.repository.EventRepository;



@Service("MockBeanService")
@Transactional
public class MockMemberService implements IMockMemberService { 
	
	@Autowired
	private MockMemberRepository mockMemberRepository;
	@Autowired
	private EventRepository eventRepository;

	public List<MockMemberBean> queryall(){
		return mockMemberRepository.findAll();
	};
	public MockMemberBean query(Long memberid) {
		MockMemberBean mockMemberBean = mockMemberRepository.findById(memberid).orElse(null) ;
		return mockMemberBean;
	
	}
	public MockMemberBean insert(MockMemberBean mockMemberBean) {
		return mockMemberRepository.save(mockMemberBean);

	}
	public MockMemberBean save(MockMemberBean mockMemberBean) {
		return mockMemberRepository.save(mockMemberBean);
	}
	public List<MockMemberBean> updateAll(List<MockMemberBean> mockMemberBean) {
		return mockMemberRepository.saveAll(mockMemberBean);
	}
	
	
	public MockMemberBean delete(Long memberid) {
		MockMemberBean mockMemberBean = mockMemberRepository.findById(memberid).orElse(null);
		mockMemberRepository.deleteById(memberid);
		return mockMemberBean;
	}
	public List<MockMemberBean> queryallpage() {
		return null;
	}
	
}