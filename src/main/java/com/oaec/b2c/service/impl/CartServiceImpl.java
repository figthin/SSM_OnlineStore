package com.oaec.b2c.service.impl;

import com.oaec.b2c.mapper.CartMapper;
import com.oaec.b2c.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("cartService")
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;

    @Override
    public Boolean add(Integer userId, Integer productId, Integer amount, String color, String cartSize) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        map.put("productId",productId);
        map.put("amount",amount);
        map.put("color",color);
        map.put("size",cartSize);
        System.out.println("map = " + map);
        Map<String, Object> map1 = cartMapper.queryByProductId(map);
        System.out.println("map1 = " + map1);
        if (map1 == null){
            return cartMapper.insert(map) == 1;
        }
        return cartMapper.update(map) == 1;
    }

    @Override
    public List<Map<String, Object>> getCart(Integer userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        return cartMapper.query(map);
    }

    @Override
    public Boolean delete(Integer userId, Integer productId, String color, String size) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        map.put("productId",productId);
        map.put("size",size);
        map.put("color",color);
        return cartMapper.delete(map) == 1;
    }

    @Override
    public Map<String,Object> updateAmount(Integer cartId, Integer productId, String color, String size,String action) {
        Map<String, Object> map2 = cartMapper.queryByCartId(cartId);
        int amount = Integer.parseInt(map2.get("amount").toString());
        Map<String,Object> map = new HashMap<>();
        map.put("productId",productId);
        map.put("cartId",cartId);
        if ("add".equals(action)){
            Integer add = cartMapper.addAmount(map);
            Map<String, Object> map1 = cartMapper.queryTotalByProductId(map);
            map1.put("succ",add == 1);
            return map1;
        }
        Map<String, Object> map1 = new HashMap<>();
        if (amount > 1){
            Integer sub = cartMapper.subAmount(map);
            map1 = cartMapper.queryTotalByProductId(map);
            map1.put("succ",sub == 1);
        }else {
            map1.put("succ",true);
        }
        return map1;
    }

    @Override
    public Map<String, Object> total(Integer[] cartIds) {
        return cartMapper.total(cartIds);
    }

    @Override
    public Map<String, Object> getAmountByUserId(Integer userId) {
        return cartMapper.queryAmountByUserId(userId);
    }

    @Override
    public Map<String, Object> queryByCartId(Integer cartId) {
        return cartMapper.queryByCartId(cartId);
    }

    @Override
    public Map<String, Object> queryCartId(Integer userId, Integer productId, String color, String size) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        map.put("productId",productId);
        map.put("color",color);
        map.put("size",size);
        return cartMapper.queryByProductId(map);
    }

    @Override
    public Boolean deleteByCartIds(Integer[] cartIds) {
        return cartMapper.deleteByCartIds(cartIds) > 0;
    }


}
