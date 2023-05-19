package com.jean.lojaInfantil.backend.entities;

import com.fasterxml.jackson.annotation.*;
import com.jean.lojaInfantil.backend.entities.enums.KeyTypePix;
import com.jean.lojaInfantil.backend.entities.enums.PaymentType;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import com.jean.lojaInfantil.backend.entities.enums.StatusPayment;
import lombok.*;

import javax.persistence.*;
import java.time.Instant;
import java.time.LocalDate;

@Entity
@Table(name = "tb_payment_pix")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonTypeName("paymentPix")
public class PaymentPix extends Payment {

    @Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant expiration;
    @Column(name = "key_type")
    private KeyTypePix keyType;
    private String name;

    public void processPayment() {
        // Se o pagamento foi realizado com sucesso, atualiza o status do pedido para "pronto para envio"
        if (this.getStatusPayment() == StatusPayment.APPROVED) {
            updateOrderStatus(StatusOrder.READY_TO_SHIP);
        } else {
            // Caso contrário, o pagamento falhou
            // Atualiza o status do pedido para "aguardando confirmação de pagamento"
            updateOrderStatus(StatusOrder.WAITING_PAYMENT_CONFIRMATION);
        }
    }
}
