<%--
  Created by IntelliJ IDEA.
  User: cakeal
  Date: 2023/7/11
  Time: 14:44
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
  .demo-reg-container{width: 320px; margin: 21px auto 0;}
  .demo-reg-other .layui-icon{position: relative; display: inline-block; margin: 0 2px; top: 2px; font-size: 26px;}
</style>
<form class="layui-form">
  <div class="demo-reg-container">
    <div class="layui-form-item">
      <div class="layui-row">
        <div class="layui-col-xs7">
          <div class="layui-input-wrap">
            <div class="layui-input-prefix">
              <i class="layui-icon layui-icon-cellphone"></i>
            </div>
            <input type="text" name="phone" value="" lay-verify="required|phone" placeholder="手机号" lay-reqtext="请填写手机号" autocomplete="off" class="layui-input" id="reg-cellphone">
          </div>
        </div>
        <div class="layui-col-xs5">
          <div style="margin-left: 11px;">
            <button type="button" class="layui-btn layui-btn-fluid layui-btn-primary" lay-on="reg-get-vercode">获取验证码</button>
          </div>
        </div>
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-input-wrap">
        <div class="layui-input-prefix">
          <i class="layui-icon layui-icon-vercode"></i>
        </div>
        <input type="text" name="vercode" value="" lay-verify="required" placeholder="验证码" lay-reqtext="请填写验证码" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-input-wrap">
        <div class="layui-input-prefix">
          <i class="layui-icon layui-icon-password"></i>
        </div>
        <input type="password" name="password" value="" lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input" id="reg-password" lay-affix="eye">
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-input-wrap">
        <div class="layui-input-prefix">
          <i class="layui-icon layui-icon-password"></i>
        </div>
        <input type="password" name="confirmPassword" value="" lay-verify="required|confirmPassword" placeholder="确认密码" autocomplete="off" class="layui-input" lay-affix="eye">
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-input-wrap">
        <div class="layui-input-prefix">
          <i class="layui-icon layui-icon-username"></i>
        </div>
        <input type="text" name="nickname" value="" lay-verify="required" placeholder="昵称" autocomplete="off" class="layui-input" lay-affix="clear">
      </div>
    </div>
    <div class="layui-form-item">
      <input type="checkbox" name="agreement" lay-verify="required" lay-skin="primary" title="同意">
      <a href="#terms" target="_blank" style="position: relative; top: 6px; left: -15px;">
        <ins>用户协议</ins>
      </a>
    </div>
    <div class="layui-form-item">
      <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo-reg">注册</button>
    </div>

<%--    <div class="layui-form-item demo-reg-other">--%>
<%--      <label>社交账号注册</label>--%>
<%--      <span style="padding: 0 21px 0 6px;">--%>
<%--        <a href="javascript:;"><i class="layui-icon layui-icon-login-qq" style="color: #3492ed;"></i></a>--%>
<%--        <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat" style="color: #4daf29;"></i></a>--%>
<%--        <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo" style="color: #cf1900;"></i></a>--%>
<%--      </span>--%>
<%--      <a href="#login">登录已有帐号</a>--%>
<%--    </div>--%>
  </div>
</form>

<script>
  layui.use(function(){
    var $ = layui.$;
    var form = layui.form;
    var layer = layui.layer;
    var util = layui.util;

    // 自定义验证规则
    form.verify({
      // 确认密码
      confirmPassword: function(value, item){
        var passwordValue = $('#reg-password').val();
        if(value !== passwordValue){
          return '两次密码输入不一致';
        }
      }
    });

    // 提交事件
    form.on('submit(demo-reg)', function(data){
      var field = data.field; // 获取表单字段值

      // 是否勾选同意
      if(!field.agreement){
        layer.msg('您必须勾选同意用户协议才能注册');
        return false;
      }

      // 显示填写结果，仅作演示用
      // layer.alert(JSON.stringify(field), {
      //   title: '当前填写的字段值'
      // });
      //{"phone":"18810791080","vercode":"2210","password":"123456","confirmPassword":"123456","nickname":"cakeal","agreement":"on"}
      // 此处可执行 Ajax 等操作
      // …
      var pwd = md5(field.password);
      $.ajax({
        'url':"register.do",
        'method':"post",
        'data':{'phone': field.phone,
            'password': pwd, //进行md5加密后传输
            'confirmPassword': field.confirmPassword,
            'vercode': field.vercode,
            'nickname': field.nickname,
            'agreement': field.agreement},
        'dataType':'text',
        'success':function (data){
          //$("#addSomeText").html(data.msg);
          alert(data);
          if(data === "注册成功!"){
            window.location.href="/";
          }
        }
      });
      return false; // 阻止默认 form 跳转
    });

    // 普通事件
    util.on('lay-on', {
      // 获取验证码
      'reg-get-vercode': function(othis){
        var isvalid = form.validate('#reg-cellphone'); // 主动触发验证，v2.7.0 新增
        // 验证通过
        if(isvalid){
          layer.msg('手机号规则验证通过');
          // 此处可继续书写「发送验证码」等后续逻辑
          // …
          //alert($("#reg-cellphone").val());
          $.getJSON("sendSms.do", {phone: $("#reg-cellphone").val()}, function (data){
            // console.log(data);
            //alert(data);
          });
        }
      }
    });
  });
</script>
</body>
</html>
