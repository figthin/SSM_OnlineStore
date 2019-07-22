package com.oaec.b2c.service;

import java.util.List;
import java.util.Map;

public interface CartService {
    Boolean add(Integer userId, Integer productId, Integer amount, String color, String cartSize);

    List<Map<String,Object>> getCart(Integer userId);

    Boolean delete(Integer userId, Integer productId, String color, String size);

    Map<String,Object> updateAmount(Integer cartId, Integer productId, String color, String size,String action);

    Map<String,Object> total(Integer[] cartIds);

    Map<String,Object> getAmountByUserId(Integer userId);

    Map<String,Object> queryByCartId(Integer cartId);

    Map<String,Object> queryCartId(Integer userId,Integer productId,String color, String size);

    Boolean deleteByCartIds(Integer[] cartIds);
}
