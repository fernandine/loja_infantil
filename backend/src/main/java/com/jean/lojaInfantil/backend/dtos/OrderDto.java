package com.jean.lojaInfantil.backend.dtos;

import com.jean.lojaInfantil.backend.entities.Address;
import com.jean.lojaInfantil.backend.entities.OrderItem;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.time.Instant;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto implements Serializable {

    private Long id;
    private Instant moment;
    private StatusOrder status;
    private UserDto user;
    private PaymentDto payment;
    private Set<OrderItemDto> items;
}
