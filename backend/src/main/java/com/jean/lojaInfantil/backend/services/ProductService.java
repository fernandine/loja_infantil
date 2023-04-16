package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.ProductDto;
import com.jean.lojaInfantil.backend.entities.Category;
import com.jean.lojaInfantil.backend.entities.Product;
import com.jean.lojaInfantil.backend.entities.enums.Brands;
import com.jean.lojaInfantil.backend.entities.enums.Colors;
import com.jean.lojaInfantil.backend.entities.enums.Sizes;
import com.jean.lojaInfantil.backend.repositories.CategoryRepository;
import com.jean.lojaInfantil.backend.repositories.ProductRepository;
import com.jean.lojaInfantil.backend.services.exceptions.DatabaseException;
import com.jean.lojaInfantil.backend.services.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProductService {

    @Autowired
    private ProductRepository repository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Transactional(readOnly = true)
    public List<ProductDto> findAll() {
        List<Product> list = repository.findAll();
        return list.stream().map(ProductDto::new).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<ProductDto> findByFavorite(boolean notFavorite) {
        List<Product> list = repository.find(notFavorite);
        return list.stream().map(ProductDto::new).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public ProductDto navigateByUrl(Long id) {
        Optional<Product> obj = repository.findById(id);
        Product product = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
        return new ProductDto(product);
    }

    @Transactional(readOnly = true)
    public Page<ProductDto> findByCategoryId(Long id, Pageable pageable) {
        Category category = (id == 0) ? null : categoryRepository.getReferenceById(id);
        Page<Product> page = repository.findByCategoryId(category, pageable);
        return page.map(ProductDto::new);
    }

    @Transactional(readOnly = true)
    public Page<ProductDto> findByName(String name, Pageable pageable) {
        Page<Product> page = repository.findByName(name, pageable);
        return page.map(ProductDto::new);
    }

    // BUSCA OS PRODUTOS MAIS VENDIDOS
    @Transactional(readOnly = true)
    public List<ProductDto> getBestSellers(int limit) {
        List<Product> list = repository.findBestSellers(PageRequest.of(0, limit));
        return list.stream().map(ProductDto::new).collect(Collectors.toList());
    }

    //BUSCA OS PRODUTOS RECENTES
    @Transactional(readOnly = true)
    public List<ProductDto> findMostRecentProductsByCreationDate(int limit) {
        List<Product> list = repository.findMostRecentProductsByCreationDate(PageRequest.of(0, limit));
        return list.stream().map(ProductDto::new).collect(Collectors.toList());
    }

//    @Transactional(readOnly = true)
//    public List<ProductDto> filterProducts(Brands productBrands, Colors productColors, Sizes productSizes) {
//        List<Product> list;
//        if (productBrands == null && productColors == null && productSizes == null) {
//            list = repository.findAll();
//        } else {
//            list = repository.findByBrandsAndColorsAndSizes(productBrands, productColors, productSizes);
//        }
//        return list.stream().map(ProductDto::new).collect(Collectors.toList());
//    }

    @Transactional(readOnly = true)
    public List<ProductDto> filterProducts(List<Brands> productBrands, List<Colors> productColors, List<Sizes> productSizes) {
        List<Product> list;
        if (productBrands == null && productColors == null && productSizes == null) {
            list = repository.findAll();
        } else {
            list = repository.findByBrandsAndColorsAndSizes(productBrands, productColors, productSizes);
        }
        return list.stream().map(ProductDto::new).collect(Collectors.toList());
    }



    @Transactional
    public ProductDto insert(ProductDto dto) {
        Product entity = new Product();
        copyDtoToEntity(dto, entity);
        entity = repository.save(entity);
        return new ProductDto(entity);
    }

    @Transactional
    public ProductDto update(Long id, ProductDto dto) {
        try {
            Product entity = repository.getReferenceById(id);
            copyDtoToEntity(dto, entity);
            entity = repository.save(entity);
            return new ProductDto(entity);
        }
        catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Id not found " + id);
        }
    }

    public void delete(Long id) {
        try {
            repository.deleteById(id);
        }
        catch (EmptyResultDataAccessException e) {
            throw new ResourceNotFoundException("Id not found " + id);
        }
        catch (DataIntegrityViolationException e) {
            throw new DatabaseException("Integrity violation");
        }
    }

    private void copyDtoToEntity(ProductDto dto, Product entity) {

        entity.setName(dto.getName());
        entity.setDescription(dto.getDescription());
        entity.setImage(dto.getImage());
        entity.setSku(dto.getSku());
        entity.setFavorite(dto.isFavorite());
        entity.setDateCreated(dto.getDateCreated());
        entity.setUnitsInStock(dto.getUnitsInStock());
        entity.setUnitPrice(dto.getUnitPrice());
        entity.setLastUpdated(dto.getLastUpdated());

    }
}