package com.lookoutnews.action;

import com.lookoutnews.entity.User;
import com.lookoutnews.service.UserService;
import com.lookoutnews.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(urlPatterns = "/register.do")
public class RegisterServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //{"phone":"18810791080","vercode":"2210","password":"123456","confirmPassword":"123456","nickname":"cakeal","agreement":"on"}
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String phone = req.getParameter("phone");
        String vercode = req.getParameter("vercode");
        String password = req.getParameter("password");
        String nickname = req.getParameter("nickname");
        if (!vercode.equals("") && vercode.equals(SendSmsServlet.getCode())){
            SendSmsServlet.resetCode(); //重置code
            User user = new User();
            user.setName(nickname);
            user.setPhone(phone);
            user.setIsVIP(0);
            user.setCreateTime(new Timestamp(new Date().getTime()));
            user.setPwd(password);
            userService.register(user);
            PrintWriter out = resp.getWriter();
            out.println("注册成功!");
            out.flush();
            out.close();
        } else {
            PrintWriter out = resp.getWriter();
            out.println("验证码错误!");
            out.flush();
            out.close();
        }
    }
}
