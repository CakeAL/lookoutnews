<%--
  Created by IntelliJ IDEA.
  User: cakeal
  Date: 2023/7/12
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>瞭望新闻:注册</title>
  <script src="js/jquery-3.7.0.js" type="text/javascript"></script>
  <script src="layui/layui.js" type="text/javascript"></script>
  <script src="js/index.js" type="text/javascript"></script>
  <script src="js/md5.js" type="text/javascript"></script>
  <link href="layui/css/layui.css" rel="stylesheet" type="text/css">
  <link href="css/global.css" rel="stylesheet" type="text/css">
</head>
<body>
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
        <input type="text" name="username" value="" lay-verify="required" placeholder="用户名" lay-reqtext="请填写用户名" autocomplete="off" class="layui-input" lay-affix="clear">
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
      <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo-login">登录</button>
    </div>
    <span id="failPwd"></span>
  </div>
</form>

<script>
  layui.use(function(){
    var form = layui.form;
    var layer = layui.layer;
    // 提交事件
    form.on('submit(demo-login)', function(data){
      var field = data.field; // 获取表单字段值
      // 此处可执行 Ajax 等操作
      // …
      var pwd = md5(field.password);
      $.ajax({
        'url':"backend_login.do",
        'method':"GET",
        'data':{'username':field.username, 'password': pwd},
        'dataType':'text',
        'success':function (data){
          $("#failPwd").html(data);
        }
      });
      return false; // 阻止默认 form 跳转
    });
  });
</script>
</body>
</html>
