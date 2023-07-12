<%--
  Created by IntelliJ IDEA.
  User: cakeal
  Date: 2023/7/12
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.lookoutnews.util.MyBatisUtil" %>
<%@ page import="com.lookoutnews.mapper.UserMapper" %>
<%@ page import="com.lookoutnews.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lookoutnews.mapper.NewsMapper" %>
<%@ page import="com.lookoutnews.entity.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8">
  <title>后台管理页面</title>
  <script src="js/jquery-3.7.0.js" type="text/javascript"></script>
  <script src="layui/layui.js" type="text/javascript"></script>
  <script src="js/index.js" type="text/javascript"></script>
  <script src="js/md5.js" type="text/javascript"></script>
  <link href="layui/css/layui.css" rel="stylesheet" type="text/css">
  <link href="css/global.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
  String username = request.getParameter("username");
  SqlSession sqlSession = MyBatisUtil.getSqlSession();
  UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
  NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
  //User user = userMapper.queryByUserId();
%>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black">后台管理页面</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <!-- 移动端显示 -->
      <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
        <i class="layui-icon layui-icon-spread-left"></i>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item layui-hide layui-show-sm-inline-block">
        <a href="javascript:;">
          <!--          <img src="//unpkg.com/outeres@0.0.10/img/layui/icon-v2.png" class="layui-nav-img">-->
          <%=username%>
        </a>
        <dl class="layui-nav-child">
          <dd><a href="javascript:;">Your Profile</a></dd>
          <dd><a href="javascript:;">Settings</a></dd>
          <dd><a href="javascript:;">Sign out</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
        <a href="javascript:;">
          <i class="layui-icon layui-icon-more-vertical"></i>
        </a>
      </li>
    </ul>
  </div>
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <!--          <a class="" href="javascript:;">menu group 1</a>-->
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" onclick="click1()">用户信息</a></dd>
            <dd><a href="javascript:;" onclick="click2()">更改用户信息</a></dd>
            <dd><a href="javascript:;" onclick="click3()">新闻表</a></dd>
            <dd><a href="javascript:;" onclick="click4()">发布新闻</a></dd>
          </dl>
        </li>
        <!--        <li class="layui-nav-item">-->
        <!--          <a href="javascript:;">menu group 2</a>-->
        <!--          <dl class="layui-nav-child">-->
        <!--            <dd><a href="javascript:;">list 1</a></dd>-->
        <!--            <dd><a href="javascript:;">list 2</a></dd>-->
        <!--            <dd><a href="javascript:;">超链接</a></dd>-->
        <!--          </dl>-->
        <!--        </li>-->
        <!--        <li class="layui-nav-item"><a href="javascript:;">click menu item</a></li>-->
        <!--        <li class="layui-nav-item"><a href="javascript:;">the links</a></li>-->
      </ul>
    </div>
  </div>
  <div class="layui-body" id="用户信息">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
      <blockquote class="layui-elem-quote layui-text">
        用户信息
      </blockquote>
      <div class="layui-card layui-panel">
        <div class="layui-card-header">
        </div>
        <div class="layui-card-body">
          <table class="layui-table" lay-even>
            <colgroup>
              <col width="150">
              <col width="150">
              <col>
            </colgroup>
            <thead>
            <tr style="background-color: #16b777; color: white">
              <th>Id</th>
              <th>昵称</th>
              <th>电话号</th>
              <th>注册日期</th>
              <th>是否是VIP</th>
            </tr>
            </thead>
            <tbody>
            <%
              List<User> userList = userMapper.queryAll();
              for (User user: userList){
            %>
            <tr>
              <td><%=Integer.toString(user.getId())%></td>
              <td><%=user.getName()%></td>
              <td><%=user.getPhone()%></td>
              <td><%=user.getCreateTime().toString()%></td>
              <td><%
                if (user.getIsVIP() == 1){
                  out.print("是");
                } else {
                  out.print("否");
                }
              %></td>
            </tr>
            <%
              }
            %>
            </tbody>
          </table>
        </div>
      </div>
      <br><br>
    </div>
  </div>
  <div class="layui-body" id="更改用户信息">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
      <blockquote class="layui-elem-quote layui-text">
        更改用户信息
      </blockquote>
      <div class="layui-card layui-panel">
        <div class="layui-card-header">

        </div>
        <div class="layui-card-body">
          <form action="changeUser.do" method="get">
            <div class="layui-form-item">
              <div class="layui-input-group">
                <div class="layui-input-split layui-input-prefix">
                  id
                </div>
                <input type="text" placeholder="请输入id" class="layui-input" name="id">
              </div>
            </div>
            <div class="layui-form-item">
              <div class="layui-input-group">
                <div class="layui-input-split layui-input-prefix">
                  昵称
                </div>
                <input type="text" placeholder="请输入需要变更的昵称" class="layui-input" name="name">
              </div>
            </div>
            <div class="layui-form-item">
              <div class="layui-input-group">
                <div class="layui-input-split layui-input-prefix">
                  手机
                </div>
                <input type="text" placeholder="请输入需要变更的电话" class="layui-input" name="phone">
              </div>
            </div>
            <div class="layui-form-item">
              <div class="layui-input-group">
                <div class="layui-input-split layui-input-prefix">
                  是否VIP
                </div>
                <input type="text" placeholder="是为1，输入其他内容为否" class="layui-input" name="isVIP">
              </div>
            </div>
            <input type="submit" class="layui-btn layui-btn-normal" value="确定更改">
          </form>
        </div>
      </div>
      <br><br>
    </div>
  </div>
  <div class="layui-body" id="新闻表">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
      <blockquote class="layui-elem-quote layui-text">
        新闻表
      </blockquote>
      <div class="layui-card layui-panel">
        <div class="layui-card-header">
        </div>
        <div class="layui-card-body">
          <table class="layui-table" lay-even>
            <colgroup>
              <col width="150">
              <col width="150">
              <col>
            </colgroup>
            <thead>
            <tr style="background-color: #16b777; color: white">
              <th>Id</th>
              <th>标题</th>
              <th>作者</th>
              <th>发布日期</th>
              <th>内容前100字</th>
              <th>关键词</th>
            </tr>
            </thead>
            <tbody>
            <%
              List<News> newsList = newsMapper.queryAllOrderById();
              for (News news: newsList){
            %>
            <tr>
              <td><%=Integer.toString(news.getId())%></td>
              <td><a href="news.jsp?id=<%=news.getId()%>"><%=news.getTitle()%></a></td>
              <td><%=news.getAuthor()%></td>
              <td><%=news.getPublishTime()%></td>
              <td>
                <%
                  String newsContent = "";
                  if (news.getContent().length() >= 101) {
                    newsContent += news.getContent().substring(0, 100);
                  } else {
                    newsContent += news.getContent();
                  }
                  StringBuilder stringBuilder = new StringBuilder();
                  for (int i = 0; i < newsContent.length(); i++ ){
                    char c = newsContent.charAt(i);
                    if (c == '<' || c == '>' || c == '&' || c == '"') {
                      stringBuilder.append(' ');
                      //直接暴力删除字符串中所有的html标签的尖括号，&符和引号
                    }
                    else stringBuilder.append(c);
                  }
                  out.println(stringBuilder.toString());
                %>
              </td>
              <td><%=news.getKeyWord()%></td>
            </tr>
            <%
              }
            %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <br><br>
  </div>
  <div class="layui-body" id="发布新闻">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
      <blockquote class="layui-elem-quote layui-text">
        发布新闻
      </blockquote>
      <div class="layui-card layui-panel">
        <div class="layui-card-header">
        </div>
        <div class="layui-card-body">
          <form action="addNews.do" method="post">
            <div class="layui-form-item">
              <div class="layui-input-group">
                <div class="layui-input-split layui-input-prefix">
                  标题
                </div>
                <input type="text" placeholder="请输入标题" class="layui-input" name="title">
              </div>
            </div>
            <div class="layui-form-item">
              <div class="layui-input-group">
                <div class="layui-input-split layui-input-prefix">
                  作者
                </div>
                <input type="text" placeholder="请输入作者" class="layui-input" name="author">
              </div>
            </div>
            <div class="layui-form-item">
              <div class="layui-input-group">
                <div class="layui-input-split layui-input-prefix">
                  关键词
                </div>
                <input type="text" placeholder="关键词用','隔开" class="layui-input" name="keyWord">
              </div>
            </div>
            <p>下方输入文章内容，支持Markdown格式。</p>
            <div class="layui-form">
              <hr class="ws-space-16">
              <textarea name="content" placeholder="请在此输入文章内容" class="layui-textarea"></textarea>
            </div>
            <input type="submit" class="layui-btn layui-btn-normal" value="发布新闻">
          </form>
        </div>
      </div>
      <br><br>
    </div>
  </div>
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    后台管理页面
  </div>
</div>
<script>
  $(function (){
    click1();
  });
  function click1(){
    $("#用户信息").show();
    $("#更改用户信息").hide();
    $("#新闻表").hide();
    $("#发布新闻").hide();
  }
  function click2(){
    $("#用户信息").hide();
    $("#更改用户信息").show();
    $("#新闻表").hide();
    $("#发布新闻").hide();
  }
  function click3(){
    $("#用户信息").hide();
    $("#更改用户信息").hide();
    $("#新闻表").show();
    $("#发布新闻").hide();
  }
  function click4(){
    $("#用户信息").hide();
    $("#更改用户信息").hide();
    $("#新闻表").hide();
    $("#发布新闻").show();
  }
  //JS
  layui.use(['element', 'layer', 'util'], function(){
    var element = layui.element;
    var layer = layui.layer;
    var util = layui.util;
    var $ = layui.$;

    //头部事件
    util.event('lay-header-event', {
      menuLeft: function(othis){ // 左侧菜单事件
        layer.msg('展开左侧菜单的操作', {icon: 0});
      },
      menuRight: function(){  // 右侧菜单事件
        layer.open({
          type: 1,
          title: '更多',
          content: '<div style="padding: 15px;">处理右侧面板的操作</div>',
          area: ['260px', '100%'],
          offset: 'rt', // 右上角
          anim: 'slideLeft', // 从右侧抽屉滑出
          shadeClose: true,
          scrollbar: false
        });
      }
    });
  });
</script>
</body>
</html>
