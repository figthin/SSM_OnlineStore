package com.oaec.b2c.service.impl;

import com.oaec.b2c.mapper.MessageMapper;
import com.oaec.b2c.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("messageService")
public class messageServiceImpl implements MessageService {

    @Autowired
    private MessageMapper messageMapper;

    @Override
    public List<Map<String, Object>> getMessagesByUserId(Integer userId) {
        Map<String,Object> map = new HashMap<>();
        return messageMapper.query(map);
    }
}
