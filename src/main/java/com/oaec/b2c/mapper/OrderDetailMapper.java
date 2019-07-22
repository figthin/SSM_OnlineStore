package com.oaec.b2c.mapper;

import java.util.List;
import java.util.Map;

public interface OrderDetailMapper {

    Integer insert(Map<String,Object> map);

    Map<String,Object> queryTotalPriceByOrderId(Integer orderId);

    List<Map<String,Object>> query(Integer orderId);
}
