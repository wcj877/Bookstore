package com.wsgs.bookstore.dao;

import com.wsgs.bookstore.dao.impl.BookImpl;
import com.wsgs.bookstore.dao.impl.ClassificationImpl;
import com.wsgs.bookstore.data.Book;
import com.wsgs.bookstore.data.Classification;
import com.wsgs.bookstore.utils.PageBean;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        BookDao dao = new BookImpl();
        PageBean<Book> pageBean = new PageBean<>();
        dao.querysAll(pageBean);
        List<Book> list = pageBean.getPageData();
        for (Book book: list){
            System.out.println(book);
        }

    }
}
