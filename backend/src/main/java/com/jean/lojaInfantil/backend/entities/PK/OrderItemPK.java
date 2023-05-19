package com.jean.lojaInfantil.backend.entities.PK;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jean.lojaInfantil.backend.dtos.OrderDto;
import com.jean.lojaInfantil.backend.entities.Order;
import com.jean.lojaInfantil.backend.entities.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Embeddable
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItemPK implements Serializable {

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

}