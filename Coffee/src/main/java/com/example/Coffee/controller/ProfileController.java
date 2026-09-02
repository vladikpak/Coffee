package com.example.Coffee.controller;

import com.example.Coffee.dto.UserDto;
import com.example.Coffee.model.Contact;
import com.example.Coffee.model.User;
import com.example.Coffee.service.ContactService;
import com.example.Coffee.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/profile")
@RequiredArgsConstructor
public class ProfileController {

    private final UserService userService;
    private final ContactService contactService;

    @GetMapping
    public String viewProfile(Model model, Authentication auth) {
        UserDto currentUser = userService.findByEmail(auth.getName());
        model.addAttribute("currentUser", currentUser);

        return "profile/profile";
    }

    @GetMapping("/edit")
    public String editProfileShow(Model model, Authentication auth) {
        UserDto currentUser = userService.findByEmail(auth.getName());
        model.addAttribute("currentUser", currentUser);

        return "profile/edit";
    }

    @GetMapping("/messages")
    public String myMessages(Model model, Authentication auth) {
        UserDto currentUser = userService.findByEmail(auth.getName());
        List<Contact> messages = contactService.getMessagesByUserId(currentUser.getId());

        model.addAttribute("messages", messages);

        return "profile/messages";
    }

    @PostMapping("/edit")
    public String editProfile(@ModelAttribute User user, @RequestParam(required = false) MultipartFile avatar, Authentication auth, Model model) {
        try {
            UserDto currentUser = userService.findByEmail(auth.getName());
            user.setId(currentUser.getId());
            user.setRole(currentUser.getRole());

            userService.updateUser(user, currentUser.getId(), avatar);

            model.addAttribute("success", "Profile updated successfully!");
            return "profile/edit";
        } catch (Exception e) {
            model.addAttribute("error", "Error: " + e.getMessage());
            return "profile/edit";
        }
    }
}
