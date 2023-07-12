package com.lookoutnews.action;

import com.lookoutnews.entity.User;
import com.lookoutnews.service.UserService;
import com.lookoutnews.service.impl.UserServiceImpl;
import com.lookoutnews.util.MD5;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/changePassword.do")

public class ChangePasswordServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        String newpwd = req.getParameter("newpwd");
        User user = userService.queryByUserId(id);
        try {
            user.setPwd(MD5.md5(newpwd,""));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        userService.updateUser(user);
    }
}
