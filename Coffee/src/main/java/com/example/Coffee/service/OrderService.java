package com.example.Coffee.service;

import com.example.Coffee.dto.OrderDto;
import com.example.Coffee.model.Order;

import java.util.List;

public interface OrderService {
    OrderDto createOrder(Long userId, Long coffeeId, Integer quantity);

    void cancelOrder(Long id);

    OrderDto getOrderById(Long id);

    OrderDto getOrderByNumber(String number);

    List<OrderDto> getUserOrders(Long userId);

    OrderDto convertToDto(Order order);
}
