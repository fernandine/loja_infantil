package com.jean.lojaInfantil.backend.dtos;


import com.jean.lojaInfantil.backend.entities.Order;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto {

    private Long id;
    private Instant moment;
    private StatusOrder status;

    public OrderDto(Order entity) {
        id = entity.getId();
        moment = entity.getMoment();
        status = entity.getStatus();
    }
}