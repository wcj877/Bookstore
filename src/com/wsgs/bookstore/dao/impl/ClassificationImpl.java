package com.wsgs.bookstore.dao.impl;

import com.wsgs.bookstore.dao.ClassificationDao;
import com.wsgs.bookstore.entity.Classification;
import com.wsgs.bookstore.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ClassificationImpl implements ClassificationDao {

    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void add(Classification classification) {
        String sql =" INSERT classification(classificationName) VALUES(?)";
        try {
            queryRunner.update(sql, classification.getClassificationName());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Classification classification) {
        String sql =" update classification set classificationName=? " +
                "where classificationID = ?";
        try {
            queryRunner.update(sql, classification.getClassificationName(), classification.getClassificationID());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(String classificationID) {
        String sql ="DELETE FROM classification WHERE classificationID=?";
        try {
            queryRunner.update(sql,classificationID);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Classification> getAll() {
        String sql = "select * from classification";
        try {
            return queryRunner.query(sql, new BeanListHandler<Classification>(Classification.class));
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    @Override
    public Classification getClassification(String classificationId) {
        String sql = "select * from classification where classificationId = ?";
        try {
            return queryRunner.query(sql, new BeanHandler<Classification>(Classification.class), classificationId);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
}
