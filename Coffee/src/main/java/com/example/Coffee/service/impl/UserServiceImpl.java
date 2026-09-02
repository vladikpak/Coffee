package com.example.Coffee.service.impl;

import com.example.Coffee.dto.UserDto;
import com.example.Coffee.model.Role;
import com.example.Coffee.model.User;
import com.example.Coffee.repository.UserRepository;
import com.example.Coffee.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final FileService fileService;

    @Override
    public UserDto createUser(User user) {
        if (userRepository.existsByEmail(user.getEmail())) {
            throw new RuntimeException("User with this email already exists!");
        }

        if (user.getRole() == null) {
            user.setRole(Role.User);
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));

        if (user.getMoney() == null) {
            user.setMoney(2000);
        }

        User savedUser = userRepository.save(user);
        return convertToDto(savedUser);
    }

    @Override
    public User findEntityByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found with email: " + email));
    }

    @Override
    public UserDto updateUser(User user, Long id, MultipartFile avatar) {
        User existingUser = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (user.getName() != null) existingUser.setName(user.getName());

        if (user.getEmail() != null) existingUser.setEmail(user.getEmail());

        if (user.getPhone() != null) existingUser.setPhone(user.getPhone());

        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            existingUser.setPassword(passwordEncoder.encode(user.getPassword()));
        }

        if (user.getRole() != null) existingUser.setRole(user.getRole());

        if (avatar != null && !avatar.isEmpty()) {
            String avatarPath = fileService.saveAvatar(avatar);
            if (avatarPath != null) {
                existingUser.setImage(avatarPath);
            }
        }

        User savedUser = userRepository.save(existingUser);
        return convertToDto(savedUser);
    }

    @Override
    public UserDto findByEmail(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return convertToDto(user);
    }

    @Override
    public UserDto convertToDto(User user) {
        return UserDto.builder()
                .id(user.getId())
                .name(user.getName())
                .email(user.getEmail())
                .phone(user.getPhone())
                .role(user.getRole())
                .money(user.getMoney())
                .image(user.getImage())
                .build();
    }
}
