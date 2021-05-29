<%--
  Created by IntelliJ IDEA.
  User: 翀螟
  Date: 2021/5/29
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/mdui@1.0.1/dist/css/mdui.min.css"
          integrity="sha384-cLRrMq39HOZdvE0j6yBojO4+1PrHfB7a9l5qLcmRm/fiWXYY+CndJPmyu5FV/9Tw"
          crossorigin="anonymous"/>
</head>
<body class="mdui-drawer-body-left mdui-appbar-with-toolbar mdui-theme-primary-indigo mdui-theme-accent-pink mdui-theme-layout-auto mdui-loaded" style="background-color: #fafafa;">

<!-- 首页导航栏 -->
<div class="mdui-appbar  mdui-appbar-fixed">
  <div class="mdui-toolbar mdui-color-theme">
    <a href="javascript:;" class="mdui-btn mdui-btn-icon" mdui-drawer="{target: '#left-drawer'}"><i class="mdui-icon material-icons">menu</i></a>
    <a href="javascript:;" class="mdui-typo-headline">举贤</a>
    <a href="javascript:;" class="mdui-typo-title">大学生多元兼职平台</a>
    <div class="mdui-toolbar-spacer"></div>
    <a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>
    <a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>
    <a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">settings</i></a>
  </div>
</div>

<!-- 抽屉式侧边栏 -->
<div class="mdui-drawer mdui-shadow-1" id="left-drawer"  style="top:63px;background-color: #ffffff;box-shadow: 1px 0px 1px #e0e0e0;">
  <ul class="mdui-list">
    <li class="mdui-list-item mdui-ripple">
      <i class="mdui-icon material-icons mdui-list-item-icon">person</i>
      <div class="mdui-list-item-content">登录/注册</div>
    </li>
    <li class="mdui-list-item mdui-ripple">
      <i class="mdui-list-item-icon mdui-icon material-icons">star</i>
      <div class="mdui-list-item-content">招聘</div>
    </li>
    <li class="mdui-list-item mdui-ripple">
      <i class="mdui-list-item-icon mdui-icon material-icons">send</i>
      <div class="mdui-list-item-content">应聘</div>
    </li>
    <li class="mdui-list-item mdui-ripple">
      <!-- <i class="mdui-list-item-icon mdui-icon material-icons">drafts</i> -->
      <i class="mdui-icon material-icons mdui-list-item-icon">exit_to_app</i>
      <div class="mdui-list-item-content">退出</div>
    </li>
  </ul>
</div>

<!-- 账号登录框 -->
<form action="register">
<div class="mdui-shadow-1 mdui-center mdui-m-b-3" style="background-color:white;height:850px;width:450px;border-radius:4px;margin-top: 100px;">
  <div class="mdui-typo-headline" style="border-radius:4px;height: 80px;opacity:0.5;">
    <div class="mdui-valign" style="padding: 18px;"><p class="mdui-center"><img class="mdui-img-circle" src="logo.png"/>举贤网登录</p></div>
  </div>
  <div class="mdui-m-l-3 mdui-m-r-3" >
    <div class="mdui-textfield mdui-textfield-floating-label">
      <label class="mdui-textfield-label">姓&nbsp;&nbsp;名：</label>
      <input class="mdui-textfield-input" type="text"/>
    </div>
    <div class="mdui-textfield" style="height: 25px;">
      <span class="mdui-valign" style="opacity:0.5;">
        <p class="mdui-text-left">性&nbsp;&nbsp;别：<input type="radio" name="sex" id="sex"/>男<input type="radio" name="sex" id="sex"/>女</p>
      </span>
    </div>
    <div class="mdui-textfield mdui-textfield-floating-label">
      <label class="mdui-textfield-label">密&nbsp;&nbsp;码：</label>
      <input class="mdui-textfield-input" type="password"/>
    </div>
    <div class="mdui-textfield mdui-textfield-floating-label">
      <label class="mdui-textfield-label">确认密码：</label>
      <input class="mdui-textfield-input" type="password"/>
    </div>
    <div class="mdui-textfield mdui-textfield-floating-label">
      <label class="mdui-textfield-label">联系方式：</label>
      <input class="mdui-textfield-input" type="password"/>
    </div>
    <div class="mdui-textfield mdui-textfield-floating-label">
      <label class="mdui-textfield-label">电子邮箱：</label>
      <input class="mdui-textfield-input" type="email"/>
    </div>
    <div class="mdui-textfield mdui-textfield-floating-label">
      <label class="mdui-textfield-label">工作经历：</label>
      <textarea class="mdui-textfield-input"></textarea>
    </div>
    <div class="mdui-textfield mdui-textfield-floating-label">
      <label class="mdui-textfield-label">荣誉获得：</label>
      <textarea class="mdui-textfield-input"></textarea>
    </div>
    <div class="mdui-textfield mdui-textfield-floating-label">
      <label class="mdui-textfield-label">荣誉证明：</label>
      <input class="mdui-textfield-input" type=""/><br>
    </div>
    <div class="mdui-m-t-3 mdui-m-b-3">
      <button class="mdui-btn mdui-btn-raised mdui-btn-block mdui-color-theme-600">注册</button>
    </div>
  </div>
</div>
</form>

<script
        src="https://cdn.jsdelivr.net/npm/mdui@1.0.1/dist/js/mdui.min.js"
        integrity="sha384-gCMZcshYKOGRX9r6wbDrvF+TcCCswSHFucUzUPwka+Gr+uHgjlYvkABr95TCOz3A"
        crossorigin="anonymous"
></script>
</body>
</html>
