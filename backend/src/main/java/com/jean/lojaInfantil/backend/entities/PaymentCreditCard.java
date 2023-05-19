package com.jean.lojaInfantil.backend.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonTypeName;
import com.jean.lojaInfantil.backend.entities.enums.CardType;
import com.jean.lojaInfantil.backend.entities.enums.PaymentType;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tb_payment_credit_card")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonTypeName("paymentCreditCard")
public class PaymentCreditCard extends Payment {

    private String logo;
    private Integer installments;
    @Column(name = "card_holder_name")
    private String cardHolderName;
    @Column(name = "card_number")
    private String cardNumber;
    @Column(name = "cvc")
    private Integer cvc;

    @Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant expiration;

    @Column(name = "card_type")
    private CardType cardType;

    @Override
    public void processPayment() {
        // Lógica para processar o pagamento com cartão de crédito
        if (this.installments > 1) {
            // Se o pagamento foi parcelado, atualiza o status do pedido para "em processamento"
            updateOrderStatus(StatusOrder.PENDING);
        } else {
            // Se o pagamento foi à vista, atualiza o status do pedido para "pronto para envio"
            updateOrderStatus(StatusOrder.READY_TO_SHIP);
        }
    }

    public List<Double> calculateInstallments(Double totalValue, Integer installments) {
        List<Double> installmentsValues = new ArrayList<>();

        if (totalValue == null || totalValue <= 0) {
            throw new IllegalArgumentException("Invalid total value.");
        }

        if (installments > 6 || installments < 0) {
            throw new IllegalArgumentException("Invalid number of installments.");
        }

        Double installmentValue = totalValue / installments;
        for (int i = 0; i < installments; i++) {
            if (i == installments - 1) {
                // última parcela pode ter diferença de centavos
                installmentsValues.add(totalValue - (installmentValue * i));
            } else {
                installmentsValues.add(installmentValue);
            }
        }

        return installmentsValues;
    }


}
