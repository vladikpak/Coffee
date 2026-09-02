package com.example.Coffee.repository;

import com.example.Coffee.model.Order;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUserIdOrderByCreatedAtDesc(Long userId);

    List<Order> findByStatusOrderByCreatedAtDesc(String status);

    Optional<Order> findByNumber(String number);

    List<Order> findByUserIdAndStatus(Long userId, String status);

    @Query("SELECT COUNT(o) FROM Order o WHERE o.status = :status")
    Long countByStatus(@Param("status") String status);

    @Query("SELECT SUM(o.quantity * o.priceAtTime) FROM Order o WHERE o.user.id = :userId")
    Integer getTotalOrderAmountByUser(@Param("userId") Long userId);
}