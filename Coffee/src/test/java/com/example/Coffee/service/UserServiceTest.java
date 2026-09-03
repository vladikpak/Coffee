package com.example.Coffee.service;

import com.example.Coffee.dto.UserDto;
import com.example.Coffee.model.User;
import com.example.Coffee.repository.UserRepository;
import com.example.Coffee.service.impl.UserServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class UserServiceTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @InjectMocks
    private UserServiceImpl userService;

    @Test
    void createUser_ShouldReturnUserDto() {
        // 1. Подготовка
        User user = new User();
        user.setName("John");
        user.setEmail("john@mail.com");
        user.setPassword("123");

        when(passwordEncoder.encode("123")).thenReturn("encoded123");
        when(userRepository.save(any(User.class))).thenReturn(user);

        // 2. Действие
        UserDto result = userService.createUser(user);

        // 3. Проверка
        assertNotNull(result);
        assertEquals("John", result.getName());
        assertEquals("john@mail.com", result.getEmail());

        verify(userRepository, times(1)).save(any(User.class));
    }
}
