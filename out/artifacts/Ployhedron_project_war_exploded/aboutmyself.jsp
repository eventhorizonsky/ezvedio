<%--
  Created by IntelliJ IDEA.
  User: 徐翼展
  Date: 2021/7/18
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>个人资料</title>
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/mdui@1.0.1/dist/css/mdui.min.css"
          integrity="sha384-cLRrMq39HOZdvE0j6yBojO4+1PrHfB7a9l5qLcmRm/fiWXYY+CndJPmyu5FV/9Tw"
          crossorigin="anonymous"/>
</head>
<body class="mdui-appbar-with-toolbar mdui-theme-primary-indigo mdui-theme-accent-pink mdui-theme-layout-auto mdui-loaded" style="background-color: #fafafa;">
<%
  if(request.getSession().getAttribute("user") != null) {
%>
<!-- 首页导航栏 -->
<div class="mdui-appbar  mdui-appbar-fixed ">
  <div class="mdui-toolbar mdui-color-theme">
    <a href="javascript:;" class="mdui-btn mdui-btn-icon" mdui-drawer="{target: '#left-drawer'}"><i class="mdui-icon material-icons">menu</i></a>
    <a href="index.jsp;" class="mdui-typo-headline">EZ-VEDIO</a>
    <div class="mdui-toolbar-spacer"></div>
    <%
      if(request.getSession().getAttribute("user") != null) {
    %>
    <a href="aboutmyself.jsp" target="_blank">
      <div class="mdui-card-header">
        <img class="mdui-card-header-avatar" src="http://q1.qlogo.cn/g?b=qq&nk=${user.qq}&s=640"/>
        <div class="mdui-card-header-title" style="padding-top: 10px;" s>${user.userName}</div>
      </div></a>
    <%
    }else {%>
    <a href="login.jsp" target="_blank">
      <div class="mdui-card-header">
        <img class="mdui-card-header-avatar" src="https://www.ezsky.xyz/wp-content/uploads/2020/07/blackhole.png"/>
        <div class="mdui-card-header-title" style="padding-top: 10px;" s>未登录</div>
      </div></a>
    <%}%>
  </div>
</div>

<!-- 抽屉式侧边栏 -->
<div class="mdui-drawer mdui-drawer-close mdui-shadow-1" id="left-drawer"  style="background-color: #ffffff;box-shadow: 1px 0px 1px #e0e0e0;">

  <ul class="mdui-list">
    <a href="list">
      <li class="mdui-list-item mdui-ripple">
        <i class="mdui-icon material-icons mdui-list-item-icon">&#xe88a;</i>
        <div class="mdui-list-item-content">首页</div>
      </li>
    </a>

  </ul>
</div>
<div class="mdui-container">

  <div class="mdui-center" style="width: 40%;border-radius:4px;box-shadow:5px 5px 5px 5px #888;margin-top:30px " >
    <div >
      <div class="mdui-card">

        <!-- 卡片头部，包含头像、标题、副标题 -->
        <div class="mdui-card-header">
          <img class="mdui-card-header-avatar" src="http://q1.qlogo.cn/g?b=qq&nk=${user.qq}&s=640"/>
          <div class="mdui-card-header-title">${user.userName}</div>
          <div class="mdui-card-header-subtitle">邮箱：${user.userEmail}</div>
        </div>


        <!-- 卡片的内容 -->
        <div class="mdui-card-content">QQ：${user.qq}</div>
        <div class="mdui-card-content">电话号码：${user.userPnum}</div>


        <!-- 卡片的按钮 -->
        <div class="mdui-card-actions">
          <a href="edituser.jsp"><button class="mdui-btn mdui-ripple mdui-float-right mdui-color-theme-accent">编辑个人资料</button></a>
        </div>

      </div>
      <div>
      </div>
    </div>
  </div>
</div>
<script
        src="https://cdn.jsdelivr.net/npm/mdui@1.0.1/dist/js/mdui.min.js"
        integrity="sha384-gCMZcshYKOGRX9r6wbDrvF+TcCCswSHFucUzUPwka+Gr+uHgjlYvkABr95TCOz3A"
        crossorigin="anonymous"
></script>
</body>
</html>
<%
  }
  else{
    //若直接进入index.jsp则跳转回主页
    request.getRequestDispatcher("list").forward(request,response);
  }
%>