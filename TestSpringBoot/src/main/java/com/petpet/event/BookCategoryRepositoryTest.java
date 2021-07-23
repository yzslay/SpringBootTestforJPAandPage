package com.petpet.event;

import org.junit.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import com.petpet.bean.Book;
import com.petpet.bean.BookCategory;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Before;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.junit.Assert;


@SpringBootTest
@ExtendWith(SpringExtension.class)
@Slf4j
public class BookCategoryRepositoryTest {   // 用來測試Join功能的JPA,目前用Junit4的測試.....

    @Autowired
    private BookCategoryRepository repository;


    @Test
    public void saveCategoryTest(){
        BookCategory categoryOne = new BookCategory("Category One");
        Set books = new HashSet<Book>();
        categoryOne.setBooks(books);

        BookCategory categoryTwo = new BookCategory("Category Two");
        Set bookBs = new HashSet<Book>();
        categoryTwo.setBooks(bookBs);

        Set allBooks = new HashSet();

        allBooks.add(categoryOne);
        allBooks.add(categoryTwo);

        List list = repository.saveAll(allBooks);

        Assert.assertNotNull(list);
    }

    @Test
    public void findAll() throws Exception{

        for (BookCategory bookCategory : repository.findAll()) {
            log.info(bookCategory.toString());
        }
    }
}