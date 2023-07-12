package com.lookoutnews.entity;

import lombok.Data;

@Data
public class BackendAdmin {
    /*
    DROP TABLE IF EXISTS `backend_admin`;
create table `backend_admin` (
    `id` int(11) not null auto_increment, -- 管理员id
    `UserName` varchar(50) NOT NULL ,
    `Password` varchar(50) NOT NULL ,
    PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
     */
    private int id;
    private String userName;
    private String password;
}
