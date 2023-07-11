package com.lookoutnews.service;

import com.lookoutnews.entity.User;

public interface UserService {
    void register(User user);
    User queryByUserPhone(String phone);
}
