package com.oaec.b2c.controller;

import com.github.pagehelper.Page;
import com.oaec.b2c.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/list")
    public String query(Model model, @RequestParam(required = false,defaultValue = "1") Integer page, String name, Integer productId, Integer class1Id, Integer class2Id, Integer class3Id){
        List<Map<String, Object>> products = productService.list(page, name, productId, class1Id, class2Id, class3Id);
        model.addAttribute("list",products);
        if (products instanceof Page){
            Page productPage = (Page) products;
            int pageNum = productPage.getPageNum();
            int pages = productPage.getPages();
            model.addAttribute("pageNum",pageNum);
            model.addAttribute("pages",pages);
        }
        return "item_category";
    }

    @GetMapping("/item_show")
    public String queryById(Model model,Integer productId){
        Map<String, Object> product = productService.itemShow(productId);
        model.addAttribute("product",product);
        return "item_show";
    }
}
