package com.oaec.b2c.service.impl;

import com.oaec.b2c.mapper.AddressMapper;
import com.oaec.b2c.mapper.OrderMapper;
import com.oaec.b2c.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("addressService")
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressMapper addressMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Map<String, Object>> address(Integer userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        return addressMapper.query(map);
    }

    @Override
    public Boolean saveAddress(String name, String address, String tel, Integer isDefault, Integer userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("name",name);
        map.put("tel",tel);
        map.put("addressDetail",address);
        map.put("userId",userId);
        return addressMapper.insert(map) == 1;
    }

    @Override
    public Boolean updateAddress(String name, String address, String tel, Integer isDefault, Integer addressId) {
        Map<String,Object> map = new HashMap<>();
        map.put("name",name);
        map.put("tel",tel);
        map.put("addressDetail",address);
        map.put("addressId",addressId);
        map.put("isDefault",isDefault);
        System.out.println("map = " + map);
        return addressMapper.update(map) == 1;
    }

    @Override
    public Integer reSetDefault() {
        return addressMapper.updateDefault();
    }

    @Override
    public Map<String, Object> getByAddressId(Integer addressId) {
        return addressMapper.queryByAddressId(addressId);
    }

    @Override
    public Boolean deleteAddress(Integer addressId) {
        int is_default = Integer.parseInt(addressMapper.queryByAddressId(addressId).get("is_default").toString());
        List<Map<String, Object>> list = orderMapper.queryByAddressId(addressId);
        if (list.size() > 0){
            return false;
        }
        Integer delete = addressMapper.delete(addressId);
        if (is_default == 1){
            int latestAddressId = Integer.parseInt(addressMapper.queryLatestAddress().get("address_id").toString());
            addressMapper.autoSetDefault(latestAddressId);
        }
        return delete == 1;
    }

    @Override
    public Boolean setDefaultAddress(Integer addressId) {
        addressMapper.updateDefault();
        return addressMapper.updateDefaultAddress(addressId) == 1;
    }
}
