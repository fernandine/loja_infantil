package com.jean.lojaInfantil.backend.entities;

import com.fasterxml.jackson.annotation.*;
import com.jean.lojaInfantil.backend.entities.enums.PaymentType;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "tb_payment_slip")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonTypeName("paymentSlip")
public class PaymentSlip extends Payment {
    @JsonFormat(pattern="dd/MM/yyyy")
    private LocalDate expiration;
    @JsonFormat(pattern="dd/MM/yyyy")
    private LocalDate paymentDate;

    @Override
    public void processPayment() {
        // Verifica se o pagamento foi realizado dentro da data de vencimento do boleto
        if (this.paymentDate.isBefore(this.expiration)) {
            // Atualiza o status do pedido para "pronto para envio"
            updateOrderStatus(StatusOrder.READY_TO_SHIP);
        } else {
            // Caso contrário, o pagamento está atrasado
            // Atualiza o status do pedido para "aguardando confirmação de pagamento"
            updateOrderStatus(StatusOrder.WAITING_PAYMENT_CONFIRMATION);
        }
    }
}
