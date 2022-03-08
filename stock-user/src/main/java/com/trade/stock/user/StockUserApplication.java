package com.trade.stock.user;

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
public class StockUserApplication {
    public static void main(String[] args) {
        SpringApplication.run(StockUserApplication.class, args);
    }
}
