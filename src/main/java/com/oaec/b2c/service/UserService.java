package com.oaec.b2c.service;

import java.util.Map;

public interface UserService {
    Map<String,Object> login(String tel, String password);

    Map<String,Object> getUserByUserId(Integer userId);

    Map<String,Object> register(String phone, String password, String password2);

    Boolean charge(Integer userId,double money);

    Boolean withDraw(Integer userId,double money);

    Boolean checkIn(Integer userId);

    Boolean modifyUserMessage(String userName,String gender,String birth,Integer userId);

    Boolean upMemberLevel(Integer userId,Integer memberLevel,Double money);
}
