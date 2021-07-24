package com.xxxx.controller.vedio;


import com.xxxx.entity.Vedio;
import com.xxxx.entity.User;
import com.xxxx.entity.vo.SearchModel;
import com.xxxx.service.UserService;

import com.xxxx.entity.SeachResult;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.VedioService;

import javax.naming.directory.SearchResult;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/list")
public class listvedio extends HttpServlet {
    //实例化Usersevice对象
    private UserService userService=new UserService();
    private SeachResult seachResult=new SeachResult();
    private VedioService vedioService=new VedioService();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pagenowstr=request.getParameter("pagenow");
        int pagenow=1;
        if (pagenowstr!=null&&!"".equals(pagenowstr)){
            pagenow=Integer.parseInt(pagenowstr);

        }
        seachResult.setPagenow(pagenow);

        int pagestart=seachResult.GetStart();
        int pagesize=seachResult.getPagesize();
        SearchModel searchModel=new SearchModel();
        searchModel= vedioService.listvediobypage(pagestart,pagesize);
        List<Vedio> vedio=searchModel.getDate();
        searchModel.setPagenow(pagenow);
        request.getSession().setAttribute("searchvedio",searchModel);
        request.getSession().setAttribute("vediolist",vedio);
        response.sendRedirect("index.jsp");







    }


}




