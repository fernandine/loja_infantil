package com.jean.lojaInfantil.backend.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.time.Instant;
import java.util.*;

@Entity
@Table(name = "tb_order")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant moment;
    private StatusOrder status;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToOne(mappedBy = "order", cascade = CascadeType.ALL)
    private Payment payment;

    @ManyToOne
    @JoinColumn(name = "address_id")
    private Address address;
    @OneToMany(mappedBy = "id.order")
    private Set<OrderItem> items = new HashSet<>();

}