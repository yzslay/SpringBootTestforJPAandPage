package com.petpet.event;

import org.springframework.data.jpa.repository.JpaRepository;

import com.petpet.bean.BookCategory;

public interface BookCategoryRepository extends JpaRepository<BookCategory, Integer> {
}