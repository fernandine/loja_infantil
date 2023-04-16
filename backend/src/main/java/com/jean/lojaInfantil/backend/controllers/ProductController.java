package com.jean.lojaInfantil.backend.controllers;

import com.jean.lojaInfantil.backend.dtos.ProductDto;
import com.jean.lojaInfantil.backend.entities.enums.Brands;
import com.jean.lojaInfantil.backend.entities.enums.Colors;
import com.jean.lojaInfantil.backend.entities.enums.Sizes;
import com.jean.lojaInfantil.backend.services.ProductService;
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
@RequestMapping(value = "/products")
public class ProductController {

    @Autowired
    ProductService service;

    @GetMapping
    public ResponseEntity<List<ProductDto>> findAll() {
        List<ProductDto> list = service.findAll();
        return ResponseEntity.ok().body(list);
    }

    // URL = /products/find?notFavorite=?
    @GetMapping("/find")
    public ResponseEntity<List<ProductDto>> find(
            @RequestParam(value = "notFavorite", defaultValue = "false") Boolean favorite) {
        List<ProductDto> list = service.findByFavorite(favorite);
        return ResponseEntity.ok().body(list);
    }

    // URL = /products/search?name=?
    @GetMapping("/search")
    public ResponseEntity<Page<ProductDto>> findByName(
            @RequestParam("name") String name,
            Pageable pageable )
    {
        Page<ProductDto> list = service.findByName(name.trim(), pageable);
        return ResponseEntity.ok().body(list);
    }

    // URL = /products/search/categories?id=?
    @GetMapping("/search/categories")
    public ResponseEntity<Page<ProductDto>> findByCategoryId(@RequestParam("id") Long id, Pageable pageable){
        return ResponseEntity.ok().body(service.findByCategoryId(id, pageable));
    }

    // URL = /products/search/?
    @GetMapping(value = "/search/{id}")
    public ResponseEntity<ProductDto> searchById(@PathVariable Long id) {
        return ResponseEntity.ok().body(service.navigateByUrl(id));
    }

    // URL = /products/best-sellers?limit=?
    @GetMapping("/best-sellers")
    public ResponseEntity<List<ProductDto>> getBestSellers(@RequestParam("limit") int limit) {
        List<ProductDto> bestSellers = service.getBestSellers(limit);
        return ResponseEntity.ok(bestSellers);
    }

    // URL = /products/most-recents?limit=?
    @GetMapping("/most-recents")
    public ResponseEntity<List<ProductDto>> getMostRecentProducts(@RequestParam("limit") int limit) {
        List<ProductDto> mostRecentProducts = service.findMostRecentProductsByCreationDate(limit);
        return ResponseEntity.ok(mostRecentProducts);
    }

//    @GetMapping("/filter")
//    public ResponseEntity<List<ProductDto>> filterProducts(
//            @RequestParam(name = "brand", required = false) Brands productBrand,
//            @RequestParam(name = "color", required = false) Colors productColor,
//            @RequestParam(name = "size", required = false) Sizes productSize
//    ) {
//        if (productBrand == null && productColor == null && productSize == null) {
//            // Se todos os parâmetros forem nulos, busca todos os produtos
//            List<ProductDto> allProducts = service.findAll();
//            return ResponseEntity.ok(allProducts);
//        } else {
//            // Caso contrário, faz a filtragem com base nos parâmetros fornecidos
//            List<ProductDto> filteredProducts = service.filterProducts(productBrand, productColor, productSize);
//            return ResponseEntity.ok(filteredProducts);
//        }
//    }

    // URL = /products/filter?brand=PUC&color=VERDE&size=P
    @GetMapping("/filter")
    public ResponseEntity<List<ProductDto>> filterProducts(
            @RequestParam(name = "brand", required = false) List<Brands> productBrand,
            @RequestParam(name = "color", required = false) List<Colors> productColor,
            @RequestParam(name = "size", required = false) List<Sizes> productSizes
    ) {
        if (productBrand == null && productColor == null && productSizes == null) {
            // Se todos os parâmetros forem nulos, busca todos os produtos
            List<ProductDto> allProducts = service.findAll();
            return ResponseEntity.ok(allProducts);
        } else {
            // Caso contrário, faz a filtragem com base nos parâmetros fornecidos
            List<ProductDto> filteredProducts = service.filterProducts(productBrand, productColor, productSizes);
            return ResponseEntity.ok(filteredProducts);
        }
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
