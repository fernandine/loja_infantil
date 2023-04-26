package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.CategoryDto;
import com.jean.lojaInfantil.backend.dtos.ReviewDto;
import com.jean.lojaInfantil.backend.entities.Category;
import com.jean.lojaInfantil.backend.repositories.CategoryRepository;
import com.jean.lojaInfantil.backend.services.exceptions.DatabaseException;
import com.jean.lojaInfantil.backend.services.exceptions.ResourceNotFoundException;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CategoryService {

    @Autowired
    CategoryRepository repository;

    @Autowired
    private ModelMapper modelMapper;

    @Transactional(readOnly = true)
    public List<CategoryDto> findAll() {
        List<Category> list = repository.findAll();
        return list.stream()
                .map(order -> modelMapper.map(order, CategoryDto.class))
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public CategoryDto findById(Long id) {
        Optional<Category> obj = repository.findById(id);
        Category entity = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
        return modelMapper.map(entity, CategoryDto.class);
    }

    @Transactional
    public CategoryDto insert(CategoryDto dto) {
        Category entity = new Category();

        entity.setId(dto.getId());
        entity.setName(dto.getName());

        entity = repository.save(entity);
        return modelMapper.map(entity, CategoryDto.class);
    }

    @Transactional
    public CategoryDto update(Long id, CategoryDto dto) {
        try {
            Category entity = repository.getReferenceById(id);

            entity.setId(dto.getId());
            entity.setName(dto.getName());

            entity = repository.save(entity);
            return modelMapper.map(entity, CategoryDto.class);
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
