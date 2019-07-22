package com.oaec.b2c.mapper;

import java.util.List;
import java.util.Map;

public interface AddressMapper {

    List<Map<String,Object>> query(Map<String,Object> map);

    Integer insert(Map<String,Object> map);

    Integer updateDefault();

    Map<String,Object> queryByAddressId(Integer addressId);

    Map<String,Object> queryByOrderId(Integer addressId);

    Integer update(Map<String,Object> map);

    Integer delete(Integer addressId);

    Integer autoSetDefault(Integer addressId);

    Map<String,Object> queryLatestAddress();

    Integer updateDefaultAddress(Integer addressId);
}
