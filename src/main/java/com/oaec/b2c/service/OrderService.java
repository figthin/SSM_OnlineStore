package com.oaec.b2c.service;

import java.util.List;
import java.util.Map;

public interface OrderService {

    List<Map<String,Object>> orders(Integer page,Integer userId);

    List<Map<String,Object>> getProducts(Integer[] cartIds);

    Map<String,Object> getTotalByCartIds(Integer[] cartIds);

    Boolean add(Integer userId, Integer addressId);

    Map<String,Object> getNextOrderId(Integer userId);

    List<Map<String,Object>> getLatestOrders(Integer userId);

    /*List<Map<String,Object>> getOrdersByStatus0(Integer page,Integer userId);

    List<Map<String,Object>> getOrdersByStatus1(Integer page,Integer userId);

    List<Map<String,Object>> getOrdersByStatus2(Integer page,Integer userId);*/

}
