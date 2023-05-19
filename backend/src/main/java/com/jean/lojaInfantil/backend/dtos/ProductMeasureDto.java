package com.jean.lojaInfantil.backend.dtos;

import com.jean.lojaInfantil.backend.entities.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;
import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductMeasureDto implements Serializable {

    private Long id;
    private BigDecimal width;
    private BigDecimal height;
    private BigDecimal length;
    private BigDecimal weight;
    private BigDecimal insuranceValue;
    private BigDecimal quantity;

    private Long productId;
}
