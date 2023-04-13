package com.jean.lojaInfantil.backend.controllers;

import com.jean.lojaInfantil.backend.dtos.ProductDto;
import com.jean.lojaInfantil.backend.entities.Product;
import com.jean.lojaInfantil.backend.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.validation.Valid;
import java.net.URI;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value = "/products")
public class ProductController {

    @Autowired
    ProductService service;

    @GetMapping
    public ResponseEntity<List<ProductDto>> findAll() {
        List<ProductDto> list = service.findAll();
        return ResponseEntity.ok().body(list);
    }

    @GetMapping("/find")
    public ResponseEntity<List<ProductDto>> find(
            @RequestParam(value = "notFavorite", defaultValue = "false") Boolean favorite) {
        List<ProductDto> list = service.findByFavorite(favorite);
        return ResponseEntity.ok().body(list);
    }

    @GetMapping("/search")
    public ResponseEntity<Page<ProductDto>> findByName(
            @RequestParam("name") String name,
            Pageable pageable )
    {
        Page<ProductDto> list = service.findByName(name.trim(), pageable);
        return ResponseEntity.ok().body(list);
    }

    @GetMapping("/search/categories")
    public ResponseEntity<Page<ProductDto>> findByCategoryId(@RequestParam("id") Long id, Pageable pageable){
        return ResponseEntity.ok().body(service.findByCategoryId(id, pageable));
    }
    @GetMapping(value = "/search/{id}")
    public ResponseEntity<ProductDto> searchById(@PathVariable Long id) {
        return ResponseEntity.ok().body(service.navigateByUrl(id));
    }

    @GetMapping("/best-sellers")
    public ResponseEntity<List<ProductDto>> getBestSellers(@RequestParam("limit") int limit) {
        List<ProductDto> bestSellers = service.getBestSellers(limit);
        return ResponseEntity.ok(bestSellers);
    }

    @GetMapping("/most-recents")
    public ResponseEntity<List<ProductDto>> getMostRecentProducts(@RequestParam("limit") int limit) {

        List<ProductDto> mostRecentProducts = service.findMostRecentProductsByCreationDate(limit);
        return ResponseEntity.ok(mostRecentProducts);
    }

    @PostMapping
    public ResponseEntity<ProductDto> insert(@Valid @RequestBody ProductDto dto) {
        dto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }

    @PutMapping(value = "/{id}")
    public ResponseEntity<ProductDto> update(@PathVariable Long id, @Valid @RequestBody ProductDto dto) {
        dto = service.update(id, dto);
        return ResponseEntity.ok().body(dto);
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

}
