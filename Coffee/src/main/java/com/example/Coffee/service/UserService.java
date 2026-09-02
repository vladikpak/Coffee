package com.example.Coffee.service;

import com.example.Coffee.dto.UserDto;
import com.example.Coffee.model.User;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface UserService {
    UserDto createUser(User user);

    User findEntityByEmail(String email);

    UserDto updateUser(User user, Long id, MultipartFile avatar);

    UserDto findByEmail(String email);

    UserDto convertToDto(User user);
}
