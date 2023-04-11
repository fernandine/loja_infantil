package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.CategoryDto;
import com.jean.lojaInfantil.backend.entities.Category;
import com.jean.lojaInfantil.backend.repositories.ProductCategoryRepository;
import com.jean.lojaInfantil.backend.services.exceptions.DatabaseException;
import com.jean.lojaInfantil.backend.services.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;

@Service
public class CategoryService {

    @Autowired
    ProductCategoryRepository repository;

    @Transactional(readOnly = true)
    public Page<CategoryDto> findAllPaged(Pageable pageable) {
        Page<Category> page = repository.findAll(pageable);
        return page.map(x -> new CategoryDto(x));
    }

    @Transactional
    public CategoryDto insert(CategoryDto dto) {
        Category entity = new Category();

        entity.setId(dto.getId());
        entity.setName(dto.getName());

        entity = repository.save(entity);
        return new CategoryDto(entity);
    }

    @Transactional
    public CategoryDto update(Long id, CategoryDto dto) {
        try {
            Category entity = repository.getReferenceById(id);

            entity.setId(dto.getId());
            entity.setName(dto.getName());

            entity = repository.save(entity);
            return new CategoryDto(entity);
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Id not found " + id);
        }
    }

    public void delete(Long id) {
        try {
            repository.deleteById(id);
        } catch (EmptyResultDataAccessException e) {
            throw new ResourceNotFoundException("Id not found " + id);
        } catch (DataIntegrityViolationException e) {
            throw new DatabaseException("Integrity violation");
        }
    }
}
