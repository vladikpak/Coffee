package com.example.Coffee.repository;

import com.example.Coffee.model.Coffee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CoffeeRepository extends JpaRepository<Coffee, Long> {
    List<Coffee> findByNameContainingIgnoreCase(String name);

    Page<Coffee> findByNameContainingIgnoreCase(String name, Pageable pageable);

    List<Coffee> findByStockGreaterThan(Integer stock);
}
