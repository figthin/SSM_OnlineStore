package com.oaec.b2c.mapper;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    Map<String,Object> query(Map<String,Object> map);

    Map<String,Object> queryByUserId(Integer userId);

    Integer doInsert(Map<String,Object> map);

    Integer doUpdate(Map<String,Object> map);

    Integer doSubUpdate(Map<String,Object> map);

    Integer updateCheckIn(Integer userId);

    Integer updateMessage(Map<String,Object> map);

    Integer updateMemberLevel(Map<String,Object> map);

    Map<String, Object> queryByTel(Map<String,Object> map);
}
