package com.trade.stock.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
@SpringBootApplication
@EnableDiscoveryClient
public class StockAuthApplication {
    public static void main(String[] args) {
        SpringApplication.run(StockAuthApplication.class, args);
    }
}
