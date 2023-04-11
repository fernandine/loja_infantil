package com.jean.lojaInfantil.backend.repositories;

import com.jean.lojaInfantil.backend.entities.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {
}