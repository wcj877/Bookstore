package com.wsgs.bookstore.dao;

import com.wsgs.bookstore.data.Users;

import java.util.List;

public interface UsersDao {

    /**
     * 增加用户
     * @param user
     * @return
     */
    void add(Users user);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    void update(Users user);

    /**
     * 判断用户及密码是否存在并返回此用户
     * @param id
     * @param password
     * @return
     */
    Users getUsers(String id, String password);
}
