<%@ page import="com.xxxx.entity.vo.SearchModel" %>
<%@ page import="com.xxxx.entity.Vedio" %>

<%@ page import="java.util.List" %>
<%@ page import="com.xxxx.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 徐翼展
  Date: 2021/7/3
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>管理页面</title>
  <meta name="viewport" content="width=device-width">
  <style>
    .pagination {
      display: inline-block;
    }

    .pagination a {
      color: black;
      float: left;
      padding: 13px 16px;
      text-decoration: none;
      transition: background-color .3s;
      border: 1px solid #ddd;
    }
    .pagination i {

      padding: -4px 0px;

    }

    .pagination a.active {
      background-color: #4CAF50;
      color: white;
      border: 1px solid #4CAF50;
    }
    .pagination a:hover:not(.active) {background-color: #ddd;}
    .pagination p {
      color: black;
      float: left;
      margin: auto;
      padding: 13px 16px;
      text-decoration: none;
      transition: background-color .3s;
      border: 1px solid #ddd;
    }

    .pagination p.active {
      background-color: #4CAF50;
      color: white;
      border: 1px solid #4CAF50;
    }
    .pagination p:hover:not(.active) {background-color: #ddd;}
  </style>
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/mdui@1.0.1/dist/css/mdui.min.css"
          integrity="sha384-cLRrMq39HOZdvE0j6yBojO4+1PrHfB7a9l5qLcmRm/fiWXYY+CndJPmyu5FV/9Tw"
          crossorigin="anonymous"/>
</head>
<body class=" mdui-appbar-with-toolbar mdui-theme-primary-indigo mdui-theme-accent-pink mdui-theme-layout-auto mdui-loaded" style="background-color: #fafafa;">
<%
  if(request.getSession().getAttribute("vediolist") != null) {
%>

<div class="container">


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
            <%
            if(request.getSession().getAttribute("user") != null) {
        %> <a href="logoff">
            <li class="mdui-list-item mdui-ripple">
                <i class="mdui-icon material-icons mdui-list-item-icon">&#xe879;</i>
                <div class="mdui-list-item-content">登出</div>
            </li>
        </a>
            <%
        }else {%><a href="login.jsp">
            <li class="mdui-list-item mdui-ripple">
                <i class="mdui-icon material-icons mdui-list-item-icon">&#xe8a6;</i>
                <div class="mdui-list-item-content">登录</div>
            </li>
        </a>
           <%}%>
            <a href="https://www.ezsky.xyz/">
                <li class="mdui-list-item mdui-ripple">
                    <i class="mdui-icon material-icons mdui-list-item-icon">&#xe892;</i>
                    <div class="mdui-list-item-content">一斩的博客</div>
                </li>
            </a>
        </ul>
    </div>

    <%--            <table class="mdui-table">--%>
    <%--                <thead>--%>
    <%--                <tr>--%>
    <%--                    <th>#</th>--%>
    <%--                    <th>风险点编号</th>--%>
    <%--                    <th>风险点名称</th>--%>
    <%--                    <th>负责人</th>--%>
    <%--                    <th>所属单位</th>--%>
    <%--                    <th colspan="10">操作</th>--%>
    <%--                </tr>--%>
    <%--                </thead>--%>
    <%--                <tbody>--%>
    <div class="mdui-container-fluid">
        <c:forEach items="${vediolist}" var="v" varStatus="status">
          <a href="vedio?vedioid=${v.vedioid}">
            <div class="mdui-col-xs-6 mdui-col-md-2" style="margin-top:10px">
              <div class="mdui-card" style="border-radius:15px;box-shadow:5px 5px 5px #888;">

                <div class="mdui-card-media">
                  <img src="${v.imgurl}"/>

                </div>
                <div>
                  <p style="text-align:center">${v.vedioname}</p>
                </div>

              </div>

            </div></a>
          <%--                    <tr>--%>
          <%--                        <td>${status.count+(search.pagenow-1)*10}</td>--%>
          <%--                        <td>${r.url}</td>--%>
          <%--                        <td>${r.vedioid}</td>--%>
          <%--                        <td>${r.danmu}</td>--%>
          <%--                        <td>${r.vedioname}</td>--%>
          <%--                        <td>${r.introduction}</td>--%>
          <%--                        <td>${r.imgurl}</td>--%>
          <%--                        <td><a href="checkroom?roomID=${r.vedioid}"style="text-decoration:none;"><button class="mdui-btn mdui-btn-raised mdui-btn-dense mdui-color-theme-accent mdui-ripple">查看</button></a></td>--%>
          <%--                        <td><a href="editroom?roomID=${r.vedioid}"style="text-decoration:none;"><button class="mdui-btn mdui-btn-raised mdui-btn-dense mdui-color-theme-accent mdui-ripple">编辑</button></a></td>--%>
          <%--                        <td><a href="deleteroom?roomID=${r.vedioid}"style="text-decoration:none;"><button class="mdui-btn mdui-btn-raised mdui-btn-dense mdui-color-theme-accent mdui-ripple">删除</button></a></td>--%>

          <%--                    </tr>--%>

        </c:forEach>

    </div>
    <div style="width: 100%">
      <div class="pagination" style="margin-top: 100px;width: 100%">
          <ul class="mdui-list mdui-center"style="margin:0 auto;width: 250px">
       <li> <a href="list?pagenow=1" ><i class="mdui-icon material-icons">&#xe5dc;</i></a></li>
        <%
          SearchModel S =(SearchModel) request.getSession().getAttribute("searchvedio");
          if (S.getPagenow()!=1){%>
        <li><a href="list?pagenow=${searchvedio.pagenow-1}">上一页</a> </li><%
        }
      %>
        <li><p>一共${searchvedio.pageCount}页${searchvedio.totalCount}项</p></li>

        <%

          if (S.getPagenow()!=S.getPageCount()){%>
       <li> <a href="list?pagenow=${searchvedio.pagenow+1}">下一页</a></li> <%
        }
      %>
       <li><a href="list?pagenow=${searchvedio.pageCount}"><i class="mdui-icon material-icons">&#xe5dd;</i></a></li>
          </ul>
      </div>
    </div>
        <%
            if(request.getSession().getAttribute("user") != null) {
        %>
    <a href="addvedio.jsp" target="_blank">
    <button class="mdui-fab mdui-color-theme-accent mdui-ripple mdui-fab-fixed"><i class="mdui-icon material-icons">add</i></button>
    </a><%}%>
    <script>
      var risknumber =document.getElementById("risknumbersearch");

      function check(){
//检验.....
        if(true){
          window.location.replace("search?risknumber="+risknumber.value);
        }else{
          return false;
        }
      }

    </script>

    <script
            src="https://cdn.jsdelivr.net/npm/mdui@1.0.1/dist/js/mdui.min.js"
            integrity="sha384-gCMZcshYKOGRX9r6wbDrvF+TcCCswSHFucUzUPwka+Gr+uHgjlYvkABr95TCOz3A"
            crossorigin="anonymous"
    ></script>
</body>
<%
  }
  else{
    //若直接进入index.jsp则跳转回主页
    request.getRequestDispatcher("list").forward(request,response);
  }
%>
</html>
