package com.example.Coffee.exception;

import com.example.Coffee.dto.UserDto;
import com.example.Coffee.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
@RequiredArgsConstructor
public class GlobalControllerAdvice {

    private final UserService userService;

    @ModelAttribute("isAuthenticated")
    public boolean isAuthenticated() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth != null && auth.isAuthenticated() && !(auth.getPrincipal() instanceof String);
    }

    @ModelAttribute("username")
    public String getUsername() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (isAuthenticated()) {
            UserDetails userDetails = (UserDetails) auth.getPrincipal();
            return userDetails.getUsername();
        }
        return "Guest";
    }

    @ModelAttribute("currentUser")
    public UserDto getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (isAuthenticated()) {
            UserDetails userDetails = (UserDetails) auth.getPrincipal();
            return userService.findByEmail(userDetails.getUsername());
        }
        return new UserDto();
    }
}
