package com.lookoutnews.mapper;

import com.lookoutnews.entity.User;
import com.lookoutnews.util.MD5;
import com.lookoutnews.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.sql.Timestamp;
import java.util.Date;

public class UserMapperTest {

    SqlSession sqlSession = null;
    UserMapper userMapper = null;

    @Before
    public void before(){
        sqlSession = MyBatisUtil.getSqlSession();
        userMapper = sqlSession.getMapper(UserMapper.class);
    }

    @After
    public void after(){ sqlSession.close(); }

    @Test
    public void testRegister() throws Exception {
        User user = new User();
        Timestamp timestamp = new Timestamp(new Date().getTime());
        user.setName("test用户");
        user.setPwd(MD5.md5("123456",""));
        user.setCreateTime(timestamp);
        user.setIsVIP(1);
        user.setPhone("19912345678");
        userMapper.register(user);
    }

    @Test
    public void testQueryByUserPhone() {
        User user = null;
        user = userMapper.queryByUserPhone("19912345678");
        System.out.println();
        System.out.println(user);
        System.out.println();
    }
}
