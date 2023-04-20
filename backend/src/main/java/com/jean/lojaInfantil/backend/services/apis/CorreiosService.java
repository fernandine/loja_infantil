package com.jean.lojaInfantil.backend.services.apis;

import com.jean.lojaInfantil.backend.dtos.AddressDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(url="https://cluster.apigratis.com/api/v1/", name="correios")
public interface CorreiosService {

    @GetMapping("/{cep}/json/")
    AddressDto findByCep(@PathVariable("cep") String cep);
}