package com.wsgs.bookstore.dao.impl;

import com.wsgs.bookstore.dao.FavoritesDao;
import com.wsgs.bookstore.entity.Book;
import com.wsgs.bookstore.entity.Favorites;
import com.wsgs.bookstore.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class FavoritesImpl implements FavoritesDao {

    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void add(String bookID, String userID) {
        String sql =" INSERT  favorites(bookID, userID)  VALUES(?,?)";
        try {
            queryRunner.update(sql, Integer.parseInt(bookID), userID);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int favoritesID) {
        String sql ="DELETE FROM favorites WHERE favoritesID=?";
        try {
            queryRunner.update(sql,favoritesID);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Book> querysAll(String userID) {
        String sql = "select bookName,writer,intro,price,url from favorites,book where book.bookId=favorites.bookId and userID=?";
        try {
            return queryRunner.query(sql, new BeanListHandler<Book>(Book.class), userID);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
}
