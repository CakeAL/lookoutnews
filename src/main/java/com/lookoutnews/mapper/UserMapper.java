package com.lookoutnews.mapper;

import com.lookoutnews.entity.User;

import java.util.List;

public interface UserMapper {
    void update(User user);
    void register(User user);
    User queryByUserPhone(String phone);
    User queryByUserId(int id);

    List<User> queryAll();
}
