package com.oaec.b2c.interceptor;

import com.oaec.b2c.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class NavInterceptor implements HandlerInterceptor {

    @Autowired
    private CartService cartService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        if (user != null){
            int userId = Integer.parseInt(user.get("user_id").toString());
            Map<String, Object> cartAmount = cartService.getAmountByUserId(userId);
            request.setAttribute("cartAmount",cartAmount);
        }else {
            Map<String,Object> map = new HashMap<>();
            map.put("count",0);
            request.setAttribute("cartAmount",map);
        }
        return true;
    }
}
