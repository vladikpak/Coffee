package com.example.Coffee.service;

import com.example.Coffee.dto.CoffeeDto;
import com.example.Coffee.model.Coffee;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CoffeeService {
    CoffeeDto createCoffee(Coffee coffee, MultipartFile image);

    CoffeeDto updateCoffee(Coffee coffee, Long id, MultipartFile image);

    CoffeeDto getCoffeeById(Long id);

    List<CoffeeDto> getAllCoffees();

    Page<CoffeeDto> getCoffeesPage(int page, int size);

    Page<CoffeeDto> searchCoffees(String keyword, int page, int size);

    void deleteCoffee(Long id);

    @CacheEvict(value = {"coffees", "coffee"}, allEntries = true)
    void clearCache();

    CoffeeDto convertToDto(Coffee coffee);
}
