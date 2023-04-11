package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.AddressDto;
import com.jean.lojaInfantil.backend.entities.Address;
import com.jean.lojaInfantil.backend.entities.User;
import com.jean.lojaInfantil.backend.repositories.AddressRepository;
import com.jean.lojaInfantil.backend.repositories.UserRepository;
import com.jean.lojaInfantil.backend.services.exceptions.DatabaseException;
import com.jean.lojaInfantil.backend.services.exceptions.ResourceNotFoundException;
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
public class AddressService {

    @Autowired
    private AddressRepository repository;

    @Autowired
    private UserRepository userRepository;


    @Transactional(readOnly = true)
    public List<AddressDto> findAll() {
        List<Address> list = repository.findAll();
        return list.stream().map(x -> new AddressDto(x)).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<AddressDto> getByUserId(Long userId) {
        User user = userRepository.getReferenceById(userId);
        List<Address> list = repository.findbyUserId(user);
        return list.stream().map(x -> new AddressDto(x)).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public AddressDto findById(Long id) {
        Optional<Address> obj = repository.findById(id);
        Address entity = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
        return new AddressDto(entity);
    }

    @Transactional
    public AddressDto insert(AddressDto dto) {
        Address entity = new Address();

        entity.setCep(dto.getCep());
        entity.setBairro(dto.getBairro());
        entity.setComplemento(dto.getComplemento());
        entity.setLogradouro(dto.getLogradouro());
        entity.setLocalidade(dto.getLocalidade());

        User user = new User();
        user.setId(dto.getUserId());
        entity.setUser(user);

        entity = repository.save(entity);
        return new AddressDto(entity);
    }

    @Transactional
    public AddressDto update(Long id, AddressDto dto) {
        try {
            Address entity = repository.getReferenceById(id);
            entity.setCep(dto.getCep());
            entity.setBairro(dto.getBairro());
            entity.setComplemento(dto.getComplemento());
            entity.setLogradouro(dto.getLogradouro());
            entity.setLocalidade(dto.getLocalidade());
            entity = repository.save(entity);
            return new AddressDto(entity);
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

