package com.lookoutnews.service.impl;

import com.lookoutnews.entity.User;
import com.lookoutnews.mapper.UserMapper;
import com.lookoutnews.service.UserService;
import com.lookoutnews.util.MyBatisUtil;

public class UserServiceImpl implements UserService {
    private UserMapper userMapper = MyBatisUtil.getSqlSession().getMapper(UserMapper.class);
    public void register(User user) {
        userMapper.register(user);
    }
    public User queryByUserPhone(String phone) {
        return userMapper.queryByUserPhone(phone);
    }
    public User queryByUserId(int id){
        return userMapper.queryByUserId(id);
    }

    public void updateUser(User user){
        userMapper.update(user);
    }

}
