package com.example.Coffee.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderDto {
    private Long id;
    private String number;
    private Long userId;
    private Long coffeeId;
    private String userName;
    private String coffeeName;
    private Integer quantity;
    private Integer priceAtTime;
    private Integer total;
    private String status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
