package com.xxxx.entity;

public class Comment {
    private String userid;
    private String username;
    private String qq;
    private String comment;
    private String commentid;
    private String vedioid;

    public String getCommentid() {
        return commentid;
    }

    public void setCommentid(String commentid) {
        this.commentid = commentid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getVedioid() {
        return vedioid;
    }

    public void setVedioid(String vedioid) {
        this.vedioid = vedioid;
    }
}
