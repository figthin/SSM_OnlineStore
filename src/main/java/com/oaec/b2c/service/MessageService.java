package com.oaec.b2c.service;

import java.util.List;
import java.util.Map;

public interface MessageService {

    List<Map<String,Object>> getMessagesByUserId(Integer userId);

}
