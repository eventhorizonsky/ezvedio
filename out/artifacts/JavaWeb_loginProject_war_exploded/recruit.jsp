
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
  <title>招聘</title>
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
    <a href="login.jsp">
      <li class="mdui-list-item mdui-ripple">
        <i class="mdui-icon material-icons mdui-list-item-icon">person</i>
        <div class="mdui-list-item-content">登录/注册</div>
      </li>
    </a>
    <a href="javascript:;">
      <li class="mdui-list-item mdui-ripple">
        <i class="mdui-list-item-icon mdui-icon material-icons">star</i>
        <div class="mdui-list-item-content">招聘</div>
      </li>
    </a>
    <a href="employ.jsp">
      <li class="mdui-list-item mdui-ripple">
        <i class="mdui-list-item-icon mdui-icon material-icons">send</i>
        <div class="mdui-list-item-content">应聘</div>
      </li>
    </a>
    <li class="mdui-list-item mdui-ripple">
      <i class="mdui-icon material-icons mdui-list-item-icon">exit_to_app</i>
      <div class="mdui-list-item-content">退出</div>
    </li>
  </ul>
</div>

<div style="width: 100%">
  <div  class="mdui-center" >
    <!-- 招聘卡片 -->
    <div class="mdui-valign" style="margin: 20px 20px;" >
      <div class="mdui-row" style="padding-top:10px;height: 660px;width: 1396px;margin-right: 180px;margin-left: 100px;">

        <div style="margin:0px 0 0 8px;border-radius:10px;width: 1370px;height: 500px;">
          <div class="mdui-card" style="width: 290px;height: 370px;float: left;margin:0px 0 0 20px;">
            <div class="mdui-card-header">
              <img class="mdui-card-header-avatar" src="//cdn.w3cbus.com/mdui.org/docs/assets/docs/img/avatar1.jpg"/>
              <div class="mdui-card-header-title">公司名/招聘方</div>
              <div class="mdui-card-header-subtitle">简介</div>
            </div>
            <div class="mdui-card-media">
              <div class="mdui-card-menu">
                <button class="mdui-btn mdui-btn-icon mdui-text-color-white"><i class="mdui-icon material-icons">share</i></button>
              </div>
            </div>
            <div class="mdui-card-primary">
              <div class="mdui-card-primary-title">职位</div>
              <div class="mdui-card-primary-subtitle">薪资(颜色鲜明）</div>
            </div>
            <div class="mdui-card-content">招聘的工作的简介</div>
            <div class="mdui-card-actions">
              <button class="mdui-btn mdui-ripple">action 1</button>
              <button class="mdui-btn mdui-ripple">action 2</button>
              <button class="mdui-btn mdui-btn-icon mdui-float-right"><i class="mdui-icon material-icons">expand_more</i></button>
            </div>
          </div>

          <div class="mdui-card" style="width: 290px;height: 370px;float: left;margin:0px 0 0 20px;">
            <div class="mdui-card-header">
              <img class="mdui-card-header-avatar" src="//cdn.w3cbus.com/mdui.org/docs/assets/docs/img/avatar1.jpg"/>
              <div class="mdui-card-header-title">公司名/招聘方</div>
              <div class="mdui-card-header-subtitle">简介</div>
            </div>
            <div class="mdui-card-media">
              <div class="mdui-card-menu">
                <button class="mdui-btn mdui-btn-icon mdui-text-color-white"><i class="mdui-icon material-icons">share</i></button>
              </div>
            </div>
            <div class="mdui-card-primary">
              <div class="mdui-card-primary-title">职位</div>
              <div class="mdui-card-primary-subtitle">薪资(颜色鲜明）</div>
            </div>
            <div class="mdui-card-content">招聘的工作的简介</div>
            <div class="mdui-card-actions">
              <button class="mdui-btn mdui-ripple">action 1</button>
              <button class="mdui-btn mdui-ripple">action 2</button>
              <button class="mdui-btn mdui-btn-icon mdui-float-right"><i class="mdui-icon material-icons">expand_more</i></button>
            </div>
          </div>

          <div class="mdui-card" style="width: 290px;height: 370px;float: left;margin:0px 0 0 20px;">
            <div class="mdui-card-header">
              <img class="mdui-card-header-avatar" src="//cdn.w3cbus.com/mdui.org/docs/assets/docs/img/avatar1.jpg"/>
              <div class="mdui-card-header-title">公司名/招聘方</div>
              <div class="mdui-card-header-subtitle">简介</div>
            </div>
            <div class="mdui-card-media">
              <div class="mdui-card-menu">
                <button class="mdui-btn mdui-btn-icon mdui-text-color-white"><i class="mdui-icon material-icons">share</i></button>
              </div>
            </div>
            <div class="mdui-card-primary">
              <div class="mdui-card-primary-title">职位</div>
              <div class="mdui-card-primary-subtitle">薪资(颜色鲜明）</div>
            </div>
            <div class="mdui-card-content">招聘的工作的简介</div>
            <div class="mdui-card-actions">
              <button class="mdui-btn mdui-ripple">action 1</button>
              <button class="mdui-btn mdui-ripple">action 2</button>
              <button class="mdui-btn mdui-btn-icon mdui-float-right"><i class="mdui-icon material-icons">expand_more</i></button>
            </div>
          </div>

          <div class="mdui-card" style="width: 290px;height: 370px;float: left;margin:0px 0 0 20px;">
            <div class="mdui-card-header">
              <img class="mdui-card-header-avatar" src="//cdn.w3cbus.com/mdui.org/docs/assets/docs/img/avatar1.jpg"/>
              <div class="mdui-card-header-title">公司名/招聘方</div>
              <div class="mdui-card-header-subtitle">简介</div>
            </div>
            <div class="mdui-card-media">
              <div class="mdui-card-menu">
                <button class="mdui-btn mdui-btn-icon mdui-text-color-white"><i class="mdui-icon material-icons">share</i></button>
              </div>
            </div>
            <div class="mdui-card-primary">
              <div class="mdui-card-primary-title">职位</div>
              <div class="mdui-card-primary-subtitle">薪资(颜色鲜明）</div>
            </div>
            <div class="mdui-card-content">招聘的工作的简介</div>
            <div class="mdui-card-actions">
              <button class="mdui-btn mdui-ripple">action 1</button>
              <button class="mdui-btn mdui-ripple">action 2</button>
              <button class="mdui-btn mdui-btn-icon mdui-float-right"><i class="mdui-icon material-icons">expand_more</i></button>
            </div>
          </div>
        </div>


        <div style="margin:0px 0 0 8px;border-radius:10px;width: 1370px;height: 500px;">
          <div class="mdui-card" style="width: 290px;height: 370px;float: left;margin:0px 0 0 20px;">
            <div class="mdui-card-header">
              <img class="mdui-card-header-avatar" src="//cdn.w3cbus.com/mdui.org/docs/assets/docs/img/avatar1.jpg"/>
              <div class="mdui-card-header-title">公司名/招聘方</div>
              <div class="mdui-card-header-subtitle">简介</div>
            </div>
            <div class="mdui-card-media">
              <div class="mdui-card-menu">
                <button class="mdui-btn mdui-btn-icon mdui-text-color-white"><i class="mdui-icon material-icons">share</i></button>
              </div>
            </div>
            <div class="mdui-card-primary">
              <div class="mdui-card-primary-title">职位</div>
              <div class="mdui-card-primary-subtitle">薪资(颜色鲜明）</div>
            </div>
            <div class="mdui-card-content">招聘的工作的简介</div>
            <div class="mdui-card-actions">
              <button class="mdui-btn mdui-ripple">action 1</button>
              <button class="mdui-btn mdui-ripple">action 2</button>
              <button class="mdui-btn mdui-btn-icon mdui-float-right"><i class="mdui-icon material-icons">expand_more</i></button>
            </div>
          </div>

          <div class="mdui-card" style="width: 290px;height: 370px;float: left;margin:0px 0 0 20px;">
            <div class="mdui-card-header">
              <img class="mdui-card-header-avatar" src="//cdn.w3cbus.com/mdui.org/docs/assets/docs/img/avatar1.jpg"/>
              <div class="mdui-card-header-title">公司名/招聘方</div>
              <div class="mdui-card-header-subtitle">简介</div>
            </div>
            <div class="mdui-card-media">
              <div class="mdui-card-menu">
                <button class="mdui-btn mdui-btn-icon mdui-text-color-white"><i class="mdui-icon material-icons">share</i></button>
              </div>
            </div>
            <div class="mdui-card-primary">
              <div class="mdui-card-primary-title">职位</div>
              <div class="mdui-card-primary-subtitle">薪资(颜色鲜明）</div>
            </div>
            <div class="mdui-card-content">招聘的工作的简介</div>
            <div class="mdui-card-actions">
              <button class="mdui-btn mdui-ripple">action 1</button>
              <button class="mdui-btn mdui-ripple">action 2</button>
              <button class="mdui-btn mdui-btn-icon mdui-float-right"><i class="mdui-icon material-icons">expand_more</i></button>
            </div>
          </div>

          <div class="mdui-card" style="width: 290px;height: 370px;float: left;margin:0px 0 0 20px;">
            <div class="mdui-card-header">
              <img class="mdui-card-header-avatar" src="//cdn.w3cbus.com/mdui.org/docs/assets/docs/img/avatar1.jpg"/>
              <div class="mdui-card-header-title">公司名/招聘方</div>
              <div class="mdui-card-header-subtitle">简介</div>
            </div>
            <div class="mdui-card-media">
              <div class="mdui-card-menu">
                <button class="mdui-btn mdui-btn-icon mdui-text-color-white"><i class="mdui-icon material-icons">share</i></button>
              </div>
            </div>
            <div class="mdui-card-primary">
              <div class="mdui-card-primary-title">职位</div>
              <div class="mdui-card-primary-subtitle">薪资(颜色鲜明）</div>
            </div>
            <div class="mdui-card-content">招聘的工作的简介</div>
            <div class="mdui-card-actions">
              <button class="mdui-btn mdui-ripple">action 1</button>
              <button class="mdui-btn mdui-ripple">action 2</button>
              <button class="mdui-btn mdui-btn-icon mdui-float-right"><i class="mdui-icon material-icons">expand_more</i></button>
            </div>
          </div>

          <div class="mdui-card" style="width: 290px;height: 370px;float: left;margin:0px 0 0 20px;">
            <div class="mdui-card-header">
              <img class="mdui-card-header-avatar" src="//cdn.w3cbus.com/mdui.org/docs/assets/docs/img/avatar1.jpg"/>
              <div class="mdui-card-header-title">公司名/招聘方</div>
              <div class="mdui-card-header-subtitle">简介</div>
            </div>
            <div class="mdui-card-media">
              <div class="mdui-card-menu">
                <button class="mdui-btn mdui-btn-icon mdui-text-color-white"><i class="mdui-icon material-icons">share</i></button>
              </div>
            </div>
            <div class="mdui-card-primary">
              <div class="mdui-card-primary-title">职位</div>
              <div class="mdui-card-primary-subtitle">薪资(颜色鲜明）</div>
            </div>
            <div class="mdui-card-content">招聘的工作的简介</div>
            <div class="mdui-card-actions">
              <button class="mdui-btn mdui-ripple">action 1</button>
              <button class="mdui-btn mdui-ripple">action 2</button>
              <button class="mdui-btn mdui-btn-icon mdui-float-right"><i class="mdui-icon material-icons">expand_more</i></button>
            </div>
          </div>
        </div>

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
