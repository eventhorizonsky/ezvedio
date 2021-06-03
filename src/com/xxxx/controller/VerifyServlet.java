package com.xxxx.controller;

import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.jws.soap.SOAPBinding;
import java.io.IOException;

@WebServlet("/verify")
public class VerifyServlet extends HttpServlet {
    UserService userService = new UserService();
    /**
     * 判断邮箱验证码是否一致
     * 1.接收客户端的请求(接收参数: 验证码)
     * 2.接收session作用域中的验证码
     * 3.调用service层的方法, 判断验证码是否为空, 是否和session中的验证码一致,并返回消息模型对象
     * 4.判断消息模型状态码
     *         如果状态码为1, 将验证码存入消息模型对象中返回, 并将消息模型对象设置到session作用域中, 重定向跳转到设置用户密码界面
     *         如果状态码为0, 将消息模型对象设置到request作用域中, 请求转发跳转到发送验证码界面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收前台传来的验证码
        String code = request.getParameter("code");
        //接收session作用域中的验证码
        String vcode = (String)request.getSession().getAttribute("vcode");
        //调用service层的方法, 返回消息模型对象
        MessageModel messageModel = userService.userVcode(code, vcode);
        //判断消息模型的状态码
        if(messageModel.getCode() == 1) {
            //验证成功重定向跳转到重新设置密码界面

            response.sendRedirect("setPwd.jsp");
        }
        else {
            //将消息模型对象设置到request作用域中, 请求转发跳转到发送电子邮箱界面
            request.setAttribute("messagemodel", messageModel);
            request.getRequestDispatcher("sendEmail.jsp").forward(request, response);
        }
    }
}
