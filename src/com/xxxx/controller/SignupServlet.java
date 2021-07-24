package com.xxxx.controller;

import com.xxxx.entity.User;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.mapper.UserMapper;
import com.xxxx.service.UserService;
import com.xxxx.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/register") //添加注解

public class SignupServlet extends HttpServlet {
    private UserService userService = new UserService();

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
        //1.接收客户端的请求
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");
        String upnum = request.getParameter("upnum");
        String uemail = request.getParameter("uemail");
        String qq = request.getParameter("qq");
        String yzm = request.getParameter("yzm");

        //2.调用service层的方法, 返回消息模型对象
        MessageModel messageModel = userService.userSignup(uname, upwd, upnum, uemail,qq,yzm);

        //3.判断消息状态码
        if(messageModel.getCode() == 1){  //成功
            //将消息模型中的用户信息设置到session作用域中, 重定向跳转到login.jsp
            request.setAttribute("messageModel", messageModel);
            response.sendRedirect("login.jsp");
        } else {  //失败
            //将消息模型对象设置到request作用域中, 请求转发跳转到signup.jsp
            request.setAttribute("messageModel", messageModel);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }


    }
}
