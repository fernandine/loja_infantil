package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.DiscountDto;
import com.jean.lojaInfantil.backend.entities.Discount;
import com.jean.lojaInfantil.backend.entities.Product;
import com.jean.lojaInfantil.backend.repositories.DiscountRepository;
import com.jean.lojaInfantil.backend.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class DiscountService {

    @Autowired
    private DiscountRepository discountRepository;

    @Autowired
    private ProductRepository productRepository;

    @Transactional(readOnly = true)
    public List<DiscountDto> findAll() {
        List<Discount> list = discountRepository.findAll();
        return list.stream().map(x -> new DiscountDto(x)).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<DiscountDto> findExpiringDiscounts(LocalDate date) {
        List<Discount> discounts = discountRepository.getExpiringDiscounts(date);
        return discounts.stream().map(DiscountDto::new).collect(Collectors.toList());
    }

    public List<DiscountDto> applyDiscount(String code, BigDecimal totalPrice) {
        Optional<Discount> optionalDiscount = discountRepository.findByCode(code);

        if (optionalDiscount.isPresent()) {
            Discount discount = optionalDiscount.get();

            // Verifica se o cupom ainda é válido
            if (discount.getExpirationDate().isAfter(LocalDate.now())) {
                BigDecimal discountPercentage = discount.getDiscountValue();
                BigDecimal discountAmount = totalPrice.multiply(discountPercentage);
                BigDecimal discountedPrice = totalPrice.subtract(discountAmount);

                // Cria e retorna um DTO com as informações do desconto aplicado
                DiscountDto discountDto = new DiscountDto(discount);
                discountDto.setDiscountValue(discountPercentage);
                discountDto.setDiscountedPrice(discountedPrice);
                return Collections.singletonList(discountDto);
            }
        }

        // Se o cupom não for válido ou não existir, retorna uma lista vazia
        return Collections.emptyList();
    }



    @Transactional
    public DiscountDto insert(DiscountDto dto) {
        Discount entity = new Discount();
        entity.setCode(dto.getCode());
        entity.setDiscountValue(dto.getDiscountValue());
        entity.setExpirationDate(dto.getExpirationDate());

        Product product = productRepository.getReferenceById(dto.getProductId());
        entity.setProduct(product);

        entity = discountRepository.save(entity);
        return new DiscountDto(entity);
    }

}