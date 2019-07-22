package com.oaec.b2c.interceptor;

import com.alibaba.fastjson.JSON;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class LoginInterceptor implements HandlerInterceptor {

    private boolean isAjax(HttpServletRequest request){
        String header = request.getHeader("X-Requested-With");
        if (header != null && header.equals("XMLHttpRequest")){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object username = session.getAttribute("user");
        if(username == null){
            String requestURI = request.getRequestURI();
            if(requestURI.contains("/addCart")){
                requestURI = request.getContextPath()+"/item_show?productId="+request.getParameter("productId");
            }
            String queryString = request.getQueryString();
            if (isAjax(request)){
                response.setContentType("application/json;charset=utf-8");
                PrintWriter writer = response.getWriter();
                Map<String,Object> map = new HashMap<>();
                map.put("uri",requestURI);
                map.put("isLogin", false);
                writer.println(JSON.toJSONString(map));
                writer.close();
            }else {
                if (queryString != null){
                    requestURI += "?"+queryString;
                }
                response.sendRedirect(request.getContextPath()+"/login?uri="+requestURI);
            }
        }else{
            return true;
        }
        return false;
    }
}
