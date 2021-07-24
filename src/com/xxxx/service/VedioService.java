package com.xxxx.service;

import com.xxxx.entity.Vedio;
import com.xxxx.entity.vo.SearchModel;
import com.xxxx.mapper.CommentMapper;
import com.xxxx.mapper.UserMapper;
import com.xxxx.mapper.VedioMapper;
import com.xxxx.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class VedioService {
    public Vedio quaryvediobyid(int vedioid) {
        Vedio vedio=new Vedio();
        SqlSession session = GetSqlSession.createSqlSession();
        VedioMapper vedioMapper=session.getMapper(VedioMapper.class);
        vedio= vedioMapper.quaryvediobyid(vedioid);
        return vedio;
    }

    public SearchModel listvediobypage(int pagestart, int pagesize) {
        SqlSession session= GetSqlSession.createSqlSession();
        VedioMapper vedioMapper=session.getMapper(VedioMapper.class);
        List<Vedio> vedio;
        vedio= vedioMapper.queryVedioByPage(pagestart,pagesize);
        int totalcount=vedioMapper.totalcount();
        SearchModel searchModel=new SearchModel();
        searchModel.setDate(vedio);
        searchModel.setTotalCount(totalcount);


        return searchModel;
    }

    public SearchModel listvediobysid(String vedioname) {
        SqlSession session= GetSqlSession.createSqlSession();
        VedioMapper vedioMapper=session.getMapper(VedioMapper.class);
        List<Vedio> vedio= vedioMapper.queryVedioBysid(vedioname);
        int totalcount=vedioMapper.totalcount();
        SearchModel searchModel=new SearchModel();
        searchModel.setDate(vedio);
        searchModel.setTotalCount(totalcount);


        return searchModel;
    }

    public void addvedio(String vedioname, String imgurl, String introduction, String s, String s1, int sid) {
        SqlSession session= GetSqlSession.createSqlSession();
        VedioMapper vedioMapper=session.getMapper(VedioMapper.class);
        vedioMapper.insertvedio(vedioname,imgurl,introduction,s,s1,sid);
        session.commit();
    }
}
