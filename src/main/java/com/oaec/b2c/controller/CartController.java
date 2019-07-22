package com.oaec.b2c.controller;

import com.alibaba.fastjson.JSON;
import com.mysql.fabric.xmlrpc.base.Array;
import com.mysql.fabric.xmlrpc.base.Param;
import com.oaec.b2c.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping({"/cart"})
    public String cart(HttpSession session, Model model){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("user_id").toString());
        List<Map<String, Object>> products = cartService.getCart(userId);
        model.addAttribute("products",products);
        return "udai_shopcart";
    }

    @GetMapping(value = "/addCart",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String addCart(HttpSession session,Integer productId,String color,String size,Integer amount){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        Integer userId = Integer.parseInt(user.get("user_id").toString());
        Boolean add = cartService.add(userId, productId, amount, color, size);
        Map<String,Object> json = new HashMap<>();
        json.put("succ",add);
        return JSON.toJSONString(json);
    }

    @GetMapping(value = "/cartTotal",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String total(HttpSession session, Integer[] cartId){
        Map<String, Object> total = cartService.total(cartId);
        return JSON.toJSONString(total);
    }

    @GetMapping(value = "/cart/delete",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String delete(HttpSession session, Integer productId, String color, String size){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("user_id").toString());
        Boolean delete = cartService.delete(userId, productId, color, size);
        Map<String,Object> json = new HashMap<>();
        json.put("succ",delete);
        return JSON.toJSONString(json);
    }
    @GetMapping(value = "/cart/deleteAll",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String deleteAll(HttpSession session, String[] productId, String[] color, String[] size){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("user_id").toString());
        Integer[] cartIds = new Integer[productId.length];
        for (int i = 0; i < productId.length; i++){
            Map<String, Object> map = cartService.queryCartId(userId, Integer.parseInt(productId[i]), color[i], size[i]);
            int cartId = Integer.parseInt(map.get("cart_id").toString());
            cartIds[i] = cartId;
        }
        Boolean aBoolean = cartService.deleteByCartIds(cartIds);
        Map<String,Object> json = new HashMap<>();
        json.put("succ",aBoolean);
        return JSON.toJSONString(json);
    }


    @GetMapping(value = "/updateAmount",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String updateAmount(Integer cartId, Integer productId, String color, String size, String action){
        Map<String, Object> map = cartService.updateAmount(cartId, productId, color, size, action);
        Map<String,Object> json = new HashMap<>();
        json.put("totalPrice",map);
        return JSON.toJSONString(json);
    }

}
