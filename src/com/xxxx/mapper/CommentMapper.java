package com.xxxx.mapper;

import com.xxxx.entity.Comment;

import java.util.List;

public interface CommentMapper {
    List<Comment> listcommentbyvedioid(int vedioid,int pagestart, int pagesize);

    int totalcount(int vedioid);

    void insertcomment(String userid, String username, String comment, String qq, int vedioid);
}
