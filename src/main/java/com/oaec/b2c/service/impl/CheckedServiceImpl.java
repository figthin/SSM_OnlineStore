package com.oaec.b2c.service.impl;

import com.oaec.b2c.mapper.CheckedMapper;
import com.oaec.b2c.service.CheckedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service("checkedService")
public class CheckedServiceImpl implements CheckedService {

    @Autowired
    private CheckedMapper checkedMapper;


    @Override
    public Boolean check(Integer userId) {
        Map<String, Object> query = checkedMapper.query(userId);
        if (query != null){
            return false;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        return checkedMapper.insert(map) == 1;
    }
}
