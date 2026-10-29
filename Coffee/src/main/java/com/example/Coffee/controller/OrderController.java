package com.example.Coffee.controller;

import com.example.Coffee.dto.CoffeeDto;
import com.example.Coffee.dto.OrderDto;
import com.example.Coffee.dto.UserDto;
import com.example.Coffee.service.CoffeeService;
import com.example.Coffee.service.OrderService;
import com.example.Coffee.service.UserService;
import com.example.Coffee.service.impl.EmailService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/order")
@RequiredArgsConstructor
public class OrderController {

    private final EmailService emailService;
    private final OrderService orderService;
    private final CoffeeService coffeeService;
    private final UserService userService;

    @GetMapping("/create")
    public String createOrderShow(@RequestParam Long coffeeId, Model model) {
        CoffeeDto coffee = coffeeService.getCoffeeById(coffeeId);

        model.addAttribute("coffee", coffee);
        model.addAttribute("coffeeId", coffeeId);

        return "order/create";
    }

    @PostMapping("/create")
    public String createOrder(@RequestParam Long coffeeId, @RequestParam Integer quantity, Authentication auth, Model model) {
        try {
            UserDto currentUser = userService.findByEmail(auth.getName());
            OrderDto order = orderService.createOrder(currentUser.getId(), coffeeId, quantity);

            emailService.sendOrderConfirmation(order, currentUser);

            return "redirect:/order/success";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("coffeeId", coffeeId);

            return "order/create";
        }
    }

    @GetMapping("/number/{number}")
    public String orderByNumber(@PathVariable String number, Model model) {
        OrderDto order = orderService.getOrderByNumber(number);
        model.addAttribute("order", order);

        return "order/details";
    }

    @GetMapping("/{id}")
    public String orderDetails(@PathVariable Long id, Model model) {
        OrderDto order = orderService.getOrderById(id);
        model.addAttribute("order", order);

        return "order/details";
    }

    @GetMapping("/my")
    public String myOrders(Model model, Authentication auth) {
        UserDto currentUser = userService.findByEmail(auth.getName());
        List<OrderDto> orders = orderService.getUserOrders(currentUser.getId());

        model.addAttribute("orders", orders);

        return "order/list";
    }

    @PostMapping("/cancel/{id}")
    public String cancelOrder(@PathVariable Long id) {
        orderService.cancelOrder(id);
        return "redirect:/order/my";
    }

    @GetMapping("/success")
    public String success(@RequestParam(required = false) String orderNumber, Model model) {
        if (orderNumber != null) {
            try {
                OrderDto order = orderService.getOrderByNumber(orderNumber);
                model.addAttribute("order", order);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "order/success";
    }
}
