package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.DiscountDto;
import com.jean.lojaInfantil.backend.entities.Discount;
import com.jean.lojaInfantil.backend.entities.Product;
import com.jean.lojaInfantil.backend.repositories.DiscountRepository;
import com.jean.lojaInfantil.backend.repositories.ProductRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class DiscountService {

    @Autowired
    private DiscountRepository discountRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Transactional(readOnly = true)
    public List<DiscountDto> findAll() {
        List<Discount> list = discountRepository.findAll();
        return list.stream()
                .map(order -> modelMapper.map(order, DiscountDto.class))
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<DiscountDto> findExpiringDiscounts(LocalDate date) {
        List<Discount> list = discountRepository.getExpiringDiscounts(date);
        return list.stream()
                .map(order -> modelMapper.map(order, DiscountDto.class))
                .collect(Collectors.toList());
    }

    public DiscountDto applyDiscount(String code, BigDecimal totalPrice, BigDecimal discountValue) {
        Optional<Discount> optionalDiscount = discountRepository.findByCode(code);

        if (optionalDiscount.isPresent()) {
            Discount discount = optionalDiscount.get();

            // Verifica se o cupom ainda é válido
            if (discount.getExpirationDate().isAfter(LocalDate.now())) {
                BigDecimal discountPercentage = discount.getDiscountValue();
                BigDecimal discountAmount = totalPrice.multiply(discountPercentage);
                BigDecimal discountedPrice = totalPrice.subtract(discountAmount);

                // Cria e retorna um DTO com as informações do desconto aplicado
                DiscountDto dto = new DiscountDto(discount);
                dto.setDiscountValue(discountPercentage);
                dto.setDiscountedPrice(discountedPrice);
                return dto;
            }
        }

        // Se o cupom não for válido ou não existir, retorna nulo
        return null;
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
        return modelMapper.map(entity, DiscountDto.class);
    }
}
