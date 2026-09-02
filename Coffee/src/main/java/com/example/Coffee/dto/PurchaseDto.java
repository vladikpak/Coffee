package com.example.Coffee.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseDto {
    private Long id;
    private Long userId;
    private Long coffeeId;
    private Integer quality;
    private String userName;
    private String coffeeName;
    private Integer quantity;
    private Integer priceAtTime;
    private Integer total;
    private LocalDateTime createdAt;
}
