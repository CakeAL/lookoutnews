package com.lookoutnews.mapper;

import com.lookoutnews.entity.News;

import java.util.List;

public interface NewsMapper {


    void update(News news);
    void addNews(News news);
    List<News> queryAllOrderById();
    List<News> queryByTitleWord(String keyWord);
    News queryByNewsId(int id);
}
