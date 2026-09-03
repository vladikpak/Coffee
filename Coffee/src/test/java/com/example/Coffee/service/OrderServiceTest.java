package com.example.Coffee.service;

import com.example.Coffee.dto.OrderDto;
import com.example.Coffee.model.Coffee;
import com.example.Coffee.model.Order;
import com.example.Coffee.model.User;
import com.example.Coffee.repository.CoffeeRepository;
import com.example.Coffee.repository.OrderRepository;
import com.example.Coffee.repository.UserRepository;
import com.example.Coffee.service.impl.OrderServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class OrderServiceTest {

    @Mock
    private OrderRepository orderRepository;

    @Mock
    private UserRepository userRepository;

    @Mock
    private CoffeeRepository coffeeRepository;

    @InjectMocks
    private OrderServiceImpl orderService;

    @Test
    void createOrder_ShouldReturnOrderDto() {
        // 1. Подготовка (Given)
        User user = User.builder()
                .id(1L)
                .name("John")
                .money(1000)
                .build();

        Coffee coffee = Coffee.builder()
                .id(1L)
                .name("Espresso")
                .price(290)
                .stock(50)
                .build();

        when(userRepository.findById(1L)).thenReturn(Optional.of(user));
        when(coffeeRepository.findById(1L)).thenReturn(Optional.of(coffee));
        when(orderRepository.save(any(Order.class))).thenAnswer(invocation -> {
            Order order = invocation.getArgument(0);
            order.setId(1L);
            return order;
        });

        // 2. Действие (When)
        OrderDto result = orderService.createOrder(1L, 1L, 2);

        // 3. Проверка (Then)
        assertNotNull(result);
        assertEquals("ORD-", result.getNumber().substring(0, 4));
        assertEquals(1L, result.getUserId());
        assertEquals(1L, result.getCoffeeId());
        assertEquals(2, result.getQuantity());
        assertEquals(580, result.getTotal());
        assertEquals("PAID", result.getStatus());

        // Проверяем, что баланс списался
        assertEquals(420, user.getMoney());
        // Проверяем, что склад уменьшился
        assertEquals(48, coffee.getStock());

        verify(userRepository, times(1)).save(user);
        verify(coffeeRepository, times(1)).save(coffee);
        verify(orderRepository, times(1)).save(any(Order.class));
    }

    @Test
    void createOrder_ShouldThrowException_WhenNotEnoughStock() {
        // 1. Подготовка
        User user = User.builder().id(1L).money(1000).build();
        Coffee coffee = Coffee.builder().id(1L).price(290).stock(1).build();

        when(userRepository.findById(1L)).thenReturn(Optional.of(user));
        when(coffeeRepository.findById(1L)).thenReturn(Optional.of(coffee));

        // 2. Действие + Проверка
        RuntimeException exception = assertThrows(RuntimeException.class, () -> {
            orderService.createOrder(1L, 1L, 5);
        });

        assertEquals("Not enough coffee in stock!", exception.getMessage());
        verify(orderRepository, never()).save(any(Order.class));
    }

    @Test
    void createOrder_ShouldThrowException_WhenNotEnoughMoney() {
        // 1. Подготовка
        User user = User.builder().id(1L).money(100).build();
        Coffee coffee = Coffee.builder().id(1L).price(290).stock(50).build();

        when(userRepository.findById(1L)).thenReturn(Optional.of(user));
        when(coffeeRepository.findById(1L)).thenReturn(Optional.of(coffee));

        // 2. Действие + Проверка
        RuntimeException exception = assertThrows(RuntimeException.class, () -> {
            orderService.createOrder(1L, 1L, 2);
        });

        assertEquals("Not enough money! Need: $580", exception.getMessage());
        verify(orderRepository, never()).save(any(Order.class));
    }

    @Test
    void cancelOrder_ShouldChangeStatusToCancelled() {
        // 1. Подготовка
        User user = User.builder().id(1L).money(500).build();
        Coffee coffee = Coffee.builder().id(1L).stock(50).build();

        Order order = Order.builder()
                .id(1L)
                .user(user)
                .coffee(coffee)
                .quantity(2)
                .priceAtTime(290)
                .status("PAID")
                .createdAt(LocalDateTime.now())
                .build();

        when(orderRepository.findById(1L)).thenReturn(Optional.of(order));
        when(orderRepository.save(any(Order.class))).thenReturn(order);

        // 2. Действие
        orderService.cancelOrder(1L);

        // 3. Проверка
        assertEquals("CANCELLED", order.getStatus());
        // Деньги вернулись
        assertEquals(1080, user.getMoney()); // 500 + (2 * 290)
        // Товар вернулся на склад
        assertEquals(52, coffee.getStock()); // 50 + 2

        verify(orderRepository, times(1)).save(order);
    }

    @Test
    void getUserOrders_ShouldReturnListOfOrders() {
        // 1. Подготовка
        User user = User.builder().id(1L).build();

        // 👇 СОЗДАЕМ COFFEE
        Coffee coffee = Coffee.builder()
                .id(1L)
                .name("Espresso")
                .price(290)
                .stock(50)
                .build();

        List<Order> orders = Arrays.asList(
                Order.builder()
                        .id(1L)
                        .user(user)
                        .coffee(coffee)  // 👈 ДОБАВЛЯЕМ COFFEE
                        .quantity(2)
                        .priceAtTime(290)
                        .status("PAID")
                        .createdAt(LocalDateTime.now())
                        .build(),
                Order.builder()
                        .id(2L)
                        .user(user)
                        .coffee(coffee)  // 👈 ДОБАВЛЯЕМ COFFEE
                        .quantity(1)
                        .priceAtTime(290)
                        .status("PAID")
                        .createdAt(LocalDateTime.now())
                        .build()
        );

        when(orderRepository.findByUserIdOrderByCreatedAtDesc(1L))
                .thenReturn(orders);

        // 2. Действие
        List<OrderDto> result = orderService.getUserOrders(1L);

        // 3. Проверка
        assertNotNull(result);
        assertEquals(2, result.size());
        assertEquals(1L, result.get(0).getCoffeeId());  // Проверяем coffeeId
        verify(orderRepository, times(1)).findByUserIdOrderByCreatedAtDesc(1L);
    }
}
