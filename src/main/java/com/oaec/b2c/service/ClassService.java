package com.oaec.b2c.service;

import java.util.List;
import java.util.Map;

public interface ClassService {
    List<Map<String,Object>> getClass1();

    List<Map<String,Object>> getClass2(Integer class1Id);
}
