package com.oaec.b2c.mapper;

import java.util.List;
import java.util.Map;

public interface ProductMapper {

    List<Map<String,Object>> query(Map<String,Object> map);

    Map<String, Object> queryById(Map<String,Object> map);

    List<Map<String,Object>> queryHot();

    Integer update(Map<String,Object> map);
}
