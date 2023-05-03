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
    private BigDecimal subtotal;
    @Column(name = "total_value")
    private BigDecimal totalValue;

    public OrderItem() {
    }

    public OrderItem(Order order, Product product, Integer quantity, BigDecimal totalValue, BigDecimal subtotal) {
        id.setOrder(order);
        id.setProduct(product);
        this.quantity = quantity;
        this.totalValue = totalValue;
        this.subtotal = subtotal;
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

    public OrderItemPK getId() {
        return id;
    }

    public void setId(OrderItemPK id) {
        this.id = id;
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

    public BigDecimal getTotalValue() {
        return totalValue;
    }

    public void setTotalValue(BigDecimal totalValue) {
        this.totalValue = totalValue;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }
}