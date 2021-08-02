package com.petpet.event;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.petpet.bean.MockMemberBean;

@Repository
public interface  MocoMemberRepository  extends JpaRepository<MockMemberBean,Long >{
	

}
