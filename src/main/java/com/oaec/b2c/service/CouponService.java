package com.oaec.b2c.service;

import java.util.List;
import java.util.Map;

public interface CouponService {

    List<Map<String,Object>> getByUserId(Integer userId);

}
