package com.example.Coffee.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.example.Coffee.dto.OrderDto;
import com.example.Coffee.dto.UserDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;


@Service
@RequiredArgsConstructor
public class EmailService {

    private static final Logger log = LoggerFactory.getLogger(EmailService.class);
    private final JavaMailSender mailSender;

    // ===== ОТПРАВИТЬ ПРИВЕТСТВЕННОЕ ПИСЬМО =====
    public void sendWelcomeEmail(UserDto user) {
        String subject = "☕ Welcome to Brewly!";
        String text = """
                Добро пожаловать в Brewly, %s!
                
                Мы рады видеть вас в нашем сообществе кофе.
                Теперь вы можете заказывать свои любимые напитки!
                
                Ваш email: %s
                
                С любовью,
                Команда Brewly ❤️
                """.formatted(user.getName(), user.getEmail());

        sendEmail(user.getEmail(), subject, text);
    }

    // ===== ОТПРАВИТЬ ПРИ ЗАКАЗЕ =====
    public void sendOrderConfirmation(OrderDto order, UserDto user) {
        String subject = "☕ Order Confirmed! #" + order.getNumber();
        String text = """
                Здравствуйте, %s!
                
                Ваш заказ #%s успешно создан!
                
                Детали заказа:
                - Напиток: %s
                - Количество: %d
                - Сумма: $%d
                - Статус: %s
                
                Спасибо, что выбрали Brewly!
                
                Команда Brewly ❤️
                """.formatted(
                user.getName(),
                order.getNumber(),
                order.getCoffeeName(),
                order.getQuantity(),
                order.getTotal(),
                order.getStatus()
        );

        sendEmail(user.getEmail(), subject, text);
    }

    // ===== ОТПРАВИТЬ ОТВЕТ АДМИНА =====
    public void sendAdminReply(String userEmail, String userName, String adminReply) {
        String subject = "📬 Ответ от администратора Brewly";
        String text = """
                Здравствуйте, %s!
                
                Администратор ответил на ваше сообщение:
                
                Ответ:
                %s
                
                С уважением,
                Команда Brewly ❤️
                """.formatted(userName, adminReply);

        sendEmail(userEmail, subject, text);
    }

    // ===== УНИВЕРСАЛЬНЫЙ МЕТОД =====
    private void sendEmail(String to, String subject, String text) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(to);
            message.setSubject(subject);
            message.setText(text);
            message.setFrom("noreply@brewly.com");

            mailSender.send(message);
            log.info("✅ Email отправлен на: {}", to);

        } catch (Exception e) {
            log.error("❌ Ошибка отправки email: {}", e.getMessage());
        }
    }
}