package com.example.Coffee.service;

import com.example.Coffee.dto.CoffeeDto;
import com.example.Coffee.model.Coffee;
import com.example.Coffee.repository.CoffeeRepository;
import com.example.Coffee.service.impl.CoffeeServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class CoffeeServiceTest {

    @Mock
    private CoffeeRepository coffeeRepository;

    @InjectMocks
    private CoffeeServiceImpl coffeeService;

    @Test
    void searchCoffees_ShouldReturnFilteredList() {
        // 1. Подготовка
        List<Coffee> coffees = Arrays.asList(
                Coffee.builder().id(1L).name("Espresso").build(),
                Coffee.builder().id(2L).name("Latte").build()
        );

        Page<Coffee> page = new PageImpl<>(coffees);

        // ✅ 2 параметра: String + Pageable
        when(coffeeRepository.findByNameContainingIgnoreCase(eq("ess"), any(Pageable.class)))
                .thenReturn(page);

        // 2. Действие
        Page<CoffeeDto> result = coffeeService.searchCoffees("ess", 1, 10);

        // 3. Проверка
        assertNotNull(result);
        assertEquals(2, result.getTotalElements());  // ✅ totalElements

        // ✅ verify с matchers
        verify(coffeeRepository, times(1))
                .findByNameContainingIgnoreCase(eq("ess"), any(Pageable.class));
    }

    @Test
    void searchCoffees_ShouldReturnAll_WhenKeywordEmpty() {
        // 1. Подготовка
        List<Coffee> coffees = Arrays.asList(
                Coffee.builder().id(1L).name("Espresso").build()
        );

        Page<Coffee> page = new PageImpl<>(coffees);

        // ✅ findAll с Pageable
        when(coffeeRepository.findAll(any(Pageable.class))).thenReturn(page);

        // 2. Действие
        Page<CoffeeDto> result = coffeeService.searchCoffees(null, 1, 10);

        // 3. Проверка
        assertNotNull(result);
        assertEquals(1, result.getTotalElements());  // ✅ totalElements

        verify(coffeeRepository, times(1)).findAll(any(Pageable.class));
        verify(coffeeRepository, never()).findByNameContainingIgnoreCase(any(), any());
    }
}