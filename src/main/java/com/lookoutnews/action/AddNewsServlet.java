package com.lookoutnews.action;

import com.lookoutnews.entity.News;
import com.lookoutnews.mapper.NewsMapper;
import com.lookoutnews.util.MarkdownUtils;
import com.lookoutnews.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(urlPatterns = "/addNews.do")
public class AddNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String keyWord = req.getParameter("keyWord");
        String content = req.getParameter("content");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        content = MarkdownUtils.markdownToHtmlExtensions(content);
        News news = new News();
        news.setTitle(title);
        news.setAuthor(author);
        news.setKeyWord(keyWord);
        news.setContent(content);
        news.setPublishTime(timestamp.toString());
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
        newsMapper.addNews(news);
    }
}
