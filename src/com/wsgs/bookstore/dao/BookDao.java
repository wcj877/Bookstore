package com.wsgs.bookstore.dao;

import com.wsgs.bookstore.entity.Book;
import com.wsgs.bookstore.utils.PageBean;

public interface BookDao {
    /**
     * 增加图书
     * @param book
     * @return
     */
    void add(Book book);

    /**
     * 修改图书
     * @param book
     * @return
     */
    void update(Book book);

    /**
     * 删除图书
     * @param bookID
     * @return
     */
    void delete(int bookID);


    /**
     * 获取指定条件的图书
     * @param pb
     */
    void querysAll(PageBean<Book> pb);

    /**
     * 返回查询数据的条数
     * @param condition
     * @return
     */
    int getCount(String condition);

    /**
     * 返回图书id为bookid的图书
     * @param bookID
     * @return
     */
    Book getBook(String bookID);

}
