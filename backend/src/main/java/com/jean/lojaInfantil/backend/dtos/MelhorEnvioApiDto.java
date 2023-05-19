package com.jean.lojaInfantil.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MelhorEnvioApiDto implements Serializable {

    private Long id;
    private String postalCode;
    private List<ProductMeasureDto> products;
}
