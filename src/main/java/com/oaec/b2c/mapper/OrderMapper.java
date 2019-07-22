package com.oaec.b2c.mapper;

import java.util.List;
import java.util.Map;

public interface OrderMapper {

    List<Map<String,Object>> query(Map<String,Object> map);

    List<Map<String,Object>> queryByCartIds(Integer[] cartIds);

    Map<String,Object> queryTotalByCartIds(Integer[] cartIds);

    Integer insert(Map<String,Object> map);

    Map<String,Object> queryNextOrderId(Map<String,Object> map);

    List<Map<String,Object>> queryLatestOrders(Integer userId);

    Map<String,Object> queryByOrderId(Integer orderId);

    /*List<Map<String,Object>> queryByOrderStatusIs0(Map<String,Object> map);

    List<Map<String,Object>> queryByOrderStatusIs1(Map<String,Object> map);

    List<Map<String,Object>> queryByOrderStatusIs2(Map<String,Object> map);*/

    List<Map<String,Object>> queryByAddressId(Integer addressId);
}
