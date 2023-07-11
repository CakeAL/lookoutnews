package com.lookoutnews.entity;

import lombok.Data;

@Data
public class News {
    /*
  CREATE TABLE `news` (
  `Id` int(11) NOT NULL AUTO_INCREMENT, -- 新闻id
  `title` varchar(255) DEFAULT NULL, -- 标题
  `author` varchar(255) DEFAULT NULL, -- 作者
  `publish_time` varchar(255) DEFAULT NULL, -- 发布时间
  `content` longtext, -- 新闻内容
  `url` varchar(255) DEFAULT NULL, -- 新闻在观察者网的连接
  `key_word` varchar(255) DEFAULT NULL, -- 关键词
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8;
     */
    private int id;
    private String title;
    private String author;
    private String publishTime;
    private String content;
    private String url;
    private String keyWord;
}
