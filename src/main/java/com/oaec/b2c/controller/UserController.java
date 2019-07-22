package com.oaec.b2c.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.oaec.b2c.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private CouponService couponService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CheckedService checkedService;

    @GetMapping({"/login","/logout"})
    public String login(HttpSession session){
        session.invalidate();
        return "login";
    }

    @PostMapping(value = "/login",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String postLogin(WebRequest req, HttpSession session){
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String uri = req.getParameter("uri");
        Map<String, Object> login = userService.login(phone, password);
        Map<String, Object> json = new HashMap<>();
        if(!login.containsKey("error")){
            json.put("result",true);
            session.setAttribute("user",login);
            if (uri!=null){
                json.put("uri",uri);
            }
        }else{
            json.put("result",false);
            json.put("error",login.get("error"));
        }
        return JSON.toJSONString(json);
    }


    @GetMapping("/integral")
    public String integral(HttpSession session,Model model){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int user_id = Integer.parseInt(user.get("user_id").toString());
        Map<String, Object> userByUserId = userService.getUserByUserId(user_id);
        model.addAttribute("user",userByUserId);
        return "udai_integral";
    }


    @PostMapping(value = "/register",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String register(String phone, String password, String password2){
        Map<String, Object> register = userService.register(phone, password, password2);
        if (register.containsKey("succ")){
            register.put("result",true);
        }else {
            register.put("result",false);
        }
        String s = JSON.toJSONString(register);
        return s;
    }

    @GetMapping("/register")
    public String registerForm(Model model){
        model.addAttribute("isRegister",true);
        return "login";
    }

    @GetMapping(value = "/charge",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String charge(HttpSession session,String money){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int user_id = Integer.parseInt(user.get("user_id").toString());
        Boolean charge = userService.charge(user_id, Double.parseDouble(money));
        Map<String, Object> userByUserId = userService.getUserByUserId(user_id);
        Map<String,Object> json = new HashMap<>();
        json.put("result",charge);
        json.put("balance",userByUserId.get("balance"));
        return JSON.toJSONString(json);
    }

    @GetMapping(value = "/withDraw",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String withDraw(HttpSession session,String money){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int user_id = Integer.parseInt(user.get("user_id").toString());
        Boolean charge = userService.withDraw(user_id, Double.parseDouble(money));
        Map<String, Object> userByUserId = userService.getUserByUserId(user_id);
        Map<String,Object> json = new HashMap<>();
        json.put("result",charge);
        json.put("balance",userByUserId.get("balance"));
        return JSON.toJSONString(json);
    }

    @GetMapping(value = "/checkIn",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String checkIn(HttpSession session){
        Map<String,Object> user = (Map<String, Object>)session.getAttribute("user");
        int user_id = Integer.parseInt(user.get("user_id").toString());
        Boolean check = checkedService.check(user_id);
        Map<String,Object> json = new HashMap<>();
        if (check == false){
            json.put("result",check);
            return JSON.toJSONString(json);
        }
        Boolean aBoolean = userService.checkIn(user_id);
        Map<String, Object> userByUserId = userService.getUserByUserId(user_id);
        json.put("result",aBoolean);
        json.put("checkIn",userByUserId.get("check_in"));
        json.put("integral",userByUserId.get("integral"));
        return JSON.toJSONString(json);
    }

    @GetMapping("/setting")
    public String setting(HttpSession session,Model model){
        Map<String,Object> user = (Map<String, Object>)session.getAttribute("user");
        int user_id = Integer.parseInt(user.get("user_id").toString());
        Map<String, Object> map = userService.getUserByUserId(user_id);
        model.addAttribute("user",map);
        return "udai_setting";
    }

    @GetMapping("/welcome")
    public String welcome(HttpSession session,Model model, @RequestParam(required = false,defaultValue = "1") Integer page){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        Integer user_id = Integer.parseInt(user.get("user_id").toString());
        Map<String, Object> userByUserId = userService.getUserByUserId(user_id);
        model.addAttribute("user",userByUserId);
        List<Map<String, Object>> latestOrders = orderService.getLatestOrders(user_id);
        for (Map<String, Object> latestOrder : latestOrders) {
            String orders_id = latestOrder.get("order_id").toString();
            Map<String, Object> products = orderDetailService.getOrderDetailByOrderId(Integer.parseInt(orders_id));
            String address_id = latestOrder.get("address_id").toString();
            Map<String, Object> address = addressService.getByAddressId(Integer.parseInt(address_id));
            latestOrder.put("address",address);
        }
        model.addAttribute("latestOrders",latestOrders);
        /*List<Map<String, Object>> list0 = orderService.getOrdersByStatus0(page, user_id);
        List<Map<String, Object>> list1 = orderService.getOrdersByStatus1(page, user_id);
        List<Map<String, Object>> list2 = orderService.getOrdersByStatus2(page, user_id);
        model.addAttribute("status0",list0);
        model.addAttribute("status1",list1);
        model.addAttribute("status2",list2);
        if (list0 instanceof Page){
            Page productPage = (Page) list0;
            int status0PageNum = productPage.getPageNum();
            int status0Pages = productPage.getPages();
            model.addAttribute("status0PageNum",status0PageNum);
            model.addAttribute("status0Pages",status0Pages);
        }
        if (list1 instanceof Page){
            Page productPage = (Page) list1;
            int status1PageNum = productPage.getPageNum();
            int status1Pages = productPage.getPages();
            model.addAttribute("status1PageNum",status1PageNum);
            model.addAttribute("status1Pages",status1Pages);
        }
        if (list2 instanceof Page){
            Page productPage = (Page) list2;
            int status2PageNum = productPage.getPageNum();
            int status2Pages = productPage.getPages();
            model.addAttribute("status2PageNum",status2PageNum);
            model.addAttribute("status2Pages",status2Pages);
        }
        model.addAttribute("status0",list0);
        model.addAttribute("status1",list1);
        model.addAttribute("status2",list2);*/
        List<Map<String, Object>> messages = messageService.getMessagesByUserId(user_id);
        model.addAttribute("messages",messages);
        List<Map<String, Object>> coupons = couponService.getByUserId(user_id);
        model.addAttribute("coupons",coupons);
        List<Map<String, Object>> hot = productService.getHot();
        model.addAttribute("hot",hot);
        return "udai_welcome";
    }

    @GetMapping(value = "/updateUserMessage",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String updateUserMessage(HttpSession session,String userName,String userBirth,String gender){
        Map<String,Object> user = (Map<String, Object>)session.getAttribute("user");
        int user_id = Integer.parseInt(user.get("user_id").toString());
        Boolean aBoolean = userService.modifyUserMessage(userName, gender, userBirth, user_id);
        Map<String,Object> json = new HashMap<>();
        json.put("result",aBoolean);
        return JSON.toJSONString(json);
    }

    @GetMapping("/treasurer")
    public String treasurer(HttpSession session,Model model){
        Map<String,Object> user = (Map<String, Object>)session.getAttribute("user");
        int user_id = Integer.parseInt(user.get("user_id").toString());
        Map<String, Object> map = userService.getUserByUserId(user_id);
        model.addAttribute("user",map);
        return "udai_treasurer";
    }

    @GetMapping(value = "/agentLevel",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String agentLevel(HttpSession session,String val,String money){
        double pay = Double.parseDouble(money);
        int isMember = Integer.parseInt(val);
        Map<String,Object> user = (Map<String, Object>)session.getAttribute("user");
        double balance = Double.parseDouble(user.get("balance").toString());
        Map<String,Object> json = new HashMap<>();
        if (balance < pay){
            json.put("error","会员开通失败，余额不足！");
            return JSON.toJSONString(json);
        }
        int user_id = Integer.parseInt(user.get("user_id").toString());
        Boolean aBoolean = userService.upMemberLevel(user_id, isMember,pay);

        json.put("succ",aBoolean);
        return JSON.toJSONString(json);
    }

    @GetMapping("/agent_level")
    public String agent_level(){
        return "agent_level";
    }

    @GetMapping("/paypwd_modify")
    public String paypwd_modify_form(){
        return "udai_paypwd_modify";
    }
}
