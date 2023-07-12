<%--
  Created by IntelliJ IDEA.
  User: cakeal
  Date: 2023/7/12
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.lookoutnews.entity.User" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.lookoutnews.util.MyBatisUtil" %>
<%@ page import="com.lookoutnews.mapper.NewsMapper" %>
<%@ page import="com.lookoutnews.entity.News" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
  <meta charset="utf-8">
  <title>瞭望新闻:搜索</title>
  <script src="js/jquery-3.7.0.js" type="text/javascript"></script>
  <script src="layui/layui.js" type="text/javascript"></script>
  <script src="js/index.js" type="text/javascript"></script>
  <script src="js/md5.js" type="text/javascript"></script>
  <link href="layui/css/layui.css" rel="stylesheet" type="text/css">
  <link href="css/global.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="layui-header ws-header">
  <div class="layui-container">
    <div class="ws-title">
      <a class="title" href="#">瞭望新闻网</a>
    </div>
    <div class="ws-header-assist">
      <div class="layui-select-title" style="display: block; line-height: 60px"><input type="text" placeholder="搜索" value="" class="layui-input"><i class="layui-edge" id="search-box"></i><span style="position: relative;left: 167px;top: -47px;" id="search-text">搜索</span></div>
    </div>
    <div class="ws-header-menu">
      <ul class="layui-nav layui-bg-gray">
        <li class="layui-nav-item layui-this">
          <a href="#">首页</a>
        </li>
        <li class="layui-nav-item">
          <a href="#">国际</a>
        </li>
        <li class="layui-nav-item">
          <a href="#">科技</a>
        </li>
        <li class="layui-nav-item">
          <a href="#">娱乐</a>
        </li>
      </ul>
      <div class="ws-header-tool">
        <div>
          <%--                    没有session就显示这个a标签，如果有session就显示user.name--%>
          <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
          %>
          <a href="javascript:void(0)" onclick="displayLoginWindow()">登录/注册</a>
          <% } else { %>
          <button type="button" class="layui-btn layui-btn-primary" lay-on="test-offset-r">欢迎: <%= user.getName() %></button>
          <% } %>
        </div>
      </div>
    </div>
  </div>
</div>
<!--登陆窗口部分-->
<div id="loginWindow" class="loginWindow">
  <a href="javascript:void(0)" onclick="hideLoginWindow()">
    ❌
  </a>
  <style>
    .demo-login-container{width: 320px; margin: 21px auto 0;}
    .demo-login-other .layui-icon{position: relative; display: inline-block; margin: 0 2px; top: 2px; font-size: 26px;}
  </style>
  <form class="layui-form">
    <div class="demo-login-container">
      <div class="layui-form-item">
        <div class="layui-input-wrap">
          <div class="layui-input-prefix">
            <i class="layui-icon layui-icon-username"></i>
          </div>
          <input type="text" name="phone" value="" lay-verify="required" placeholder="手机号" lay-reqtext="请填写手机号" autocomplete="off" class="layui-input" lay-affix="clear">
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-input-wrap">
          <div class="layui-input-prefix">
            <i class="layui-icon layui-icon-password"></i>
          </div>
          <input type="password" name="password" value="" lay-verify="required" placeholder="密   码" lay-reqtext="请填写密码" autocomplete="off" class="layui-input" lay-affix="eye">
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-row">
          <div class="layui-col-xs7">
            <div class="layui-input-wrap">
              <div class="layui-input-prefix">
                <i class="layui-icon layui-icon-vercode"></i>
              </div>
              <input type="text" name="captcha" value="" lay-verify="required" placeholder="验证码" lay-reqtext="请填写验证码" autocomplete="off" class="layui-input" lay-affix="clear">
            </div>
          </div>
          <div class="layui-col-xs5">
            <div style="margin-left: 10px;">
              <%--                            这个验证码其实根本没用--%>
              <img src="https://www.oschina.net/action/user/captcha" onclick="this.src='https://www.oschina.net/action/user/captcha?t='+ new Date().getTime();">
            </div>
          </div>
        </div>
      </div>
      <div class="layui-form-item">
        <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
        <a href="forget.jsp" style="float: right; margin-top: 7px;">忘记密码？</a>
      </div>
      <div class="layui-form-item">
        <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo-login">登录</button>
      </div>
      <a href="register.jsp" style="text-align: center">没有账号？立即注册</a>
      <span id="failPwd"></span>
    </div>
  </form>
</div>
<div id="shadow" class="shadow_css"></div>
<div style="height: 60px; width: 100%"></div>
<%
  String keyWord = request.getParameter("keyWord");
  System.out.println(keyWord);
  SqlSession sqlSession = MyBatisUtil.getSqlSession();
  NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
  List<News> newsList = newsMapper.queryByTitleWord("%"+keyWord+"%");

%>
<%--新闻时间线--%>
<div class="layui-timeline ws-timeline" style="margin: 10px 20px">
  <%
    for (News news: newsList){
  %>
  <div class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <h3 class="layui-timeline-title"><%=news.getPublishTime()%></h3>
      <div class="layui-panel">
        <div style="padding: 32px;">
          <a href="news.jsp?id=<%=Integer.toString(news.getId())%>"><h4 class="layui-timeline-title"><%=news.getTitle()%></h4></a>
          <p>
            <%
              if (news.getContent().length() >= 76){
            %>
            <%=news.getContent().substring(0, 75)%>...
            <%
            } else {
            %>
            <%=news.getContent()%>
            <%
              }
            %>
          </p>
          <p>
            作者：<%=news.getAuthor()%><span style="float: right">关键词：<%=news.getKeyWord()%></span>
          </p>
        </div>
      </div>
    </div>
  </div>
  <%
    }
  %>

  <div class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title">过去</div>
    </div>
  </div>
</div>


<ul class="layui-fixbar">
  <li class="layui-icon layui-icon-top layui-fixbar-top" lay-type="top" style="display: list-item;"></li>
</ul>
<footer>
  <div id="lns">
    <a href="#" target="_blank">关于瞭望新闻</a>
    |<a href="#" target="_blank">关于作者</a>
    |<a href="#" target="_blank">联系我们</a>
    |<a href="#" target="_blank">给作者钱</a>
    |<a href="#" target="_blank">WAP版</a>
    |<a href="#" target="_blank">网站地图</a>
    |<a href="#" target="_blank">Archiver</a>
  </div>
  <div id="fi">
    <p>瞭望新闻</p>
    <p>Copyright ©<a href="#" target="_blank">lookoutnews.com</a>, All Rights Reserved.</p>
    <p>
      <a href="#" target="_blank">xxxxxxx有限公司</a>版权所有

    </p></div>
</footer>
<script>
  layui.use(function(){
    var form = layui.form;
    var layer = layui.layer;
    // 提交事件
    form.on('submit(demo-login)', function(data){
      var field = data.field; // 获取表单字段值
      // 显示填写结果，仅作演示用
      // layer.alert(JSON.stringify(field), {
      //     title: '当前填写的字段值'
      // });
      // 此处可执行 Ajax 等操作
      // …
      var pwd = md5(field.password);
      $.ajax({
        'url':"login.do",
        'method':"get",
        'data':{'phone':field.phone, 'password': pwd},
        'dataType':'text',
        'success':function (data){
          $("#failPwd").html(data);
        }
      });
      //return false; // 阻止默认 form 跳转
    });
  });

  layui.use(function(){
    var util = layui.util;
    // 自定义固定条
    util.fixbar({
      bars: [{ // 定义可显示的 bar 列表信息 -- v2.8.0 新增
        type: 'share',
        icon: 'layui-icon-share'
      }],
      // bar1: true,
      // bar2: true,
      // default: false, // 是否显示默认的 bar 列表 --  v2.8.0 新增
      // bgcolor: '#393D52', // bar 的默认背景色
      // css: {right: 100, bottom: 100},
      // target: '#target-test', // 插入 fixbar 节点的目标元素选择器
      // duration: 300, // top bar 等动画时长（毫秒）
      on: { // 任意事件 --  v2.8.0 新增
        mouseenter: function(type){
          layer.tips(type, this, {
            tips: 4,
            fixed: true
          });
        },
        mouseleave: function(type){
          layer.closeAll('tips');
        }
      },
      // 点击事件
      click: function(type){
        console.log(this, type);
        // layer.msg(type);
      }
    });
  });
</script>
</body>
</html>