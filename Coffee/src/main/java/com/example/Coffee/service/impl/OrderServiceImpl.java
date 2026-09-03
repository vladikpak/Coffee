package com.example.Coffee.service.impl;

import com.example.Coffee.dto.OrderDto;
import com.example.Coffee.model.Coffee;
import com.example.Coffee.model.Order;
import com.example.Coffee.model.User;
import com.example.Coffee.repository.CoffeeRepository;
import com.example.Coffee.repository.OrderRepository;
import com.example.Coffee.repository.UserRepository;
import com.example.Coffee.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final CoffeeRepository coffeeRepository;

    @Override
    public OrderDto createOrder(Long userId, Long coffeeId, Integer quantity) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Coffee coffee = coffeeRepository.findById(coffeeId)
                .orElseThrow(() -> new RuntimeException("Coffee not found"));

        if (coffee.getStock() < quantity) {
            throw new RuntimeException("Not enough coffee in stock!");
        }

        int totalPrice = coffee.getPrice() * quantity;

        if (user.getMoney() < totalPrice) {
            throw new RuntimeException("Not enough money! Need: $" + totalPrice);
        }

        user.setMoney(user.getMoney() - totalPrice);

        userRepository.save(user);

        coffee.setStock(coffee.getStock() - quantity);

        coffeeRepository.save(coffee);

        String orderNumber = "ORD-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();

        Order order = Order.builder()
                .number(orderNumber)
                .user(user)
                .coffee(coffee)
                .quantity(quantity)
                .priceAtTime(coffee.getPrice())
                .status("PAID")
                .createdAt(LocalDateTime.now())
                .build();

        Order savedOrder = orderRepository.save(order);

        return convertToDto(savedOrder);
    }

    @Override
    public void cancelOrder(Long id) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found"));

        if ("PAID".equals(order.getStatus()) || "PENDING".equals(order.getStatus())) {
            User user = order.getUser();

            int refund = order.getQuantity() * order.getPriceAtTime();
            user.setMoney(user.getMoney() + refund);

            userRepository.save(user);

            Coffee coffee = order.getCoffee();
            coffee.setStock(coffee.getStock() + order.getQuantity());

            coffeeRepository.save(coffee);
        }

        order.setStatus("CANCELLED");
        order.setUpdatedAt(LocalDateTime.now());

        orderRepository.save(order);
    }

    @Override
    public OrderDto getOrderById(Long id) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found"));

        return convertToDto(order);
    }

    @Override
    public OrderDto getOrderByNumber(String number) {
        Order order = orderRepository.findByNumber(number)
                .orElseThrow(() -> new RuntimeException("Order not found with number: " + number));

        return convertToDto(order);
    }

    @Override
    public List<OrderDto> getUserOrders(Long userId) {
        return orderRepository.findByUserIdOrderByCreatedAtDesc(userId).stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    @Override
    public OrderDto convertToDto(Order order) {
        Long userId = order.getUser() != null ? order.getUser().getId() : null;
        String userName = order.getUser() != null ? order.getUser().getName() : null;
        Long coffeeId = order.getCoffee() != null ? order.getCoffee().getId() : null;
        String coffeeName = order.getCoffee() != null ? order.getCoffee().getName() : null;

        return OrderDto.builder()
                .id(order.getId())
                .number(order.getNumber())
                .userId(userId)
                .userName(userName)
                .coffeeId(coffeeId)
                .coffeeName(coffeeName)
                .quantity(order.getQuantity())
                .priceAtTime(order.getPriceAtTime())
                .total(order.getQuantity() * order.getPriceAtTime())
                .status(order.getStatus())
                .createdAt(order.getCreatedAt())
                .updatedAt(order.getUpdatedAt())
                .build();
    }
}