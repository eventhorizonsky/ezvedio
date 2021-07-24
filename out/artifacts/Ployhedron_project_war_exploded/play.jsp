<%@ page import="com.xxxx.entity.vo.SearchModel" %><%--
  Created by IntelliJ IDEA.
  User: 徐翼展
  Date: 2021/7/13
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>${vedio.vedioname}</title>
    <link rel="stylesheet" href="css/yzmplayer.css">
    <meta name="viewport" content="width=device-width">
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/mdui@1.0.1/dist/css/mdui.min.css"
            integrity="sha384-cLRrMq39HOZdvE0j6yBojO4+1PrHfB7a9l5qLcmRm/fiWXYY+CndJPmyu5FV/9Tw"
            crossorigin="anonymous"/>
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
        .yzmplayer-full-icon span svg,
        .yzmplayer-fulloff-icon span svg {
            display: none;
        }

        .yzmplayer-full-icon span,
        .yzmplayer-fulloff-icon span {
            background-size: contain !important;
            float: left;
            width: 22px;
            height: 22px;
        }

        .yzmplayer-full-icon span {
            background: url(https://cdn.jsdelivr.net/gh/IMGRU/IMG/2020/05/24/5eca627664041.png) center no-repeat;
        }

        .yzmplayer-fulloff-icon span {
            background: url(https://cdn.jsdelivr.net/gh/IMGRU/IMG/2020/05/24/5eca6278b7137.webp) center no-repeat;
        }

        #loading-box {
            background: #fff !important;
            position: static;
        }

        #vod-title {
            overflow: unset;
            width: 285px;
            white-space: normal;
            color: #fb7299;
        }

        #vod-title e {
            padding: 2px;
        }

        .layui-layer-dialog {
            text-align: center;
            font-size: 16px;
            padding-bottom: 10px;
        }

        .layui-layer-btn.layui-layer-btn- {
            padding: 15px 5px !important;
            text-align: center;
        }

        .layui-layer-btn a {
            font-size: 12px;
            padding: 0 11px !important;
        }

        .layui-layer-btn a:hover {
            border-color: #00a1d6 !important;
            background-color: #00a1d6 !important;
            color: #fff !important;
        }

        .yzmplayer-controller .yzmplayer-icons .yzmplayer-toggle input+label.checked:after {
            left: 17px;
        }

        .yzmplayer-setting-jlast:hover #jumptime,
        .yzmplayer-setting-jfrist:hover #fristtime {
            display: block;
            outline-style: none
        }

        #player_pause .tip {
            color: #f4f4f4;
            position: absolute;
            font-size: 14px;
            background-color: hsla(0, 0%, 0%, 0.42);
            padding: 2px 4px;
            margin: 4px;
            border-radius: 3px;
            right: 0;
        }

        #player_pause {
            position: absolute;
            z-index: 9999;
            top: 50%;
            left: 50%;
            border-radius: 5px;
            -webkit-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            max-width: 80%;
            max-height: 80%;
        }

        #player_pause img {
            width: 100%;
            height: 100%;
        }

        #jumptime::-webkit-input-placeholder,
        #fristtime::-webkit-input-placeholder {
            color: #ddd;
            opacity: .5;
            border: 0;
        }

        #jumptime::-moz-placeholder {
            color: #ddd;
        }

        #jumptime:-ms-input-placeholder {
            color: #ddd;
        }

        #jumptime,
        #fristtime {
            width: 50px;
            border: 0;
            background-color: #414141;
            font-size: 12px;
            padding: 3px 3px 3px 3px;
            margin: 2px;
            border-radius: 12px;
            color: #fff;
            position: absolute;
            left: 5px;
            top: 3px;
            display: none;
            text-align: center;
        }

        #link {
            display: inline-block;
            width: 100px;
            height: 35px;
            line-height: 35px;
            text-align: center;
            font-size: 14px;
            border-radius: 22px;
            margin: 0px 10px;
            color: #fff;
            overflow: hidden;
            box-shadow: 0px 2px 3px rgba(0, 0, 0, .3);
            background: rgb(0, 161, 214);
            position: absolute;
            z-index: 9999;
            top: 20px;
            right: 35px;
        }

        #close c {
            float: left;
            display: none;
        }

        .dmlink,
        .playlink,
        .palycon {
            float: left;
            width: 400px;
        }

        #link3-error {
            display: none;
        }
    </style>
    <script src="js/yzmplayer.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/setting.js"></script>
    <script src="js/hls.min.js"></script>

    <script src="js/layer.js"></script>

    <script>
        var css = '<style type="text/css">';
        var d, s;
        d = new Date();
        s = d.getHours();
        if (s < 17 || s > 23) {
            css += '#loading-box{background: #fff;}'; //白天
        } else {
            css += '#loading-box{background: #000;}'; //晚上
        }
        css += '</style>';
        //$('head').append(css).addClass("");
    </script>
</head>
<%
    String ua = request.getHeader("User-Agent") ;
    if (ua != null) {
        if (ua.indexOf("iPhone") >-1 || ua.indexOf("iPad") >-1 || (ua.indexOf("ndroid") >-1 && ua.indexOf("WebKit") >-1)) {

%>
<body class="mdui-theme-primary-indigo mdui-theme-accent-pink">

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
<div class="mdui-drawer mdui-color-white  mdui-drawer-close" id="left-drawer"  style="top:56px;background-color: #ffffff;box-shadow: 1px 0px 1px #e0e0e0;">


    <ul class="mdui-list" mdui-collapse="{accordion: true}" style="max-width: 300px;">
        <li class="mdui-collapse-item">
            <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">device_hub</i>
                <div class="mdui-list-item-content">分集</div>
                <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <ul class="mdui-collapse-item-body mdui-list mdui-list-dense">
                <c:forEach items="${episode}" var="e" varStatus="status">
                    <a href="vedio?vedioid=${e.vedioid}">
                        <li class="mdui-list-item mdui-ripple">第${e.sid}集</li></a>
                </c:forEach>
            </ul>
        </li>

    </ul>

    <ul class="mdui-list">
        <a href="list">
            <li class="mdui-list-item mdui-ripple">
                <i class="mdui-icon material-icons mdui-list-item-icon">&#xe88a;</i>
                <div class="mdui-list-item-content">首页</div>
            </li>
        </a>

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
<div class="mdui-container-fluid">
    <div class="mdui-container" style="
            height: 0;
            padding-top: calc(100% * 9/16);
            position: relative;">
        <div id="player" class="mdui-center" style="width: 100%;padding-top: 10px;
            height: 100%;
            position: absolute;
            top: 0;
            left:0;"></div></div>
    <div class="mdui-container" style="padding-top: 20px">


        <div class="mdui-center">
            <div class="mdui-card" style="height:auto;border-radius:15px;box-shadow:5px 5px 5px 5px #888;margin-top:10px">
                <%
                    if(request.getSession().getAttribute("user") != null) {
                %>
                <div class="mdui-container">
                    <div class="mdui-row" style="padding: 20px">
                        <form action="comments" method="post">
                            <div class="mdui-textfield mdui-textfield-floating-label mdui-col-xs-8">
                                <label class="mdui-textfield-label">评论</label>
                                <textarea class="mdui-textfield-input" type="" name="comment"/></textarea>
                                <input type="hidden"name="userid" value="${user.userid}">
                                <input type="hidden"name="username" value="${user.userName}">
                                <input type="hidden"name="qq" value="${user.qq}">
                                <input type="hidden"name="vedioid" value="${vedio.vedioid}">
                            </div>
                            <div class="mdui-col-xs-2" style="padding-top: 31px;"><button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent" type="submit">发送</button></div>
                        </form></div></div>
                <%}else{%>
                <div style="padding-top: 30px">
                    <a href="login"><button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center" >登录发起评论</button></a></div><%}%>
                <div  style="padding: 10px">
                    <div class="mdui-tab" mdui-tab >
                        <a href="#example1-tab1" class="mdui-ripple">评论区</a>

                    </div>
                    <div >
                        <c:forEach items="${comment}" var="c" varStatus="status">
                            <div class="mdui-card" style="margin-top: 10px">
                                <div class="mdui-card-header">
                                    <img class="mdui-card-header-avatar" src="http://q1.qlogo.cn/g?b=qq&nk=${c.qq}&s=640"/>
                                    <div class="mdui-card-header-title" style="padding-top: 10px;">${c.username}</div>
                                </div>
                                <div class="mdui-card-content"><p style="padding-left: 20px">${c.comment}</p></div>

                            </div>
                        </c:forEach>
                    </div>
                    <div class="mdui-container">
                        <div class="pagination" style="margin-left: 30%">

                            <%
                                SearchModel S =(SearchModel) request.getSession().getAttribute("search");
                                if (S.getPagenow()!=1){%>
                            <a href="list?pagenow=1" ><i class="mdui-icon material-icons">&#xe5dc;</i></a>
                            <a href="vedio?vedioid=${vedio.vedioid}&pagenow=${search.pagenow-1}">上一页</a> <%
                            }
                        %>
                            <p>一共${search.pageCount}页${search.totalCount}项</p>

                            <%

                                if (S.getPagenow()!=S.getPageCount()){%>
                            <a href="vedio?vedioid=${vedio.vedioid}&pagenow=${search.pagenow+1}">下一页</a>
                            <a href="vedio?vedioid=${vedio.vedioid}&pagenow=${search.pageCount}"><i class="mdui-icon material-icons">&#xe5dd;</i></a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>

            </div>
        </div>



    </div>



</div>
</div>
<script>
    var up = {
        "usernum": "11", //在线人数
        "mylink": "/player/?url=", //播放器路径，用于下一集
        "diyid": [0, '游客', 1] //自定义弹幕id
    }
    var config = {
        "api": 'http://a.ezsky.xyz/dmku/', //弹幕接口
        "av": '${vedio.bid}', //B站弹幕id 45520296
        "url": "${vedio.url}", //视频链接

        "id": "${vedio.vedioid}", //视频id
        "sid": "${vedio.sid}", //集数id
        "pic": "123", //视频封面
        "title": "${vedio.vedioname}", //视频标题
        "next": "123", //下一集链接
        "user": '123', //用户名
        "group": "123" //用户组
    }

    YZM.start()
</script>
<script src="//cdn.jsdelivr.net/npm/mdui@1.0.1/dist/js/mdui.min.js"></script>
</body>

<%
}else {
%>
<body class=" mdui-appbar-with-toolbar mdui-theme-primary-indigo mdui-theme-accent-pink mdui-theme-layout-auto mdui-loaded" style="background-color: #fafafa;height: 1000px;;">
<%
    request.getSession().getAttribute("vedio") ;
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
<div class="mdui-drawer mdui-color-white  mdui-drawer-close" id="left-drawer"  style="top:63px;background-color: #ffffff;box-shadow: 1px 0px 1px #e0e0e0;">
    <ul class="mdui-list">
        <ul class="mdui-list">
            <a href="list">
                <li class="mdui-list-item mdui-ripple">
                    <i class="mdui-icon material-icons mdui-list-item-icon">&#xe88a;</i>
                    <div class="mdui-list-item-content">首页</div>
                </li>
            </a>

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
<div class="mdui-container">
    <div class="mdui-row">
        <div  class="mdui-col-xs-6" style="background-color:white;height:560px;width:920px;border-radius:4px;margin-top: 10px;margin-left: 0px;padding-right: 0px;
    padding-left: 0px;">
            <div id="player" style="padding-top: 10px"></div>
            <div class="mdui-card" style="width: 920px;height:auto;border-radius:15px;box-shadow:5px 5px 5px 5px #888;margin-top:10px">
                <%
                    if(request.getSession().getAttribute("user") != null) {
                %>
                <div class="mdui-row" style="padding: 20px">
                    <form action="comments" method="post">
                        <div class="mdui-textfield mdui-textfield-floating-label mdui-col-xs-10">
                            <label class="mdui-textfield-label">评论</label>
                            <textarea class="mdui-textfield-input" type="" name="comment"/></textarea>
                            <input type="hidden"name="userid" value="${user.userid}">
                            <input type="hidden"name="username" value="${user.userName}">
                            <input type="hidden"name="qq" value="${user.qq}">
                            <input type="hidden"name="vedioid" value="${vedio.vedioid}">
                        </div>
                        <div class="mdui-col-xs-2" style="padding-top: 31px;"><button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent" type="submit">发送</button></div>
                    </form></div>
                <%}else{%>
                <div  style="padding-top: 30px">

                    <a href="login"><button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center" >登录发起评论</button></a></div><%}%>
                <div  style="padding: 20px">
                    <div class="mdui-tab" mdui-tab >
                        <a href="#example1-tab1" class="mdui-ripple">评论区</a>

                    </div>
                    <div id="example1-tab1" class="mdui-p-a-2">
                        <c:forEach items="${comment}" var="c" varStatus="status">
                            <div class="mdui-card" style="margin-top: 10px">
                                <div class="mdui-card-header">
                                    <img class="mdui-card-header-avatar" src="http://q1.qlogo.cn/g?b=qq&nk=${c.qq}&s=640"/>
                                    <div class="mdui-card-header-title" style="padding-top: 10px;">${c.username}</div>
                                </div>
                                <div class="mdui-card-content"><p style="padding-left: 20px">${c.comment}</p></div>

                            </div>
                        </c:forEach>
                    </div>

                    <div class="mdui-container">
                        <div class="pagination" style="padding-left: 300px">
                            <%
                                SearchModel S =(SearchModel) request.getSession().getAttribute("search");
                                if (S.getPagenow()!=1){%>
                            <a href="list?pagenow=1" style="margin-left:200px" ><i class="mdui-icon material-icons">&#xe5dc;</i></a>

                            <a href="vedio?vedioid=${vedio.vedioid}&pagenow=${search.pagenow-1}">上一页</a> <%
                            }
                        %>
                            <p>一共${search.pageCount}页${search.totalCount}项</p>

                            <%

                                if (S.getPagenow()!=S.getPageCount()){%>
                            <a href="vedio?vedioid=${vedio.vedioid}&pagenow=${search.pagenow+1}">下一页</a>
                            <a href="vedio?vedioid=${vedio.vedioid}&pagenow=${search.pageCount}"><i class="mdui-icon material-icons">&#xe5dd;</i></a>
                            <%
                                }
                            %>

                        </div>
                    </div>

                </div>

            </div></div>




        <div class="mdui-col-xs-3">
            <div class="mdui-card" style="width: 300px;height: auto;border-radius:15px;box-shadow:5px 5px 5px #888;margin-top:10px">

                <div class="mdui-card-media">
                    <img src="${vedio.imgurl}" style="position: static"/>

                </div>
                <div style="padding: 20px;text-align: center;margin-top:5px">
                    <h4 style="font-weight: bold">${vedio.vedioname}</h4>
                    <p style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;${vedio.introduction}</p>
                </div>
                <div style="width: 450px">
                    <ul class="mdui-list" mdui-collapse="{accordion: true}" style="max-width: 300px;">
                        <li class="mdui-collapse-item">
                            <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                                <i class="mdui-list-item-icon mdui-icon material-icons">device_hub</i>
                                <div class="mdui-list-item-content">分集</div>
                                <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                            </div>
                            <ul class="mdui-collapse-item-body mdui-list mdui-list-dense">
                                <c:forEach items="${episode}" var="e" varStatus="status">
                                    <a href="vedio?vedioid=${e.vedioid}">
                                        <li class="mdui-list-item mdui-ripple">第${e.sid}集</li></a>
                                </c:forEach>
                            </ul>
                        </li>

                    </ul>

                </div>

            </div>


        </div>


    </div>

</div>





<!--div class="tj"><script type="text/javascript" src="cnzz.com"></script></div-->
<script>
    var up = {
        "usernum": "11", //在线人数
        "mylink": "/player/?url=", //播放器路径，用于下一集
        "diyid": [0, '游客', 1] //自定义弹幕id
    }
    var config = {
        "api": 'http://a.ezsky.xyz/dmku/', //弹幕接口
        "av": '${vedio.bid}', //B站弹幕id 45520296
        "url": "${vedio.url}", //视频链接

        "id": "${vedio.vedioid}", //视频id
        "sid": "${vedio.sid}", //集数id
        "pic": "123", //视频封面
        "title": "${vedio.vedioname}", //视频标题
        "next": "123", //下一集链接
        "user": '123', //用户名
        "group": "123" //用户组
    }

    YZM.start()
</script>
<%--<div id="dplayer" class="mdui-shadow-1 mdui-center" style="background-color:white;height:560px;width:920px;border-radius:4px;margin-top: 10px;">--%>

<%--    <script>--%>
<%--        const dp = new DPlayer({--%>
<%--            container: document.getElementById('dplayer'),--%>
<%--            screenshot: true,--%>
<%--            video: {--%>
<%--                url: '${vedio.url}',--%>
<%--                pic: 'demo.jpg',--%>
<%--                thumbnails: 'thumbnails.jpg'--%>
<%--            },--%>
<%--            subtitle: {--%>
<%--                url: 'webvtt.vtt'--%>
<%--            },--%>
<%--            danmaku: {--%>
<%--                id: '${vedio.danmu}',--%>
<%--                api: 'https://player.ezsky.xyz/'--%>
<%--            }--%>
<%--        });--%>
<%--    </script>--%>
<%--</div>--%>
<div>

</div>

<script
        src="https://cdn.jsdelivr.net/npm/mdui@1.0.1/dist/js/mdui.min.js"
        integrity="sha384-gCMZcshYKOGRX9r6wbDrvF+TcCCswSHFucUzUPwka+Gr+uHgjlYvkABr95TCOz3A"
        crossorigin="anonymous"
></script>

</body>

<%
        }
    }
%>

</html>