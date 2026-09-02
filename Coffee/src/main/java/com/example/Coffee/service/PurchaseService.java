package com.example.Coffee.service;

import com.example.Coffee.dto.PurchaseDto;
import com.example.Coffee.model.Purchase;

import java.util.List;

public interface PurchaseService {
    PurchaseDto createPurchase(Long userId, Long coffeeId, Integer quantity);

    PurchaseDto getPurchaseById(Long id);

    List<PurchaseDto> getUserPurchases(Long userId);

    PurchaseDto convertToDto(Purchase purchase);
}
