package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.CountryDto;
import com.jean.lojaInfantil.backend.entities.Country;
import com.jean.lojaInfantil.backend.repositories.CountryRepository;
import com.jean.lojaInfantil.backend.services.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CountryService {

    @Autowired
    private CountryRepository repository;

    @Transactional(readOnly = true)
    public List<CountryDto> findAll() {
        List<Country> list = repository.findAll();
        return list.stream().map(CountryDto::new).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public CountryDto findById(Long id) {
        Optional<Country> obj = repository.findById(id);
        Country entity = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
        return new CountryDto(entity);
    }
}
