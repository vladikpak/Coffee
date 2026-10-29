package com.example.Coffee.controller;

import com.example.Coffee.model.Contact;
import com.example.Coffee.model.User;
import com.example.Coffee.service.ContactService;
import com.example.Coffee.service.UserService;
import com.example.Coffee.service.impl.EmailService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/contacts")
@RequiredArgsConstructor
public class AdminContactController {

    private final EmailService emailService;
    private final ContactService contactService;
    private final UserService userService;

    @GetMapping
    public String listMessages(Model model) {
        List<Contact> messages = contactService.getAllMessages();

        long newCount = messages.stream()
                .filter(m -> "NEW".equals(m.getStatus()))
                .count();

        model.addAttribute("messages", messages);
        model.addAttribute("newCount", newCount);

        return "admin/contacts/list";
    }

    @GetMapping("/{id}")
    public String viewMessage(@PathVariable Long id, Model model) {
        contactService.markAsRead(id);

        Contact contact = contactService.getMessageById(id);
        model.addAttribute("contact", contact);
        return "admin/contacts/view";
    }

    @PostMapping("/{id}/reply")
    public String replyToMessage(@PathVariable Long id, @RequestParam String reply, Authentication auth) {
        User admin = userService.findEntityByEmail(auth.getName());

        Contact contact = contactService.replyToMessage(id, reply, admin);

        emailService.sendAdminReply(contact.getEmail(), contact.getName(), reply);
        return "redirect:/admin/contacts";
    }

    @PostMapping("/{id}/delete")
    public String deleteMessage(@PathVariable Long id) {
        contactService.deleteMessage(id);
        return "redirect:/admin/contacts";
    }
}