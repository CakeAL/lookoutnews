package com.lookoutnews.service;

import com.lookoutnews.entity.BackendAdmin;

public interface AdminService {
    public BackendAdmin queryByUserName(String name);
}
