package com.xxxx.test;

import com.xxxx.entity.User;
import com.xxxx.entity.Vedio;
import com.xxxx.entity.vo.SearchModel;
import com.xxxx.mapper.UserMapper;
import com.xxxx.mapper.VedioMapper;
import com.xxxx.service.VedioService;
import com.xxxx.util.GetSqlSession;
import com.xxxx.util.bvtoav;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class Test {
    private static VedioService vedioService = new VedioService();
    public static void main(String[] args) {
        String str ="";
        String[] strArr = str.split(";");
        String[] aid= bvtoav.BVTOAV(strArr);
        for (int i = 0; i < aid.length; ++i){
            System.out.println(aid[i]);
        }
//        Vedio vedio1=vedioService.quaryvediobyid("1");
//        SqlSession session= GetSqlSession.createSqlSession();
//        VedioMapper vedioMapper=session.getMapper(VedioMapper.class);
//        List<Vedio> vedio= vedioMapper.queryVedioBysid(vedio1.getVedioname());
//        int totalcount=vedioMapper.totalcount();
//        SearchModel searchModel=new SearchModel();
//        searchModel.setDate(vedio);
//        searchModel.setTotalCount(totalcount);
//        System.out.println(vedio);
    }
}
