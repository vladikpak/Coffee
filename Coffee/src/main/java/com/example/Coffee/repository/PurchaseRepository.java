package com.example.Coffee.repository;

import com.example.Coffee.model.Purchase;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PurchaseRepository extends JpaRepository<Purchase, Long> {
    List<Purchase> findByUserIdOrderByCreatedAtDesc(Long userId);

    boolean existsByUserIdAndCoffeeId(Long userId, Long coffeeId);

    @Query("SELECT SUM(p.quantity) FROM Purchase p WHERE p.coffee.id = :coffeeId")
    Integer getTotalQuantitySold(@Param("coffeeId") Long coffeeId);

    @Query("SELECT SUM(p.quantity * p.priceAtTime) FROM Purchase p WHERE p.user.id = :userId")
    Integer getTotalSpentByUser(@Param("userId") Long userId);
}
