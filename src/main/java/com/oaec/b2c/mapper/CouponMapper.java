package com.oaec.b2c.mapper;

import java.util.List;
import java.util.Map;

public interface CouponMapper {

    List<Map<String,Object>> query(Map<String,Object> map);

}
