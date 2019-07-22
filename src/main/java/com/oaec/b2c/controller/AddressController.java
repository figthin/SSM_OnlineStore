package com.oaec.b2c.controller;

import com.alibaba.fastjson.JSON;
import com.oaec.b2c.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AddressController {

    @Autowired
    private AddressService addressService;

    @GetMapping("/address")
    public String addressForm(HttpSession session, Model model){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("user_id").toString());
        List<Map<String, Object>> address = addressService.address(userId);
        model.addAttribute("address",address);
        return "udai_address";
    }

    @GetMapping(value = "/addAddress",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String addAddress(HttpSession session,String name,String address,String tel,Integer isDefault){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int user_id = Integer.parseInt(user.get("user_id").toString());
        if (isDefault == 1){
            addressService.reSetDefault();
        }
        Boolean aBoolean = addressService.saveAddress(name, address, tel, isDefault, user_id);

        Map<String,Object> json = new HashMap<>();
        json.put("succ",aBoolean);
        return JSON.toJSONString(json);
    }

    @GetMapping(value = "/updateAddress",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String updateAddress(String name,String address,String tel,Integer isDefault,String addressId){
        System.out.println("name = " + name);
        System.out.println("address = " + address);
        System.out.println("tel = " + tel);
        System.out.println("isDefault = " + isDefault);
        System.out.println("addressId = " + addressId);
        if (isDefault == 1){
            addressService.reSetDefault();
        }
        Boolean aBoolean = addressService.updateAddress(name, address, tel, isDefault, Integer.parseInt(addressId));
        Map<String,Object> json = new HashMap<>();
        json.put("succ",aBoolean);
        return JSON.toJSONString(json);
    }

    @GetMapping("/address_edit")
    public String address_edit(String addressId,HttpSession session,Model model){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("user_id").toString());
        List<Map<String, Object>> address = addressService.address(userId);
        model.addAttribute("address",address);
        Map<String, Object> byAddressId = addressService.getByAddressId(Integer.parseInt(addressId));
        model.addAttribute("byAddressId",byAddressId);
        return "udai_address_edit";
    }

    @GetMapping(value = "/deleteAddress",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String deleteAddress(String addressId){
        Boolean aBoolean = addressService.deleteAddress(Integer.parseInt(addressId));
        Map<String,Object> json = new HashMap<>();
        json.put("succ",aBoolean);
        return JSON.toJSONString(json);
    }

    @GetMapping(value = "/setDefault",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String setDefault(String addressId){
        Boolean aBoolean = addressService.setDefaultAddress(Integer.parseInt(addressId));
        Map<String,Object> json = new HashMap<>();
        json.put("succ",aBoolean);
        return JSON.toJSONString(json);
    }
}
