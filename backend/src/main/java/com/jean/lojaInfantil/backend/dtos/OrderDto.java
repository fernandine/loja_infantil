package com.jean.lojaInfantil.backend.dtos;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jean.lojaInfantil.backend.entities.OrderItem;
import com.jean.lojaInfantil.backend.entities.Payment;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.io.Serializable;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto implements Serializable {

    private Long id;
    private Instant moment;
    private StatusOrder statusOrder;
    private NewUserToOrder user;
    private Payment payment;
    private Set<OrderItem> items;
}
