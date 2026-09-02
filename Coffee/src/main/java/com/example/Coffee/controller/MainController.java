package com.example.Coffee.controller;

import com.example.Coffee.dto.CoffeeDto;
import com.example.Coffee.dto.UserDto;
import com.example.Coffee.model.Contact;
import com.example.Coffee.service.CoffeeService;
import com.example.Coffee.service.ContactService;
import com.example.Coffee.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final UserService userService;
    private final ContactService contactService;
    private final CoffeeService coffeeService;

    @GetMapping("/")
    public String home(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "6") int size, Model model) {
        Page<CoffeeDto> coffeePage = coffeeService.getCoffeesPage(page, size);

        model.addAttribute("coffees", coffeePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", coffeePage.getTotalPages());

        return "index";
    }

    @GetMapping("/menu")
    public String menu(Model model) {
         List<CoffeeDto> coffees = coffeeService.getAllCoffees();
         model.addAttribute("coffees", coffees);

         return "menu/menu";
    }

    @GetMapping("/process")
    public String process() {
        return "process/process";
    }


    @GetMapping("/story")
    public String story() {
        return "story/story";
    }

    @GetMapping("/specialty")
    public String specialty() {
        return "specialty/specialty";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @PostMapping("/contact/send")
    public String sendContact(@RequestParam String name,
                              @RequestParam String email,
                              @RequestParam String subject,
                              @RequestParam String message,
                              Authentication auth,
                              Model model) {
        try {
            Contact contact = Contact.builder()
                    .name(name)
                    .email(email)
                    .subject(subject)
                    .message(message)
                    .build();

            if (auth != null && auth.isAuthenticated()) {
                UserDto currentUser = userService.findByEmail(auth.getName());
                contact.setUserId(currentUser.getId());
            }

            contactService.saveMessage(contact);

            model.addAttribute("success", "Your message has been sent!");
            return "contact";
        } catch (Exception e) {
            model.addAttribute("error", "Error: " + e.getMessage());
            return "contact";
        }
    }
}
