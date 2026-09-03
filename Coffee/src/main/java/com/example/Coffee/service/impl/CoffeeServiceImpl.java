package com.example.Coffee.service.impl;

import com.example.Coffee.dto.CoffeeDto;
import com.example.Coffee.model.Coffee;
import com.example.Coffee.repository.CoffeeRepository;
import com.example.Coffee.service.CoffeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class CoffeeServiceImpl implements CoffeeService {

    private final CoffeeRepository coffeeRepository;
    private final FileService fileService;

    // ============================================================
    // 8. СОЗДАТЬ КОФЕ (ОЧИЩАЕТ КЭШ)
    // ============================================================
    @Override
    @CacheEvict(value = {"coffees", "coffee"}, allEntries = true) // 👈 ОЧИЩАЕТ ВСЁ
    public CoffeeDto createCoffee(Coffee coffee, MultipartFile image) {
        System.out.println("🟢 Создаю новый кофе: " + coffee.getName());

        if (image != null && !image.isEmpty()) {
            String imagePath = fileService.saveCoffeeImage(image);
            coffee.setImage(imagePath);
        }

        if (coffee.getStock() == null) {
            coffee.setStock(0);
        }

        Coffee savedCoffee = coffeeRepository.save(coffee);

        return convertToDto(savedCoffee);
    }

    // ============================================================
    // 9. ОБНОВИТЬ КОФЕ (ОЧИЩАЕТ КЭШ)
    // ============================================================
    @Override
    @CacheEvict(value = {"coffees", "coffee"}, allEntries = true)  // 👈 ОЧИЩАЕТ ВСЁ
    public CoffeeDto updateCoffee(Coffee coffee, Long id, MultipartFile image) {
        System.out.println("🟡 Обновляю кофе ID: " + id);

        Coffee existingCoffee = coffeeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Coffee not found"));

        if (coffee.getName() != null) existingCoffee.setName(coffee.getName());
        if (coffee.getDescription() != null) existingCoffee.setDescription(coffee.getDescription());
        if (coffee.getPrice() != null) existingCoffee.setPrice(coffee.getPrice());
        if (coffee.getStock() != null) existingCoffee.setStock(coffee.getStock());

        if (image != null && !image.isEmpty()) {
            String imagePath = fileService.saveCoffeeImage(image);
            if (imagePath != null) {
                existingCoffee.setImage(imagePath);
            }
        }

        Coffee savedCoffee = coffeeRepository.save(existingCoffee);

        return convertToDto(savedCoffee);
    }

    // ============================================================
    // 2. ПОЛУЧИТЬ КОФЕ ПО ID (КЭШИРУЕТСЯ)
    // ============================================================
    @Override
    @Cacheable(value = "coffee", key = "#id")
    public CoffeeDto getCoffeeById(Long id) {
        System.out.println("🔵 Загружаю кофе по ID: " + id + " из БД...");

        Coffee coffee = coffeeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Coffee not found"));

        return convertToDto(coffee);
    }

    // ============================================================
    // 1. ПОЛУЧИТЬ ВСЕ КОФЕ (КЭШИРУЕТСЯ)
    // ============================================================
    @Override
    @Cacheable("coffees")
    public List<CoffeeDto> getAllCoffees() {
        System.out.println("Загружаю из БД...");

        return coffeeRepository.findAll().stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    // ============================================================
    // 5. ПОЛУЧИТЬ СТРАНИЦУ (НЕ КЭШИРУЕТСЯ — ПАГИНАЦИЯ)
    // ============================================================
    @Override
    public Page<CoffeeDto> getCoffeesPage(int page, int size) {
        Pageable pageable = PageRequest.of(page - 1, size);
        return coffeeRepository.findAll(pageable)
                .map(this::convertToDto);
    }

    // ============================================================
    // 4. ПОИСК ПО НАЗВАНИЮ (КЭШИРУЕТСЯ)
    // ============================================================
    @Override
    public Page<CoffeeDto> searchCoffees(String keyword, int page, int size) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return getCoffeesPage(page, size);
        }

        System.out.println("🔵 Поиск с пагинацией: " + keyword + " из БД...");

        Pageable pageable = PageRequest.of(page - 1, size);

        return coffeeRepository.findByNameContainingIgnoreCase(keyword.trim(), pageable)
                .map(this::convertToDto);
    }

    // ============================================================
    // 10. УДАЛИТЬ КОФЕ (ОЧИЩАЕТ КЭШ)
    // ============================================================
    @Override
    @CacheEvict(value = {"coffees", "coffee"}, allEntries = true)  // 👈 ОЧИЩАЕТ ВСЁ
    public void deleteCoffee(Long id) {
        System.out.println("🔴 Удаляю кофе ID: " + id);
        coffeeRepository.deleteById(id);
    }

    // ============================================================
    // 11. ОЧИСТИТЬ ВЕСЬ КЭШ (ДЛЯ АДМИНА)
    // ============================================================
    @CacheEvict(value = {"coffees", "coffee"}, allEntries = true)
    @Override
    public void clearCache() {
        System.out.println("🧹 Кэш очищен!");
    }


    @Override
    public CoffeeDto convertToDto(Coffee coffee) {
        return CoffeeDto.builder()
                .id(coffee.getId())
                .name(coffee.getName())
                .description(coffee.getDescription())
                .price(coffee.getPrice())
                .image(coffee.getImage())
                .imageUrl(coffee.getImageUrl())
                .stock(coffee.getStock())
                .build();
    }
}
