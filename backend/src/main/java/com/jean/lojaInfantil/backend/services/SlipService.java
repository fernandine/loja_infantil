package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.entities.PaymentSlip;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.sql.Date;

@Service
public class SlipService {

    public static void expirationPayment(PaymentSlip slip, LocalDate instantOrder) {
        LocalDateTime instant = instantOrder.atStartOfDay();
        instant = instant.plusDays(3);
        Date expiration = Date.valueOf(instant.toLocalDate());
        slip.setExpiration(expiration.toInstant());
    }
}

