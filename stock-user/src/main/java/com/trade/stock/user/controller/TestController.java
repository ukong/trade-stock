package com.trade.stock.user.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
@RestController
@RequestMapping("/test")
public class TestController {
    @GetMapping("/get")
    public Map<String, Object> testGet() {
        HashMap<String, Object> stringObjectHashMap = new HashMap<>();
        stringObjectHashMap.put("name", "dogs");
        stringObjectHashMap.put("datetime", LocalDateTime.now());

        return stringObjectHashMap;
    }
}
