package com.jean.lojaInfantil.backend.entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jean.lojaInfantil.backend.entities.PK.OrderItemPK;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "tb_order_item")
public class OrderItem implements Serializable {

    @JsonIgnore
    @EmbeddedId
    private OrderItemPK id = new OrderItemPK();
    private Integer quantity;
    private BigDecimal price;

    public OrderItem() {
    }

    public OrderItem(Order order, Product product, Integer quantity, BigDecimal price) {
        id.setOrder(order);
        id.setProduct(product);
        this.quantity = quantity;
        this.price = price;
    }

    @JsonIgnore
    public Order getOrder() {
        return id.getOrder();
    }

    public void setOrder(Order order) {
        id.setOrder(order);
    }

    public Product getProduct() {
        return id.getProduct();
    }

    public void setProduct(Product product) {
        id.setProduct(product);
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

}