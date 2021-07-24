package com.xxxx.controller.vedio;


import com.xxxx.entity.Vedio;
import com.xxxx.entity.User;
import com.xxxx.entity.vo.SearchModel;
import com.xxxx.service.UserService;

import com.xxxx.entity.SeachResult;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.VedioService;
import com.xxxx.util.bvtoav;

import javax.naming.directory.SearchResult;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/addvedio")
public class addvedio extends HttpServlet {
    //实例化Usersevice对象
    private UserService userService=new UserService();
    private SeachResult seachResult=new SeachResult();
    private VedioService vedioService=new VedioService();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String vedioname=request.getParameter("vedioname");
        String imgurl=request.getParameter("imgurl");
        String introduction=request.getParameter("introduction");
        String url =request.getParameter("url");
        String bid =request.getParameter("bid");
        String[] theurl = url.split(";");
        String[] thebid=new String [theurl.length];
        String[] theaid=new String [theurl.length];
        for (int i = 0; i < theurl.length; ++i){
           theaid[i]="";
        }
        if (bid!=null&&!"".equals(bid)){
            thebid= bid.split(";");
            theaid= bvtoav.BVTOAV(thebid);

        }

        for (int i = 0; i < theurl.length; ++i){
           int sid=i+1;
           vedioService.addvedio(vedioname,imgurl,introduction,theurl[i],theaid[i],sid);
        }

        response.sendRedirect("list");







    }


}




