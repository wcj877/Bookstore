package com.wsgs.bookstore.dao;

import com.wsgs.bookstore.data.Book;
import com.wsgs.bookstore.data.Classification;
import com.wsgs.bookstore.utils.PageBean;

import java.util.List;

public interface ClassificationDao {
    /**
     * 增加图书类别
     * @param classification
     * @return
     */
    void add(Classification classification);

    /**
     * 修改图书类别信息
     * @param classification
     * @return
     */
    void update(Classification classification);

    /**
     * 删除图书类别
     * @param classificationID
     * @return
     */
    void delete(int classificationID);

    /**
     * 获取图书类别
     * @param
     */
    List<Classification> getBookAll();
}
