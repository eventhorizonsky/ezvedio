package com.xxxx.test;

import com.xxxx.entity.User;
import com.xxxx.mapper.UserMapper;
import com.xxxx.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

public class Test {
    public static void main(String[] args) {
        //获取sqlSession对象
        SqlSession session = GetSqlSession.createSqlSession();
        //得到对应Mapper
        UserMapper userMapper = session.getMapper(UserMapper.class);

//        /*测试通过名字查询用户对象*/
//        //调用方法,返回用户对象
//        User user = userMapper.queryUserByName("admin");
//        //测试连接数据库是否成功
//        System.out.println(user);

        User user  = new User("zs123", "123456", "789456", "456@456.com");
        userMapper.insertUser(user);
        session.commit();
    }
}
