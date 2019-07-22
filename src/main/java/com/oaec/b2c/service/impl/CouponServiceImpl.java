package com.oaec.b2c.service.impl;

import com.oaec.b2c.mapper.CouponMapper;
import com.oaec.b2c.service.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("couponService")
public class CouponServiceImpl implements CouponService {

    @Autowired
    private CouponMapper couponMapper;

    @Override
    public List<Map<String, Object>> getByUserId(Integer userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        return couponMapper.query(map);
    }
}
