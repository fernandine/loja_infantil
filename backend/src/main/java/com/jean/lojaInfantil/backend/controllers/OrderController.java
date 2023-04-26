package com.jean.lojaInfantil.backend.controllers;

import com.jean.lojaInfantil.backend.dtos.ProductDto;
import com.jean.lojaInfantil.backend.dtos.StateDto;
import com.jean.lojaInfantil.backend.entities.Order;
import com.jean.lojaInfantil.backend.services.OrderService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.validation.Valid;
import java.net.URI;
import java.util.List;

@RestController
@RequestMapping(value = "/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;


//    @GetMapping
//    public ResponseEntity<List<Order>> findAll() {
//        List<Order> list = orderService.findAll();
//        return ResponseEntity.ok().body(list);
//    }

    @GetMapping("/{id}")
    public ResponseEntity<Order> findById(@PathVariable Long id) {
        Order obj = orderService.findById(id);
        return ResponseEntity.ok().body(obj);
    }
/*
    @PostMapping
    public ResponseEntity<OrderDto> insert(@Valid @RequestBody OrderDto dto) {
        OrderDto newDto = orderService.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping("/{id}")
    public ResponseEntity<OrderDto> update(@PathVariable Long id, @RequestBody OrderDto dto) {
        OrderDto newDto = orderService.update(id, dto);
        return ResponseEntity.ok().body(newDto);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        orderService.delete(id);
        return ResponseEntity.noContent().build();
    }*/
}