package com.example.Coffee.service.impl;

import com.example.Coffee.config.RabbitMQConfig;
import com.example.Coffee.dto.OrderDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class MessageQueueService {

    private final RabbitTemplate rabbitTemplate;

    public void sendOrderCreated(OrderDto order) {
        try {
            rabbitTemplate.convertAndSend(RabbitMQConfig.ORDER_EXCHANGE, RabbitMQConfig.ORDER_ROUTING_KEY, order);
            log.info("✅ Order message sent: {}", order.getNumber());
        } catch (Exception e) {
            log.error("❌ Failed to send order message: {}", e.getMessage());
        }
    }
}