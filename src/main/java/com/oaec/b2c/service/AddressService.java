package com.oaec.b2c.service;

import java.util.List;
import java.util.Map;

public interface AddressService {

    List<Map<String,Object>> address(Integer userId);

    Boolean saveAddress(String name,String address,String tel,Integer isDefault,Integer userId);

    Boolean updateAddress(String name,String address,String tel,Integer isDefault,Integer addressId);

    Integer reSetDefault();

    Map<String,Object> getByAddressId(Integer addressId);

    Boolean deleteAddress(Integer addressId);

    Boolean setDefaultAddress(Integer addressId);
}
