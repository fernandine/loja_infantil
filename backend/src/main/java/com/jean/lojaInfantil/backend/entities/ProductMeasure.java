package com.jean.lojaInfantil.backend.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "tb_product_measure")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductMeasure implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private BigDecimal width;
    private BigDecimal height;
    private BigDecimal length;
    private BigDecimal weight;
    @Column(name = "insurance_value")
    private BigDecimal insuranceValue;
    private BigDecimal quantity;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;
}

