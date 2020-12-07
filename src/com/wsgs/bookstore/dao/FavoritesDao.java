package com.wsgs.bookstore.dao;

import com.wsgs.bookstore.entity.Favorites;

import java.util.List;

public interface FavoritesDao {
    /**
     * 增加收藏的图书
     * @param bookID
     * @param userID
     * @return
     */
    void add(int bookID, String userID);

    /**
     * 删除收藏的图书
     * @param favoritesID
     * @return
     */
    void delete(int favoritesID);

    /**
     * 查询userID用户收藏的所有图书
     * @param userID
     * @return
     */
    List<Favorites> querysAll(int userID);

}
