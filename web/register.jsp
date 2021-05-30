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

<!-- 账号注册框 -->
<div class="mdui-shadow-1 mdui-center mdui-m-b-5" style="background-color:white;height:690px;width:450px;border-radius:4px;margin-top: 50px;">
  <div class="mdui-typo-headline" style="border-radius:4px;height: 80px;opacity:0.8;">
    &nbsp;
    <a style="opacity:1;font-size: 12px;text-decoration:none;color: blue;" href="login.jsp">返回登录</a>
    <div class="mdui-valign" style="padding: 1px;"><p class="mdui-center"><img class="mdui-img-circle" src="logo.png"/>举贤网登录</p></div>
  </div>
  <div class="mdui-m-l-3 mdui-m-r-3" >

    <form action="register" method="post" id="loginForm">
      <div class="mdui-textfield mdui-textfield-floating-label">
        <label class="mdui-textfield-label">姓&nbsp;&nbsp;名：</label>
        <input class="mdui-textfield-input" type="text" name="uname" id="uname" value="${messageModel.object.userName}"/>
      </div>
      <div class="mdui-textfield mdui-textfield-floating-label">
        <label class="mdui-textfield-label">密&nbsp;&nbsp;码：</label>
        <input class="mdui-textfield-input" type="password" name="upwd" id="upwd" value="${messageModel.object.userPwd}"/>
      </div>
      <div class="mdui-textfield mdui-textfield-floating-label">
        <label class="mdui-textfield-label">确认密码：</label>
        <input class="mdui-textfield-input" type="password" id="cupwd"/>
      </div>
      <div class="mdui-textfield mdui-textfield-floating-label">
        <label class="mdui-textfield-label">联系方式：</label>
        <input class="mdui-textfield-input" type="password" name="upnum" id="upnum" value="${messageModel.object.userPnum}"/>
      </div>
      <div class="mdui-textfield mdui-textfield-floating-label">
        <label class="mdui-textfield-label">电子邮箱：</label>
        <input class="mdui-textfield-input" type="email" name="uemail" id="uemail" value="${messageModel.object.userEmail}"/><br>
      </div>
      <div class="mdui-textfield mdui-textfield-floating-label" style="margin-top: -12px;">
        <label class="mdui-textfield-label">验证码：</label>
        <input class="mdui-textfield-input" type="email"/><br>
      </div>
      <div class="mdui-valign">
        <span class="mdui-center" id="msg" style="font-size: 12px;letter-spacing:3px;opacity:0.5;color: red;">${messageModel.msg}</span>
      </div>
      <div class="mdui-m-t-3 mdui-m-b-4">
        <button class="mdui-btn mdui-btn-raised mdui-btn-block mdui-color-theme-600" type="button" id="loginBtn">注册</button>
      </div>
    </form>
  </div>
</div>

<script
        src="https://cdn.jsdelivr.net/npm/mdui@1.0.1/dist/js/mdui.min.js"
        integrity="sha384-gCMZcshYKOGRX9r6wbDrvF+TcCCswSHFucUzUPwka+Gr+uHgjlYvkABr95TCOz3A"
        crossorigin="anonymous"
></script>
</body>
<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  /*
    注册表单验证
1.给注册按钮绑定点击事件(通过id选择器绑定)
2.获取用户姓名、密码、确定密码、电子邮箱、联系方式的值
3.判断姓名是否为空
    如果姓名为空,提示用户(span标签赋值),并且return
3.判断密码是否为空
    如果密码为空,提示用户(span标签赋值),并且return
4.判断确认密码是否为空
    如果确认密码为空则return
5.判断确认密码和密码是否相等
    如果不相等则return
6.如果都不为空,则手动提交表单
 */
  $("#loginBtn").click(function(){
    //获取用户姓名、密码、确定密码、电子邮箱、联系方式的值
    var uname = $("#uname").val();
    var upwd = $("#upwd").val();
    var cupwd = $("#cupwd").val();
    var upnum = $("#upnum").val();
    var uemail = $("#uemail").val();

    //判断姓名是否为空
    if(isEmpty(uname)) {
      //  如果姓名为空,提示用户(span标签赋值),并且return html()
      $("#msg").html("用户姓名不可为空!");
      return;
    }
    //  判断密码是否为空
    if(isEmpty(upwd)) {
      //  如果密码为空,提示用户(span标签赋值),并且return html()
      $("#msg").html("用户密码不可为空!");
      return;
    }
    //  判断确认密码是否为空
    if(isEmpty(cupwd)) {
      //  如果确认密码为空,提示用户(span标签赋值),并且return html()
      $("#msg").html("用户确认密码不可为空!");
      return;
    }
    //  判断确认密码与密码是否一致
    if(upwd!=cupwd) {
      //  两次密码不一致,提示用户(span标签赋值),并且return html()
      $("#msg").html("请保持两次输入的密码一致!");
      return;
    }
    //  判断联系方式是否为空
    if(isEmpty(upnum)) {
      //  如果联系方式为空,提示用户(span标签赋值),并且return html()
      $("#msg").html("联系方式不可为空!");
      return;
    }
    //  判断邮箱是否为空
    if(isEmpty(uemail)) {
      //  如果邮箱为空,提示用户(span标签赋值),并且return html()
      $("#msg").html("邮箱不可为空!");
      return;
    }
    //  如果都不为空,则手动提交表单
    $("#loginForm").submit();
  });

  /*
    判断字符串是否为空
        如果为空,返回true
        如果不为空,返回false
*/
  function isEmpty(str){
    if(str == null || str.trim() == ""){  //str.trim()取出前后空格
      return true;
    }
    return false;
  }
</script>
</html>
