package com.lookoutnews.action;

import com.lookoutnews.entity.User;
import com.lookoutnews.service.UserService;
import com.lookoutnews.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

//@WebServlet(urlPatterns = "/login.do")
public class LoginServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        // 其实是电话号
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        User user = userService.queryByUserPhone(phone);
        if(password.equals(user.getPwd())){
            System.out.println("fdafdasfdasdfasdf\n");
            //登陆成功
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            //转发到主页，处理登陆后的主页
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        } else {
            //req.setAttribute("errorMsg", "用户名或密码错误");
            PrintWriter out = resp.getWriter();
            out.println("用户名或密码错误");
            out.flush();
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
