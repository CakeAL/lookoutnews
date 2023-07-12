package com.lookoutnews.action;

import com.lookoutnews.entity.BackendAdmin;
import com.lookoutnews.service.AdminService;
import com.lookoutnews.service.impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/backend_login.do")
public class BackendLoginServlet extends HttpServlet {
    private AdminService adminService = new AdminServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        BackendAdmin backendAdmin = adminService.queryByUserName(userName);
        //System.out.println(backendAdmin);
        if (backendAdmin != null && password.equals(backendAdmin.getPassword())){
            req.getRequestDispatcher("backend/backend.jsp").forward(req, resp);
        } else {
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
