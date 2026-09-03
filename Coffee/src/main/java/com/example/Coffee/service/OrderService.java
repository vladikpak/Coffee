package com.example.Coffee.service;

import com.example.Coffee.dto.OrderDto;
import com.example.Coffee.model.Order;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

public interface OrderService {
    OrderDto createOrder(Long userId, Long coffeeId, Integer quantity);

    @CacheEvict(value = "orders", allEntries = true)
    void cancelOrder(Long id);

    @Cacheable(value = "orders", key = "#id")
    OrderDto getOrderById(Long id);

    OrderDto getOrderByNumber(String number);

    @Cacheable(value = "orders", key = "'user_' + #userId")
    List<OrderDto> getUserOrders(Long userId);

    OrderDto convertToDto(Order order);
}
