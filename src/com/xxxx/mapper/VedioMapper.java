package com.xxxx.mapper;

import com.xxxx.entity.Vedio;

import java.util.List;

public interface VedioMapper {
    int totalcount();

    public Vedio quaryvediobyid(int vedioid);

    List<Vedio> queryVedioByPage(int pagestart, int pagesize);

    List<Vedio> queryVedioBysid(String vedioname);

    void insertvedio(String vedioname, String imgurl, String introduction, String s, String s1, int sid);
}
