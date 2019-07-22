package com.oaec.b2c.service;


import java.util.List;
import java.util.Map;

public interface ProductService {

    List<Map<String,Object>> list(Integer page, String name, Integer productId, Integer class1Id,Integer class2Id,Integer class3Id);

    Map<String,Object> itemShow(Integer productId);

    List<Map<String,Object>> getHot();

    Boolean addSaleAndSubStock(Integer productId,Integer amount);
}
