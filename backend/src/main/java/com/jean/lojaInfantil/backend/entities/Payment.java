package com.jean.lojaInfantil.backend.entities;

import com.fasterxml.jackson.annotation.*;
import com.jean.lojaInfantil.backend.entities.enums.PaymentType;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import com.jean.lojaInfantil.backend.entities.enums.StatusPayment;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "tb_payment")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, property = "@type", include = JsonTypeInfo.As.EXTERNAL_PROPERTY)
@JsonSubTypes({
        @JsonSubTypes.Type(value = PaymentSlip.class, name = "paymentSlip"),
        @JsonSubTypes.Type(value = PaymentCreditCard.class, name = "paymentCreditCard")
})
public abstract class Payment implements Serializable {

    @Id
    private Long id;
    @Column(name = "status_payment")
    private StatusPayment statusPayment;

    @JsonFormat(pattern="dd/MM/yyyy")
    private LocalDate moment;

    @JsonIgnore
    @OneToOne
    @MapsId
    @JoinColumn(name = "order_id")
    private Order order;

    public abstract void processPayment();
    protected void updateOrderStatus(StatusOrder newStatus) {
        this.order.setStatus(newStatus);
    }
}
