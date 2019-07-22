package com.oaec.b2c.controller;

import com.github.pagehelper.Page;
import com.oaec.b2c.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private CartService cartService;

    @GetMapping("/shopcart_pay")
    public String order(HttpSession session, Model model,Integer[] cartId){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("user_id").toString());
        List<Map<String, Object>> address = addressService.address(userId);
        model.addAttribute("address",address);
        List<Map<String, Object>> cartList = orderService.getProducts(cartId);
        model.addAttribute("cartList",cartList);
        Map<String, Object> total = cartService.total(cartId);
        model.addAttribute("total",total);
        return "udai_shopcart_pay";
    }

    @GetMapping("/createOrder")
    public String orderPage(HttpSession session,Integer addressId,Integer[] cartId,Model model, @RequestParam(required = false,defaultValue = "1") Integer page){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("user_id").toString());
        orderService.add(userId,addressId);
        int orderId = Integer.parseInt(orderService.getNextOrderId(userId).get("nextOrderId").toString());
        for (Integer integer : cartId) {
            Map<String, Object> map = cartService.queryByCartId(integer);
            System.out.println("map = " + map);
            if (map != null){
                List children = (List) map.get("children");
                System.out.println("children = " + children);
                Map<String,Object> product = (Map<String, Object>) children.get(0);
                int productId = Integer.parseInt(map.get("productId").toString());
                double price = Double.parseDouble(product.get("price").toString());
                String url = product.get("url").toString();
                int amount = Integer.parseInt(map.get("amount").toString());
                double freight = Double.parseDouble(product.get("freight").toString());
                String color = map.get("color").toString();
                String size = map.get("size").toString();
                String name = product.get("name").toString();
                orderDetailService.add(orderId, productId, price, url, amount, freight, color, size, name);
                productService.addSaleAndSubStock(productId, amount);
            }
        }
        List<Map<String, Object>> orders = orderService.orders(page,userId);
        model.addAttribute("orders",orders);
        if (orders instanceof Page){
            Page productPage = (Page) orders;
            int ordersPageNum = productPage.getPageNum();
            int ordersPages = productPage.getPages();
            model.addAttribute("ordersPageNum",ordersPageNum);
            model.addAttribute("ordersPages",ordersPages);
        }
        /*List<Map<String, Object>> list0 = orderService.getOrdersByStatus0(page, userId);
        List<Map<String, Object>> list1 = orderService.getOrdersByStatus1(page, userId);
        List<Map<String, Object>> list2 = orderService.getOrdersByStatus2(page, userId);
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
        }*/
        cartService.deleteByCartIds(cartId);
        return "udai_order";
    }


    @GetMapping("/order")
    public String order(HttpSession session,Model model, @RequestParam(required = false,defaultValue = "1") Integer page){
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("user_id").toString());
        List<Map<String, Object>> orders = orderService.orders(page,userId);
        if (orders instanceof Page){
            Page productPage = (Page) orders;
            int ordersPageNum = productPage.getPageNum();
            int ordersPages = productPage.getPages();
            model.addAttribute("ordersPageNum",ordersPageNum);
            model.addAttribute("ordersPages",ordersPages);
        }
        model.addAttribute("orders",orders);
        /*List<Map<String, Object>> list0 = orderService.getOrdersByStatus0(page, userId);
        List<Map<String, Object>> list1 = orderService.getOrdersByStatus1(page, userId);
        List<Map<String, Object>> list2 = orderService.getOrdersByStatus2(page, userId);
        model.addAttribute("status0",list0);
        model.addAttribute("status1",list1);
        model.addAttribute("status2",list2);
        System.out.println("+++++++++++++++++++++++++++++++++++");
        System.out.println("list0 = " + list0);
        System.out.println("+++++++++++++++++++++++++++++++++++");
        if (list0 instanceof Page){
            Page productPage = (Page) list0;
            int status0PageNum = productPage.getPageNum();
            int status0Pages = productPage.getPages();
            model.addAttribute("status0PageNum",status0PageNum);
            model.addAttribute("status0Pages",status0Pages);
            System.out.println("+++++++++++++++++++++++++++++++++++");
            System.out.println("status0Pages = " + status0Pages);
            System.out.println("status0PageNum = " + status0PageNum);
            System.out.println("+++++++++++++++++++++++++++++++++++");
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
        }*/
        return "udai_order";
    }
}
