package com.oaec.b2c.service.impl;

import com.github.pagehelper.PageHelper;
import com.oaec.b2c.mapper.OrderMapper;
import com.oaec.b2c.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Map<String, Object>> orders(Integer page,Integer userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        PageHelper.startPage(page,4);
        return orderMapper.query(map);
    }

    @Override
    public List<Map<String, Object>> getProducts(Integer[] cartIds) {
        return orderMapper.queryByCartIds(cartIds);
    }

    @Override
    public Map<String, Object> getTotalByCartIds(Integer[] cartIds) {
        return orderMapper.queryTotalByCartIds(cartIds);
    }

    @Override
    public Boolean add(Integer userId, Integer addressId) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        map.put("addressId",addressId);
        return orderMapper.insert(map) == 1;
    }

    @Override
    public Map<String, Object> getNextOrderId(Integer userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        return orderMapper.queryNextOrderId(map);
    }

    @Override
    public List<Map<String, Object>> getLatestOrders(Integer userId) {
        return orderMapper.queryLatestOrders(userId);
    }

    /*@Override
    public List<Map<String, Object>> getOrdersByStatus0(Integer page, Integer userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        PageHelper.startPage(page,4);
        return orderMapper.queryByOrderStatusIs0(map);
    }

    @Override
    public List<Map<String, Object>> getOrdersByStatus1(Integer page, Integer userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        PageHelper.startPage(page,4);
        return orderMapper.queryByOrderStatusIs1(map);
    }

    @Override
    public List<Map<String, Object>> getOrdersByStatus2(Integer page, Integer userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        PageHelper.startPage(page,4);
        return orderMapper.queryByOrderStatusIs2(map);
    }*/

}
