package com.oaec.b2c.mapper;

import java.util.List;
import java.util.Map;

public interface CartMapper {
    Integer insert(Map<String,Object> map);

    List<Map<String,Object>> query(Map<String,Object> map);

    Map<String,Object> queryByProductId(Map<String,Object> map);

    Integer update(Map<String,Object> map);

    Map<String,Object> queryTotalByProductId(Map<String,Object> map);

    Integer delete(Map<String,Object> map);

    Integer addAmount(Map<String,Object> map);

    Integer subAmount(Map<String,Object> map);

    Map<String,Object> total(Integer[] cartIds);

    Map<String,Object> queryAmountByUserId(Integer userId);

    Map<String,Object> queryByCartId(Integer cartId);

    Integer deleteByCartIds(Integer[] cartIds);

}
