package com.lookoutnews.entity;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class User {
 /*
 CREATE TABLE `user`  (
  `UId` int(11) NOT NULL AUTO_INCREMENT,
  `Uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像路径 /xxxxx.png/jpg/gif',
  `Upwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, -- 这是密码的MD5
  `uCreatetime` datetime(0) NULL DEFAULT NULL COMMENT '注册日期',
  `Hpath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsVIP` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '(1为会员 0为普通用户)',
  PRIMARY KEY (`UId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
  */
    private int id;
    private String name;
    private String pwd;
    private String phone;
    private Timestamp createTime;
    private String hPath;
    private int isVIP;
}
