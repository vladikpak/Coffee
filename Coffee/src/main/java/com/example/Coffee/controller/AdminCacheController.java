package com.example.Coffee.controller;

import com.example.Coffee.service.CoffeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/cache")
@RequiredArgsConstructor
public class AdminCacheController {

    private final CoffeeService coffeeService;

    @PostMapping("/clear")
    public String clearCache() {
        coffeeService.clearCache();
        return "redirect:/admin?cacheCleared=true";
    }
}