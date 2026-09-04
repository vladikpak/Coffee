package com.example.Coffee.listener;

import com.example.Coffee.dto.OrderDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@RequiredArgsConstructor
public class OrderEventListener {

    @RabbitListener(queues = "order.queue")
    public void handleOrderCreated(OrderDto order) {
        log.info("📨 Received order event: {}", order.getNumber());
        log.info("📋 Order details: coffeeId={}, quantity={}, total={}",
                order.getCoffeeId(), order.getQuantity(), order.getTotal());
    }
}
