package com.example.Coffee.service.impl;

import com.example.Coffee.dto.PurchaseDto;
import com.example.Coffee.model.Coffee;
import com.example.Coffee.model.Purchase;
import com.example.Coffee.model.User;
import com.example.Coffee.repository.CoffeeRepository;
import com.example.Coffee.repository.PurchaseRepository;
import com.example.Coffee.repository.UserRepository;
import com.example.Coffee.service.PurchaseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class PurchaseServiceImpl implements PurchaseService {

    private final PurchaseRepository purchaseRepository;
    private final UserRepository userRepository;
    private final CoffeeRepository coffeeRepository;

    @Override
    public PurchaseDto createPurchase(Long userId, Long coffeeId, Integer quantity) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Coffee coffee = coffeeRepository.findById(coffeeId)
                .orElseThrow(() -> new RuntimeException("Coffee not found"));

        if (coffee.getStock() < quantity) {
            throw new RuntimeException("Not enough coffee in stock! Available: " + coffee.getStock());
        }

        int totalPrice = coffee.getPrice() * quantity;

        if (user.getMoney() < totalPrice) {
            throw new RuntimeException("Not enough money! Need: $" + totalPrice);
        }

        user.setMoney(user.getMoney() - totalPrice);

        userRepository.save(user);

        coffee.setStock(coffee.getStock() - quantity);

        coffeeRepository.save(coffee);

        Purchase purchase = Purchase.builder()
                .user(user)
                .coffee(coffee)
                .quantity(quantity)
                .priceAtTime(coffee.getPrice())
                .createdAt(LocalDateTime.now())
                .build();

        Purchase savedPurchase = purchaseRepository.save(purchase);

        return convertToDto(savedPurchase);
    }

    @Override
    public PurchaseDto getPurchaseById(Long id) {
        Purchase purchase = purchaseRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Purchase not found"));

        return convertToDto(purchase);
    }

    @Override
    public List<PurchaseDto> getUserPurchases(Long userId) {
        return purchaseRepository.findByUserIdOrderByCreatedAtDesc(userId).stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    @Override
    public PurchaseDto convertToDto(Purchase purchase) {
        return PurchaseDto.builder()
                .id(purchase.getId())
                .userId(purchase.getUser().getId())
                .userName(purchase.getUser().getName())
                .coffeeId(purchase.getCoffee().getId())
                .coffeeName(purchase.getCoffee().getName())
                .quantity(purchase.getQuantity())
                .priceAtTime(purchase.getPriceAtTime())
                .total(purchase.getQuantity() * purchase.getPriceAtTime())
                .createdAt(purchase.getCreatedAt())
                .build();
    }
}
