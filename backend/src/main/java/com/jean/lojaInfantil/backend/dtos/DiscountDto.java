package com.jean.lojaInfantil.backend.dtos;

import com.jean.lojaInfantil.backend.entities.Discount;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DiscountDto implements Serializable {

    private Long id;
    private String code;
    private BigDecimal discountValue;
    private LocalDate expirationDate;
    private BigDecimal discountedPrice;
    private Long productId;

    public DiscountDto( Discount entity) {
        id = entity.getId();
        discountValue = entity.getDiscountValue();
        code = entity.getCode();
        expirationDate = entity.getExpirationDate();
        productId = entity.getProduct().getId();
        discountedPrice = BigDecimal.ZERO; // inicialmente, o preço com desconto é zero
    }

    public DiscountDto(Discount entity, BigDecimal totalPrice) {
        this(entity);
        discountedPrice = totalPrice.subtract(totalPrice.multiply(entity.getDiscountValue())); // calcula o preço com desconto
    }

    }

