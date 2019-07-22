package com.oaec.b2c.mapper;

import java.util.Map;

public interface CheckedMapper {

    Map<String,Object> query(Integer userId);

    Integer insert(Map<String,Object> map);
}
