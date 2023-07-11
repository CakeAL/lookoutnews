package com.lookoutnews.mapper;

import com.lookoutnews.entity.News;
import com.lookoutnews.util.MyBatisUtil;
import org.junit.After;
import org.junit.Before;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.List;

public class NewsMapperTest {
    SqlSession sqlSession = null;
    NewsMapper newsMapper = null;

    @Before
    public void before(){
        sqlSession = MyBatisUtil.getSqlSession();
        newsMapper = sqlSession.getMapper(NewsMapper.class);
    }

    @After
    public void after(){ sqlSession.close(); }

    @Test
    public void testAddNews(){
        News news = new News();
        news.setAuthor("测试作者");
        news.setTitle("这是个标题");
        news.setUrl("https://测试url.com");
        news.setKeyWord("美国,中美关系");
        news.setPublishTime("2020-07-13 07:18:05");;
        news.setContent("这是测试内容这是测试内容这是测试内容这是测试内容这是测试内容这是测试内容.");
        newsMapper.addNews(news);
    }

    @Test
    public void testUpdate(){
        News news = new News();
        news.setAuthor("测试作者");
        news.setTitle("更改的这是个标题");
        news.setUrl("https://测试url.com");
        news.setKeyWord("美国,中美关系");
        news.setPublishTime("2020-07-13 07:18:05");;
        news.setContent("这是测试内容这是测试内容这是测试内容这是测试内容这是测试内容这是测试内容.");
        news.setId(414);
        newsMapper.update(news);
    }

    @Test
    public void testQueryAllOrderById(){
        List<News> news = newsMapper.queryAllOrderById();
        news.forEach(System.out::println);
    }

    @Test
    public void testQueryByTitleWord(){
        String keyWord = "美国";
        keyWord = "%" + keyWord + "%";
        List<News> news = newsMapper.queryByTitleWord(keyWord);
        news.forEach(System.out::println);
    }
}
