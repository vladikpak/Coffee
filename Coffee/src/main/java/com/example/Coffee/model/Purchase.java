package com.example.Coffee.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "purchases")
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Purchase {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "coffee_id", nullable = false)
    private Coffee coffee;

    @Column(name = "quality", nullable = false)
    private Integer quantity;

    @Column(name = "price_at_time")
    private Integer priceAtTime;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}
