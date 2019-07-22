package com.oaec.b2c.controller;

import com.oaec.b2c.service.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class CouponController {

    @Autowired
    private CouponService couponService;

    @GetMapping("/coupon")
    public String coupon(HttpSession session, Model model){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("user_id").toString());
        List<Map<String, Object>> coupons = couponService.getByUserId(userId);
        model.addAttribute("coupons",coupons);
        return "udai_coupon";
    }

}
