package com.example.Coffee.service;

import com.example.Coffee.controller.MainController;
import com.example.Coffee.dto.CoffeeDto;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.boot.webmvc.test.autoconfigure.WebMvcTest; // ПРАВИЛЬНО для Spring Boot 4.x

import org.springframework.cache.CacheManager;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;


@WebMvcTest(MainController.class)
@AutoConfigureMockMvc(addFilters = false)
class MainControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private CoffeeService coffeeService;

    @MockitoBean
    private UserService userService;

    @MockitoBean
    private ContactService contactService;

    @MockitoBean
    private CacheManager cacheManager;

    @MockitoBean
    private org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration securityConfiguration;

    @MockitoBean
    private org.springframework.security.web.DefaultSecurityFilterChain defaultSecurityFilterChain;

    @Test
    void homePage_ShouldReturnIndexView() throws Exception {
        Page<CoffeeDto> coffeePage = new PageImpl<>(List.of());
        when(coffeeService.getCoffeesPage(anyInt(), anyInt())).thenReturn(coffeePage);

        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(view().name("index"));
    }

    @Test
    void menuPage_ShouldReturnMenuView() throws Exception {
        when(coffeeService.getAllCoffees()).thenReturn(List.of());

        mockMvc.perform(get("/menu"))
                .andExpect(status().isOk())
                .andExpect(view().name("menu/menu"));
    }
}