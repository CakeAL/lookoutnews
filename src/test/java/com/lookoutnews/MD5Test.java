package com.lookoutnews;

import com.lookoutnews.util.MD5;
import org.junit.Test;

import java.util.UUID;

public class MD5Test {
    @Test
    public void test() throws Exception {
        String key=UUID.randomUUID().toString();
        System.out.println("key="+key);
        System.out.println("MD5加密...");
        String md5Pwd= MD5.md5("123456","");

        System.out.println("MD5密码验证...");
        boolean b=MD5.verify("123456","",md5Pwd);
        System.out.println(b);
    }
}
