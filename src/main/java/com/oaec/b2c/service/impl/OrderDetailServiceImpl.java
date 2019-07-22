package com.oaec.b2c.service.impl;

import com.oaec.b2c.mapper.AddressMapper;
import com.oaec.b2c.mapper.OrderDetailMapper;
import com.oaec.b2c.mapper.OrderMapper;
import com.oaec.b2c.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("orderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService {

    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private AddressMapper addressMapper;

    @Override
    public Boolean add(Integer orderId, Integer productId, Double price, String url, Integer amount, Double freight, String color, String productSize, String name) {
        Map<String,Object> map = new HashMap<>();
        map.put("orderId",orderId);
        map.put("productId",productId);
        map.put("price",price);
        map.put("url",url);
        map.put("amount",amount);
        map.put("freight",freight);
        map.put("productSize",productSize);
        map.put("name",name);
        return orderDetailMapper.insert(map) == 1;
    }

    @Override
    public Map<String, Object> getOrderDetailByOrderId(Integer orderId) {
        Map<String, Object> map = orderMapper.queryByOrderId(orderId);
        Map<String, Object> address = addressMapper.queryByOrderId(orderId);
        Double totalPrice = Double.parseDouble(orderDetailMapper.queryTotalPriceByOrderId(orderId).get("totalPrice").toString());
        map.put("totalPrice",totalPrice);
        map.put("address",address);
        List<Map<String, Object>> products = orderDetailMapper.query(orderId);
        map.put("products",products);
        return map;
    }
}
