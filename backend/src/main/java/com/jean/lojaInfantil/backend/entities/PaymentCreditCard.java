package com.jean.lojaInfantil.backend.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonTypeName;
import com.jean.lojaInfantil.backend.entities.enums.PaymentType;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "tb_payment_credit_card")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonTypeName("paymentCreditCard")
public class PaymentCreditCard extends Payment {

    private String logo;
    private Long installments;
    @Column(name = "card_holder_name")
    private String cardHolderName;
    @Column(name = "card_number")
    private String cardNumber;

    @Column(name = "card_type")
    private String cardType;

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
}
