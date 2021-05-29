package com.xxxx.controller;

import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login") //添加注解

public class UserServlet extends HttpServlet {

    //实例化UserService对象
    private UserService userService = new UserService();

    /**
     * 用户登录
         1.接收客户端的请求(接收参数: 姓名, 密码)
         2.调用service层的方法, 返回消息模型对象
         3.判断消息模型状态码
             如果状态码是失败
                将消息模型对象设置到request作用域中, 请求转发跳转到login.jsp
             如果状态码是成功
                将消息模型中的用户信设置到session作用域中, 重定向跳转到index.jsp
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收客户端的请求(接收参数: 姓名, 密码)
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");

        //2.调用service层的方法, 返回消息模型对象
        MessageModel messageModel = userService.userLogin(uname, upwd);
        //3.判断消息模型状态码
        if(messageModel.getCode() == 1){ //成功
            //将消息模型中的用户信设置到session作用域中, 重定向跳转到index.jsp
            request.getSession().setAttribute("user", messageModel.getObject());
            response.sendRedirect("index.jsp");  // 重定向跳转
        } else { //失败
            //将消息模型对象设置到request作用域中, 请求转发跳转到login.jsp
            request.setAttribute("messageModel", messageModel);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }
}
