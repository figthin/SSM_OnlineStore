package com.oaec.b2c.controller;

import com.oaec.b2c.service.CartService;
import com.oaec.b2c.service.ClassService;
import com.oaec.b2c.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ClassController {

    @Autowired
    private ClassService classService;

    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService;

    @GetMapping("/index")
    public String query(Model model, HttpSession session){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        if (user != null){
            int userId = Integer.parseInt(user.get("user_id").toString());
            Map<String, Object> cartAmount = cartService.getAmountByUserId(userId);
            model.addAttribute("cartAmount",cartAmount);
        }else {
            Map<String,Object> map = new HashMap<>();
            map.put("count",0);
            model.addAttribute("cartAmount",map);
        }
        List<Map<String, Object>> class1 = classService.getClass1();
        model.addAttribute("navs",class1);
        List<Map<String, Object>> hot = productService.getHot();
        model.addAttribute("products",hot);
        return "index";
    }
}
