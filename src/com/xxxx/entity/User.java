package com.xxxx.entity;

/*
* 用户实体类
* */
public class User {
    private Integer userId; //用户编号
    private String userName; //用户姓名
    private String userPwd; //用户密码
    private Integer userAge; //用户年龄

    public User() {

    }

    public User(Integer userId, String userName, String userPwd, Integer userAge) {
        this.userId = userId;
        this.userName = userName;
        this.userPwd = userPwd;
        this.userAge = userAge;
    }

    public Integer getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public Integer getUserAge() {
        return userAge;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public void setUserAge(Integer userAge) {
        this.userAge = userAge;
    }
}
