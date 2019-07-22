package com.oaec.b2c.service.impl;

import com.oaec.b2c.mapper.CartMapper;
import com.oaec.b2c.mapper.ClassMapper;
import com.oaec.b2c.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("classService")
public class ClassServiceImpl implements ClassService {

    @Autowired
    private ClassMapper classMapper;

    @Override
    public List<Map<String, Object>> getClass1() {
        return classMapper.queryClass1();
    }

    @Override
    public List<Map<String, Object>> getClass2(Integer class1Id) {
        return classMapper.queryClass2(class1Id);
    }
}
