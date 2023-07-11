package com.lookoutnews.mapper;

import com.lookoutnews.entity.User;

public interface UserMapper {
    void register(User user);
    User queryByUserPhone(String phone);
}
