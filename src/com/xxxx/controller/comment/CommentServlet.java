package com.xxxx.controller.comment;

import com.xxxx.entity.Comment;
import com.xxxx.entity.SeachResult;
import com.xxxx.entity.Vedio;
import com.xxxx.entity.vo.SearchModel;
import com.xxxx.service.CommentService;
import com.xxxx.service.VedioService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/comments") //添加注解

public class CommentServlet extends HttpServlet {
    private VedioService vedioService = new VedioService();
    private CommentService commentService = new CommentService();
    private SeachResult seachResult=new SeachResult();

    /**
     *用户注册
     * 1.接收客户端的请求(接收参数: 用户名, 用户密码, 联系方式, 电子邮箱)
     * 2.调用service层的方法, 并返回消息模型对象
     * 3.判断消息模型对象的状态码
     *     如果状态码为0
     *         将消息模型对象设置到request作用域中, 请求转发跳转到注册界面(register.jsp)
     *     如果状态码为1
     *         将消息模型对象设置到session作用域中, 重定向跳转到登陆界面(login.jsp)
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String userid=request.getParameter("userid");
        String username=request.getParameter("username");
        String comment=request.getParameter("comment");
        String qq=request.getParameter("qq");
        int vedioid= Integer.parseInt(request.getParameter("vedioid"));
        CommentService commentService=new CommentService();
        commentService.insertcomment(userid,username,comment,qq,vedioid);
        response.sendRedirect("vedio?vedioid="+vedioid);


    }


}