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

        /*测试插入数据到数据库*/
        User u = new User(3, "ls123", "123456", 19);
        userMapper.insertUser(u);
        session.commit();  //插入数据后需要提交到数据库
//
//        /*测试从数据库删除数据*/
//        userMapper.deleteUserById(u.getUserId());
//        session.commit();

        /*测试修改密码*/
        userMapper.updatePwdById(u.getUserId(),"321654");
        session.commit();


    }
}
