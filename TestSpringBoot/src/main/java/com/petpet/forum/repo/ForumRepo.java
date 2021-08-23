package com.petpet.forum.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.petpet.forum.model.Forum;

@Repository("ForumRepository")
public interface ForumRepo extends JpaRepository <Forum, Integer> {

}
