package com.wsgs.bookstore.dao.impl;

import com.wsgs.bookstore.dao.BookDao;
import com.wsgs.bookstore.entity.Book;
import com.wsgs.bookstore.utils.JDBCUtils;
import com.wsgs.bookstore.utils.PageBean;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookImpl implements BookDao {
    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void add(Book book) {
        String sql =" INSERT book(classificationID,bookName,writer,intro,price,putTime,outTime,url,sellNumber,isRecommend) VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            queryRunner.update(sql, book.getClassificationId(), book.getBookName(), book.getWriter(), book.getIntro(),
                    book.getPrice(), book.getPutTime(), book.getOutTime(), book.getUrl(), book.getSellNumber(), book.getIsRecommend());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Book book) {
        String sql =" update book set bookName=?, classificationID=?, writer=?,intro=?, price=?,url=? " +
                "where bookID = ?";
        try {
            queryRunner.update(sql, book.getBookName(), book.getClassificationId(), book.getWriter(), book.getIntro(),
                    book.getPrice(), book.getUrl(), book.getBookId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int bookID) {
        String sql ="DELETE FROM book WHERE bookID=?";
        try {
            queryRunner.update(sql,bookID);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void querysAll(PageBean<Book> pb) {
        //总记录数到pb中
        int totalCount = this.getCount(pb.getCondition());
        pb.setTotalCount(totalCount);

        /**
         * 如果当前页 <= 0;       当前页设置当前页为1;
         * 如果当前页 > 最大页数；  当前页设置为最大页数;
         */

        if (pb.getCurrentPage() <= 0) {
            pb.setCurrentPage(1);
        } else if (pb.getCurrentPage() > pb.getTotalPage()) {
            pb.setCurrentPage(pb.getTotalPage());
        }

        // 获取当前页： 计算查询的起始行、返回的行数
        int currentPage = pb.getCurrentPage();
        int index = (currentPage - 1) * pb.getPageCount(); // 查询的起始行
        int count = pb.getPageCount(); // 查询返回的行数

        StringBuilder sb = new StringBuilder();
        sb.append(" SELECT * FROM book");
        if (pb.getCondition() != null){
            sb.append(pb.getCondition());
        }
        sb.append(" limit ?,? ");
        List<Object> list = new ArrayList<Object>();
        list.add(index);
        list.add(count);

        try {
            // 根据当前页，查询当前页数据(一页数据)
            if (index >= 0) {
                List<Book> pageData = queryRunner.query(sb.toString(),
                        new BeanListHandler<Book>(Book.class), list.toArray());
                // 设置到pb对象中
                pb.setPageData(pageData);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int getCount(String condition) {
        String sql = "select count(*) From book";
        try {

            if (condition !=null){
                sql += condition;
            }
            Long count =  queryRunner.query(sql, new ScalarHandler<Long>());
            return count.intValue();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Book getBook(String bookID) {
        String sql = "select * from book where bookID = ?";
        try {
            return queryRunner.query(sql, new BeanHandler<Book>(Book.class), bookID);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
}
