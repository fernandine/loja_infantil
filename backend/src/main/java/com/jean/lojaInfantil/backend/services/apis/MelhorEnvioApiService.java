package com.jean.lojaInfantil.backend.services.apis;

import com.jean.lojaInfantil.backend.dtos.ProductMeasureDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@FeignClient(url="https://sandbox.melhorenvio.com.br/", name="melhorEnvioApiService")
public interface MelhorEnvioApiService {

    @GetMapping("/cart") //inserir frete no carrinho
    List<ProductMeasureDto> shippingCart();

    @PostMapping("/shipment/calculate/") //calculo de frete
    ProductMeasureDto calculateShipping(@RequestBody ProductMeasureDto dto);
}
