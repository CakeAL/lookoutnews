package com.lookoutnews.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;


public class MyBatisUtil {
    private static SqlSessionFactory sessionFactory;
    static {
        InputStream in= null;
        try {
            in = Resources.getResourceAsStream("mybatis-config.xml");
            sessionFactory=new SqlSessionFactoryBuilder().build(in);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
    public static SqlSession getSqlSession(){
        return  sessionFactory.openSession(true);//代表事务自动提交
    }
}
