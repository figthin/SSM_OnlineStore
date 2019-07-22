package com.oaec.b2c.controller;

import com.oaec.b2c.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class OrderDetailController {

    @Autowired
    private OrderDetailService orderDetailService;

    @GetMapping("/orderDetail")
    public String orderDetail(Integer orderId, Model model){
        Map<String, Object> orderDetail = orderDetailService.getOrderDetailByOrderId(orderId);
        model.addAttribute("orderDetail",orderDetail);
        return "udai_order_detail";
    }
}
