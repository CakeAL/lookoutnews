package com.lookoutnews.mapper;

import com.lookoutnews.entity.BackendAdmin;

public interface AdminMapper {
    BackendAdmin queryByUserName(String name);
}
