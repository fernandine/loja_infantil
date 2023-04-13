package com.jean.lojaInfantil.backend.entities;

import com.jean.lojaInfantil.backend.entities.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_review")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
    private Long id;
    private String comment;
    private int rating;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}