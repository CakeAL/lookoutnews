package com.lookoutnews.service.impl;

import com.lookoutnews.entity.BackendAdmin;
import com.lookoutnews.mapper.AdminMapper;
import com.lookoutnews.service.AdminService;
import com.lookoutnews.util.MyBatisUtil;

public class AdminServiceImpl implements AdminService {
    private AdminMapper adminMapper = MyBatisUtil.getSqlSession().getMapper(AdminMapper.class);
    public BackendAdmin queryByUserName(String name){
        return adminMapper.queryByUserName(name);
    }
}
