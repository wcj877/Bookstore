package com.wsgs.bookstore.dao.impl;

import com.wsgs.bookstore.dao.UsersDao;
import com.wsgs.bookstore.data.Users;
import com.wsgs.bookstore.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

public class UsersImpl implements UsersDao {
    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void add(Users user) {
        String sql =" INSERT users(userID,userPassword,phone,userName,money,address) VALUES(?,?,?,?,?,?)";
        try {
            queryRunner.update(sql,user.getUserID(),user.getUserPassword(),user.getPhone(),user.getUserName(),user.getMoney(),user.getAddress());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Users user) {
        String sql =" update users set money=? where userID=?";
        try {
            queryRunner.update(sql,user.getMoney(),user.getUserID());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Users getUsers(String id, String password) {
        String sql =" select * from users where userID='" + id + "' and userPassword='" + password + "';";
        try {
            return queryRunner.query(sql, new BeanHandler<Users>(Users.class));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
