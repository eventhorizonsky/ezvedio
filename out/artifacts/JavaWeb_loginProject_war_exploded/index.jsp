<%--
  Created by IntelliJ IDEA.
  User: AnotherH
  Date: 2021-05-25
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
    <%
      if(request.getSession().getAttribute("user") != null) {
    %>
    <h4>欢迎${user.userName}登录</h4>
    <%
      }
      else{
        //若直接进入index.jsp则跳转回主页
        request.getRequestDispatcher("login.jsp").forward(request,response);
      }
    %>


  </body>
</html>
