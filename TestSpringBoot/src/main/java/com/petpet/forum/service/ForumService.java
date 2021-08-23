package com.petpet.forum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petpet.bean.MockMemberBean;
import com.petpet.event.repository.EventRepository;
import com.petpet.forum.model.Forum;
import com.petpet.forum.repo.ForumRepo;



@Service("ForumService")
@Transactional
public class ForumService  { 
	
	@Autowired
	private ForumRepo  forumRepo;


	public List<Forum> queryall(){
		return forumRepo.findAll();
	};
	public Forum query(int forumid) {
		Forum forum = forumRepo.findById(forumid).orElse(null) ;
		return forum;
	
	}
	public Forum insert(Forum forum) {
		return forumRepo.save(forum);
	}

	public Forum  update( Forum forum) {
		forumRepo.save(forum);
		return forum;
	}

	
	public void delete(int forumid) {
		Forum forum = forumRepo.findById(forumid).orElse(null);
		forumRepo.deleteById(forumid);
	}

	
}