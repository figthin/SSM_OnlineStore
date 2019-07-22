package com.oaec.b2c.service.impl;

import com.github.pagehelper.PageHelper;
import com.oaec.b2c.mapper.ProductMapper;
import com.oaec.b2c.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Map<String, Object>> list(Integer page,String name, Integer productId, Integer class1Id,Integer class2Id,Integer class3Id) {
        Map<String,Object> map = new HashMap<>();
        map.put("name", name);
        map.put("productId", productId);
        map.put("class1Id", class1Id);
        map.put("class2Id", class2Id);
        map.put("class3Id", class3Id);
        PageHelper.startPage(page,4);
        List<Map<String, Object>> products = productMapper.query(map);
        return products;
    }

    @Override
    public Map<String, Object> itemShow(Integer productId) {
        Map<String,Object> map = new HashMap<>();
        map.put("productId",productId);
        return productMapper.queryById(map);
    }

    @Override
    public List<Map<String, Object>> getHot() {
        return productMapper.queryHot();
    }

    @Override
    public Boolean addSaleAndSubStock(Integer productId, Integer amount) {
        Map<String,Object> map = new HashMap<>();
        map.put("productId",productId);
        map.put("amount",amount);
        return productMapper.update(map) == 1;
    }

}
