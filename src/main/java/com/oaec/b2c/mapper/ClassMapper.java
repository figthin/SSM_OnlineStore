package com.oaec.b2c.mapper;

import java.util.List;
import java.util.Map;

public interface ClassMapper {

    List<Map<String,Object>> queryClass1();

    List<Map<String,Object>> queryClass2(Integer class1Id);

}
