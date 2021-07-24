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
  
    public void insertUserData(@Param("userEmail") String userEmail);

    //多个参数值，使用注解 @Params("")双引号中的名称与UserMapper.xml中的sql语句#{}大括号中的内容对应
    public void updatePwdByEmail(@Param("userEmail") String userEmail, @Param("userPwd") String userPwd);

    public void updatePwdById(@Param("userId") Integer userId, @Param("userPwd") String userPwd); //多个参数值，使用注解

    void insertUser(String uname, String upwd, String upnum, String uemail, String qq);

    User quaryuserbyid(String userid);

    void updateUserbyid(String uname, String upwd, String upnum, String uemail, String qq, String userid);
}
