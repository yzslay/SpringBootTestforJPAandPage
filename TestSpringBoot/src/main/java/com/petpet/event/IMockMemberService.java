package com.petpet.event;

import java.util.List;

import com.petpet.bean.MockMemberBean;


public interface IMockMemberService {
	public List<MockMemberBean> queryall();
	public MockMemberBean query(Long memberid);
	public MockMemberBean insert(MockMemberBean mockMemberBean);
	public MockMemberBean save(MockMemberBean mockMemberBean);
	public MockMemberBean delete(Long memberid);
	public List<MockMemberBean> queryallpage();
}
