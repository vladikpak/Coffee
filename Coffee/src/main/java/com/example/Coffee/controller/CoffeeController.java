package com.example.Coffee.controller;

import com.example.Coffee.dto.CoffeeDto;
import com.example.Coffee.model.Coffee;
import com.example.Coffee.service.CoffeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/coffee")
@RequiredArgsConstructor
public class CoffeeController {

    private final CoffeeService coffeeService;

    @GetMapping("/list")
    public String listCoffees(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "6") int size, Model model) {

        Page<CoffeeDto> coffeePage = coffeeService.getCoffeesPage(page, size);

        model.addAttribute("coffees", coffeePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", coffeePage.getTotalPages());
        model.addAttribute("totalItems", coffeePage.getTotalElements());

        return "coffee/list";
    }

    @GetMapping("/{id}")
    public String coffeeDetails(@PathVariable Long id, Model model) {
        CoffeeDto coffee = coffeeService.getCoffeeById(id);
        model.addAttribute("coffee", coffee);

        return "coffee/details";
    }

    @GetMapping("/search")
    public String searchCoffees(@RequestParam String keyword, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "6") int size, Model model) {
        Page<CoffeeDto> coffeePage = coffeeService.searchCoffees(keyword, page, size);

        model.addAttribute("coffees", coffeePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", coffeePage.getTotalPages());
        model.addAttribute("searchKeyword", keyword);

        return "coffee/list";
    }

    @GetMapping("/create")
    public String createCoffeeShow(Model model) {
        model.addAttribute("coffee", new Coffee());
        return "coffee/create";
    }

    @PostMapping("/create")
    public String createCoffee(@ModelAttribute Coffee coffee, @RequestParam(required = false) MultipartFile image) {

        coffeeService.createCoffee(coffee, image);
        return "redirect:/coffee/list";
    }

    @GetMapping("/edit/{id}")
    public String editCoffeeShow(@PathVariable Long id, Model model) {
        CoffeeDto coffee = coffeeService.getCoffeeById(id);
        model.addAttribute("coffee", coffee);

        return "coffee/edit";
    }

    @PostMapping("/edit/{id}")
    public String editCoffee(@PathVariable Long id, @ModelAttribute Coffee coffee, @RequestParam(required = false) MultipartFile image) {
        coffeeService.updateCoffee(coffee, id, image);
        return "redirect:/coffee/list";
    }

    @PostMapping("/delete/{id}")
    public String deleteCoffee(@PathVariable Long id) {
        coffeeService.deleteCoffee(id);
        return "redirect:/coffee/list";
    }
}
