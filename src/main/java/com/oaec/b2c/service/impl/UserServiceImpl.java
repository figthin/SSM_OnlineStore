package com.oaec.b2c.service.impl;

import com.oaec.b2c.mapper.UserMapper;
import com.oaec.b2c.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Map<String, Object> login(String tel, String password) {
        Map<String,Object> map = new HashMap<>();
        map.put("tel",tel);
        Map<String, Object> login = userMapper.queryByTel(map);
        if (login == null){
            login = new HashMap<>();
//            Map<String,Object> login = new Map<String, Object>();
            //登录失败，用户不存在
            login.put("error","用户不存在！");
            return login;
        }else{
            //登录失败，密码错误
            if (!login.get("password").equals(password)){
                login.clear();
                login.put("error","密码错误！");
                return login;
            }else{
                //登录成功
                return login;
            }
        }
    }

    @Override
    public Map<String, Object> getUserByUserId(Integer userId) {
        return userMapper.queryByUserId(userId);
    }

    @Override
    public Map<String, Object> register(String phone, String password, String password2) {
        Map<String, Object> map = new HashMap<>();
        map.put("tel",phone);
        Map<String, Object> map1 = userMapper.queryByTel(map);
        if (map1 != null){
            map.put("error","注册失败，用户已存在");
            return map;
        }
        if (!password.equals(password2)){
            map.put("error","注册失败，两次密码不一致！");
            return map;
        }
        Map<String,Object> user = new HashMap<>();
        user.put("tel",phone);
        user.put("password",password);
        Integer integer = userMapper.doInsert(user);
        if (integer == 1) {
            map.put("succ",map);
            return map;
        }else {
            map.put("error","注册失败，用户已存在");
            return map;
        }
    }

    @Override
    public Boolean charge(Integer userId, double money) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        map.put("money",money);
        return userMapper.doUpdate(map) == 1;
    }

    @Override
    public Boolean withDraw(Integer userId, double money) {
        double balance = Double.parseDouble(userMapper.queryByUserId(userId).get("balance").toString());
        if (balance < money){
            return false;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        map.put("money",money);
        return userMapper.doSubUpdate(map) == 1;
    }

    @Override
    public Boolean checkIn(Integer userId) {
        return userMapper.updateCheckIn(userId) == 1;
    }

    @Override
    public Boolean modifyUserMessage(String userName, String gender, String birth, Integer userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("userName",userName);
        map.put("gender",gender);
        map.put("birth",birth);
        map.put("userId",userId);
        return userMapper.updateMessage(map) == 1;
    }

    @Override
    public Boolean upMemberLevel(Integer userId, Integer memberLevel,Double money) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        map.put("memberLevel",memberLevel);
        map.put("money",money);
        return userMapper.updateMemberLevel(map) == 1;
    }
}
