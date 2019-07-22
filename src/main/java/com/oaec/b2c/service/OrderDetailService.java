package com.oaec.b2c.service;

import java.util.Map;

public interface OrderDetailService {

    Boolean add(Integer orderId,Integer productId,Double price,String url,Integer amount,Double freight,String color,String productSize,String name);


    Map<String,Object> getOrderDetailByOrderId(Integer orderId);
}
