package com.example.Coffee.controller;

import com.example.Coffee.dto.UserDto;
import com.example.Coffee.model.Role;
import com.example.Coffee.model.User;
import com.example.Coffee.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("user", new UserDto());
        return "auth/login";
    }

    @GetMapping("/register")
    public String registerShow(Model model) {
        model.addAttribute("user", new UserDto());
        return "auth/register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute User user, Model model) {
        try {
            if (user.getRole() == null) {
                user.setRole(Role.User);
            }
            userService.createUser(user);
            return "redirect:/login?registered=true";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("user", user);
            return "auth/register";
        }
    }
}
