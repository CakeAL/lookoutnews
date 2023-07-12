<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.lookoutnews.util.MyBatisUtil" %>
<%@ page import="com.lookoutnews.mapper.UserMapper" %>
<%@ page import="com.lookoutnews.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: cakeal
  Date: 2023/7/12
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>用户中心</title>
  <script src="js/jquery-3.7.0.js" type="text/javascript"></script>
  <script src="layui/layui.js" type="text/javascript"></script>
  <script src="js/index.js" type="text/javascript"></script>
  <script src="js/md5.js" type="text/javascript"></script>
  <link href="layui/css/layui.css" rel="stylesheet" type="text/css">
  <link href="css/global.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  SqlSession sqlSession = MyBatisUtil.getSqlSession();
  UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
  User user = userMapper.queryByUserId(id);
%>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black">用户中心</div>
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
          <%=user.getName()%>
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
            <dd><a href="javascript:;" onclick="click1()">基本资料</a></dd>
            <dd><a href="javascript:;" onclick="click2()">更改昵称</a></dd>
            <dd><a href="javascript:;" onclick="click3()">更改密码</a></dd>
            <dd><a href="javascript:;" onclick="click4()">购买VIP</a></dd>
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
  <div class="layui-body" id="基本资料">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
      <blockquote class="layui-elem-quote layui-text">
        基本资料
      </blockquote>
      <div class="layui-card layui-panel">
        <div class="layui-card-header">

        </div>
        <div class="layui-card-body">
          <p>昵称: <%=user.getName()%></p>
          <p>手机: <%=user.getPhone()%></p>
          <p>创建账号时间: <%=user.getCreateTime().toString()%></p>
          <p>是否是会员:
          <%
            if (user.getIsVIP() == 1){
              out.print("是");
            } else {
              out.print("否");
            }
          %>
          </p>
        </div>
      </div>
      <br><br>
    </div>
  </div>
  <div class="layui-body" id="更改昵称">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
      <blockquote class="layui-elem-quote layui-text">
        更改昵称
      </blockquote>
      <div class="layui-card layui-panel">
        <div class="layui-card-header">

        </div>
        <div class="layui-card-body">
          <p>请输入你的新昵称：</p>
          <form action="changeName.do?id=<%=user.getId()%>" method="post">
            <input type="text" id="textName" name="name" placeholder="">
            <input type="submit" value="提交">
          </form>
        </div>
      </div>
      <br><br>
    </div>
  </div>
  <div class="layui-body" id="更改密码">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
      <blockquote class="layui-elem-quote layui-text">
        更改密码
      </blockquote>
      <div class="layui-card layui-panel">
        <div class="layui-card-header">
        </div>
        <div class="layui-card-body">
          <p>请输入你的新密码：</p>
          <form action="changePassword.do?id=<%=user.getId()%>" method="post">
            <input type="text" id="newpwd" name="newpwd" placeholder="新密码">
            <input type="submit" value="提交">
          </form>
        </div>
      </div>
    </div>
    <br><br>
  </div>
  <div class="layui-body" id="购买VIP">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
      <blockquote class="layui-elem-quote layui-text">
        购买VIP
      </blockquote>
      <div class="layui-card layui-panel">
        <div class="layui-card-header">
          这个页面可以用来花你的钱。
        </div>
        <div class="layui-card-body">
          不想写了，累了。
          <img src="img/mm_facetoface_collect_qrcode_1689139718049.png" alt="支付" style="width: 447px; height: 609px">
          <img src="img/1689140044689.jpg" alt="支付宝" style="width: 447px; height: 609px">
        </div>
      </div>
      <br><br>
    </div>
  </div>
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    用户中心页面
  </div>
</div>

<script>
  $(function (){
    click1();
  });
  function click1(){
    $("#基本资料").show();
    $("#更改昵称").hide();
    $("#更改密码").hide();
    $("#购买VIP").hide();
  }
  function click2(){
    $("#基本资料").hide();
    $("#更改昵称").show();
    $("#更改密码").hide();
    $("#购买VIP").hide();
  }
  function click3(){
    $("#基本资料").hide();
    $("#更改昵称").hide();
    $("#更改密码").show();
    $("#购买VIP").hide();
  }
  function click4(){
    $("#基本资料").hide();
    $("#更改昵称").hide();
    $("#更改密码").hide();
    $("#购买VIP").show();
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
