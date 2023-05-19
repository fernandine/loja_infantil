package com.jean.lojaInfantil.backend.entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jean.lojaInfantil.backend.dtos.DiscountDto;
import com.jean.lojaInfantil.backend.dtos.OrderDto;
import com.jean.lojaInfantil.backend.entities.PK.OrderItemPK;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tb_order_item")
public class OrderItem implements Serializable {

    @JsonIgnore
    @EmbeddedId
    private OrderItemPK id = new OrderItemPK();
    private Integer quantity;
    private BigDecimal price;
    private BigDecimal subtotal;
    @Column(name = "total_value")
    private BigDecimal totalValue;

    public OrderItem() {
    }

    public OrderItem(Order order, Product product, Integer quantity, BigDecimal subtotal, BigDecimal totalValue, BigDecimal price) {
        id.setOrder(order);
        id.setProduct(product);
        this.quantity = quantity;
        this.subtotal = calculateSubtotal(product);
        this.totalValue = totalValue;
        this.price = price;
    }

    public void applyDiscount(Discount discount) {
        BigDecimal discountValue = discount.getDiscountValue();
        BigDecimal newSubtotal = this.subtotal.subtract(discountValue);
        this.setSubtotal(newSubtotal);
    }

    //CALCULO DO SUBTOTAL
    public BigDecimal calculateSubtotal(Product product) {
        BigDecimal unitPrice = product.getUnitPrice();

        if (totalValue != null && totalValue.compareTo(unitPrice) < 0) {
            // Há um desconto disponível para este produto
            return totalValue.multiply(BigDecimal.valueOf(quantity));
        } else {
            // Não há desconto ou o desconto não é válido para este produto
            return unitPrice.multiply(BigDecimal.valueOf(quantity));
        }
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

    public BigDecimal getTotalValue() {
        return totalValue;
    }

    public void setTotalValue(BigDecimal totalValue) {
        this.totalValue =totalValue;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public OrderItemPK getId() {
        return id;
    }
    public void setId(OrderItemPK id) {
        this.id = id;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}