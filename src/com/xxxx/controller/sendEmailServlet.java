package com.xxxx.controller;

import com.xxxx.entity.User;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.UserService;
import com.xxxx.util.Mail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.mail.MessagingException;
import java.io.IOException;
import java.security.GeneralSecurityException;

@WebServlet("/sendEmail")
public class sendEmailServlet extends HttpServlet {
    private UserService userService = new UserService();

    /**
     * 发送邮箱验证码
     * 1.接收客户端的请求(接收参数:电子邮箱)
     * 2.调用service层判断邮箱是否为空, 邮箱是否存在,返回消息模型对象
     *3.判断消息模型状态码
     *      如果状态码为1, 将消息模型设置到session作用域中并调用Mail类的方法并将返回的验证码保存在session中,重定向跳转到发送验证码界面
     *      如果状态码为0, 将消息模型对象设置到request作用域中, 请求跳转到验证邮箱界面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收客户端的请求(接收参数:电子邮箱)
        String uemail = request.getParameter("uemail");

        //2.调用service层方法,返回消息模型对象
        MessageModel messageModel = userService.usersendEmail(uemail);
        if(messageModel.getCode() != 1) {
            //将消息模型对象设置到request作用域中, 请求转发跳转到发送验证码界面
            request.setAttribute("messagemodel", messageModel);
            request.getRequestDispatcher("sendEmail.jsp").forward(request, response);
        }
        else{
            //将用户信息设置到session作用域中, 并调用Mail类的方法发送信息并返回验证码, 将验证码保存在session中
            request.getSession().setAttribute("messagemodel", messageModel.getObject());
            User user = (User)request.getSession().getAttribute("messagemodel");

            //将用户邮箱设置在session作用域中
            request.getSession().setAttribute("uemail", user.getUserEmail());

            String uname = user.getUserName();
            try {
                request.getSession().setAttribute("vocde", Mail.sendMessage(uname, uemail));
            } catch (GeneralSecurityException e) {
                e.printStackTrace();
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            //重定向跳转回发送验证码界面
            response.sendRedirect("sendEmail.jsp");
        }
    }
}
