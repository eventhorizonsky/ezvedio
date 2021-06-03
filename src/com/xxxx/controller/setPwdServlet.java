package com.xxxx.controller;


import com.xxxx.entity.vo.MessageModel;
import com.xxxx.mapper.UserMapper;
import com.xxxx.service.UserService;
import com.xxxx.util.GetSqlSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;

@WebServlet("/setPwd")
public class setPwdServlet extends HttpServlet {
    /**
     * 忘记密码后重新设置密码
     * 1.接收客户端的请求(接收参数: 用户密码)
     * 2.调用service层的方法, 返回消息模型对象
     * 3.判断消息模型对象的状态码
     *      如果状态码为0, 将消息模型对象设置在request作用域中, 请求转发跳转到设置密码界面
     *      如果状态码为1, 接收session中的用户邮箱,
     *      通过调用UserMapper中的通过电子邮箱修改密码的方法修改密码, 并重定向跳转到登录界面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        //1.接收客户端的请求(接收参数: 用户密码)
        String upwd = request.getParameter("upwd");

        //2.调用service层的方法, 返回消息模型对象
        MessageModel messageModel = userService.setPwd(upwd);

        //3.判断消息模型对象的状态码
        if(messageModel.getCode() == 1){
            //如果状态码为1,接收session中的用户邮箱
            String uemail = (String)request.getSession().getAttribute("uemail");
            //调用UserMapper接口中的通过用户邮箱修改密码的方法
            SqlSession session = GetSqlSession.createSqlSession();
            UserMapper userMapper = session.getMapper(UserMapper.class);
            userMapper.updatePwdByEmail(uemail, upwd);
            //重定向跳转到登录界面
            response.sendRedirect("login.jsp");
        }
        else {
            //如果状态码为0, 将消息模型对象设置在request作用域中, 请求转发跳转到设置密码界面
            request.setAttribute("messagemodel", messageModel);
            request.getRequestDispatcher("setPwd.jsp").forward(request, response);
        }

    }
}
