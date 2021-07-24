package com.xxxx.service;

import com.xxxx.entity.Comment;
import com.xxxx.entity.Vedio;
import com.xxxx.entity.vo.SearchModel;
import com.xxxx.mapper.CommentMapper;
import com.xxxx.mapper.VedioMapper;
import com.xxxx.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class CommentService {
    public SearchModel listcommentbyvedioid(int vedioid,int pagestart, int pagesize) {
        SqlSession session= GetSqlSession.createSqlSession();
        CommentMapper commentMapper=session.getMapper(CommentMapper.class);
        List<Comment> comments= commentMapper.listcommentbyvedioid(vedioid,pagestart,pagesize);
        int totalcount=commentMapper.totalcount(vedioid);
        SearchModel searchModel=new SearchModel();
        searchModel.setDate(comments);
        searchModel.setTotalCount(totalcount);


        return searchModel;
    }

    public void insertcomment(String userid, String username, String comment, String qq, int vedioid) {
        SqlSession session= GetSqlSession.createSqlSession();
        CommentMapper commentMapper=session.getMapper(CommentMapper.class);
        commentMapper.insertcomment(userid,username,comment,qq,vedioid);
        session.commit();
    }
}
