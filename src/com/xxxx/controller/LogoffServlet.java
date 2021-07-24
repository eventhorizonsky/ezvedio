package com.xxxx.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/logoff")
public class LogoffServlet extends HttpServlet {
    /**
     * 注销功能
     * 1.接收客户端请求
     * 2.将session作用域中的user置空, 并刷新界面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收客户端的请求

        //将session作用域中的user置空,并刷新界面
        request.getSession().setAttribute("user", null);
        response.sendRedirect("index.jsp");
    }
}
