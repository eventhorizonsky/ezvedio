package com.xxxx.controller;

import com.xxxx.entity.User;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/edituser") //添加注解

public class edituser extends HttpServlet {

    //实例化UserService对象
    private UserService userService = new UserService();


    /**
     * 用户登录
     1.接收客户端的请求(接收参数: 电子邮箱, 密码)
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String userid= request.getParameter("userid");
        //1.接收客户端的请求
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");
        String upnum = request.getParameter("upnum");
        String uemail = request.getParameter("uemail");
        String qq = request.getParameter("qq");
        String yzm = request.getParameter("yzm");

        //2.调用service层的方法, 返回消息模型对象
        MessageModel messageModel = userService.edituser(uname, upwd, upnum, uemail,qq,yzm,userid);

        //3.判断消息状态码
        if(messageModel.getCode() == 1){  //成功
            //将消息模型中的用户信息设置到session作用域中, 重定向跳转到login.jsp

            User user=userService.quaryuserbyid(userid);
            request.getSession().setAttribute("user", user);
            response.sendRedirect("aboutmyself.jsp");
        } else {  //失败
            //将消息模型对象设置到request作用域中, 请求转发跳转到signup.jsp
            request.setAttribute("messageModel", messageModel);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }


}
