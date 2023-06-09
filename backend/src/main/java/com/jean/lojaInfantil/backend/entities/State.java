package com.jean.lojaInfantil.backend.entities;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="state")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class State implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country;
}
