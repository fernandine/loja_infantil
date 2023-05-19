package com.jean.lojaInfantil.backend.dtos;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jean.lojaInfantil.backend.entities.OrderItem;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DiscountDto implements Serializable {

    private Long id;
    private String code;
    private BigDecimal discountValue;
    @Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant expirationDate;
    private Long productId;
}

