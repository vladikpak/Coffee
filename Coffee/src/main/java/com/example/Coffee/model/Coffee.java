package com.example.Coffee.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "coffees")
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Coffee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @Column(name = "description", nullable = false, length = 2000)
    private String description;

    @Column(name = "price", nullable = false)
    private Integer price;

    @Column(name = "image")
    private String image;

    @Column(name = "imageUrl")
    private String imageUrl;

    @Column(name = "stock", nullable = false)
    private Integer stock;
}
