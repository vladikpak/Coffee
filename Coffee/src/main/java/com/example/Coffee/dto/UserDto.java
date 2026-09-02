package com.example.Coffee.dto;

import com.example.Coffee.model.Role;
import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDto {
    private Long id;
    private String name;
    private String email;
    private String password;
    private Role role;
    private Integer money;
    private String phone;
    private String image;
}
