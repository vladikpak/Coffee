package com.example.Coffee.controller;

import com.example.Coffee.dto.PurchaseDto;
import com.example.Coffee.dto.UserDto;
import com.example.Coffee.service.CoffeeService;
import com.example.Coffee.service.PurchaseService;
import com.example.Coffee.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/purchase")
@RequiredArgsConstructor
public class PurchaseController {

    private final PurchaseService purchaseService;
    private final CoffeeService coffeeService;
    private final UserService userService;

    @PostMapping("/buy")
    public String buyCoffee(
            @RequestParam Long coffeeId,
            @RequestParam Integer quantity,
            Authentication auth,
            Model model) {

        try {
            UserDto currentUser = userService.findByEmail(auth.getName());
            purchaseService.createPurchase(currentUser.getId(), coffeeId, quantity);
            return "redirect:/purchase/success?coffeeId=" + coffeeId;
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "redirect:/coffee/" + coffeeId + "?error=" + e.getMessage();
        }
    }

    @GetMapping("/my")
    public String myPurchases(Model model, Authentication auth) {
        UserDto currentUser = userService.findByEmail(auth.getName());
        List<PurchaseDto> purchases = purchaseService.getUserPurchases(currentUser.getId());
        model.addAttribute("purchases", purchases);
        return "purchase/list";
    }

    @GetMapping("/success")
    public String success(@RequestParam Long coffeeId, Model model) {
        model.addAttribute("coffee", coffeeService.getCoffeeById(coffeeId));
        return "purchase/success";
    }

    @GetMapping("/{id}")
    public String purchaseDetails(@PathVariable Long id, Model model) {
        PurchaseDto purchase = purchaseService.getPurchaseById(id);
        model.addAttribute("purchase", purchase);
        return "purchase/details";
    }
}
