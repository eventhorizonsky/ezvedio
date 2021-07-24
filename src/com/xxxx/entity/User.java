package com.xxxx.entity;

/*
* 用户实体类
* */
public class User {
    private String userName; //用户姓名
    private String userPwd; //用户密码
    private String userPnum; //联系方式
    private String userEmail; //电子邮箱
    private String qq;
    private String userid;

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public User() {

    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserPnum() {
        return userPnum;
    }

    public void setUserPnum(String userPnum) {
        this.userPnum = userPnum;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public User(String userName, String userPwd, String userPnum, String userEmail) {
        this.userName = userName;
        this.userPwd = userPwd;
        this.userPnum = userPnum;
        this.userEmail = userEmail;
    }
}
