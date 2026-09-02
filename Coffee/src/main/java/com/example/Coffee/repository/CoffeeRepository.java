package com.example.Coffee.repository;

import com.example.Coffee.model.Coffee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface CoffeeRepository extends JpaRepository<Coffee, Long> {
    Page<Coffee> findByNameContainingIgnoreCase(String name, Pageable pageable);
}
