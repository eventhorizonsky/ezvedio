package com.xxxx.mapper;

import com.xxxx.entity.User;
import org.apache.ibatis.annotations.Param;

/*
* 用户接口类
* */
public interface UserMapper {
    public User queryUserByName(String userName);
    public User queryUserByPnum(String userPnum);
    public User queryUserByEmail(String userEmail);
    public void insertUser(User user);
    public void deleteUserById(Integer userId);
    public void updatePwdById(@Param("userId") Integer userId, @Param("userPwd") String userPwd); //多个返回值，使用注解
}
