package com.jean.lojaInfantil.backend.controllers;

import com.jean.lojaInfantil.backend.dtos.AddressDto;
import com.jean.lojaInfantil.backend.dtos.ProductMeasureDto;
import com.jean.lojaInfantil.backend.services.apis.MelhorEnvioApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping(value = "/api/v2/me")
public class ProductMeasureController {

    @Autowired
    private MelhorEnvioApiService melhorEnvioApiService;

    @GetMapping()
    public ResponseEntity<List<ProductMeasureDto>> shippingCart() {
        List<ProductMeasureDto> dto = melhorEnvioApiService.shippingCart();
        return ResponseEntity.ok().body(dto);
    }

    @PostMapping()
    public ResponseEntity<ProductMeasureDto> insert(@RequestBody ProductMeasureDto dto) {
        ProductMeasureDto newDto = melhorEnvioApiService.calculateShipping(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }
}
