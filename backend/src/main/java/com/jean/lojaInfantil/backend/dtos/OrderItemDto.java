package com.jean.lojaInfantil.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemDto {

    private Long orderId;
    private Long productId;
    private Integer quantity;
    private BigDecimal price;
}
