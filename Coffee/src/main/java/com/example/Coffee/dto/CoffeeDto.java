package com.example.Coffee.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class CoffeeDto {
    private Long id;
    private String name;
    private String description;
    private Integer price;
    private String image;
    private String imageUrl;
    private Integer stock;
}
