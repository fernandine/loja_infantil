package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.*;
import com.jean.lojaInfantil.backend.entities.Role;
import com.jean.lojaInfantil.backend.entities.User;
import com.jean.lojaInfantil.backend.entities.enums.Gender;
import com.jean.lojaInfantil.backend.repositories.AddressRepository;
import com.jean.lojaInfantil.backend.repositories.RoleRepository;
import com.jean.lojaInfantil.backend.repositories.UserRepository;
import com.jean.lojaInfantil.backend.services.exceptions.DatabaseException;
import com.jean.lojaInfantil.backend.services.exceptions.ResourceNotFoundException;
import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository repository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private AuthService authService;

    @Autowired
    private ModelMapper modelMapper;

    @Transactional(readOnly = true)
    public List<UserDto> findAll() {
        List<User> list = repository.findAll();
        return list.stream()
                .map(order -> modelMapper.map(order, UserDto.class))
                .collect(Collectors.toList());
    }
    @Transactional(readOnly = true)
    public UserDto getAuthUser() {
        User user = authService.authenticated();

        return modelMapper.map(user, UserDto.class);
   }

    @Transactional(readOnly = true)
    public UserDto findById(Long id) {
        Optional<User> obj = repository.findById(id);
        User entity = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
        return modelMapper.map(entity, UserDto.class);
    }

    @Transactional
    public UserDto insert(UserInsertDto dto) {
        User entity = new User();
        copyDtoToEntity(dto, entity);
        entity.setPassword(passwordEncoder.encode(dto.getPassword()));
        entity = repository.save(entity);
        return modelMapper.map(entity, UserDto.class);
    }

    @Transactional
    public UserDto update(Long id, UserUpdateDto dto) {
        try {
            User entity = repository.getReferenceById(id);

            copyDtoToEntity(dto, entity);
            entity = repository.save(entity);
            return modelMapper.map(entity, UserDto.class);
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

    private void copyDtoToEntity(UserDto dto, User entity) {

        entity.setFirstName(dto.getFirstName());
        entity.setLastName(dto.getLastName());
        entity.setEmail(dto.getEmail());
        entity.setPhone(dto.getPhone());
        entity.setCpf(dto.getCpf());
        entity.setBirthDay(dto.getBirthDay());
        entity.setGender(dto.getGender());


        entity.getRoles().clear();
        for (RoleDto roleDto : dto.getRoles()) {
            Role role = roleRepository.getReferenceById(roleDto.getId());
            entity.getRoles().add(role);
        }

//        entity.getAddressList().clear();
//        for (AddressDto p : dto.getAddressList()) {
//            Address address = addressRepository.getReferenceById(p.getId());
//            entity.getAddressList().add(address);
//        }

    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = repository.findByEmail(username);
        if (user == null) {
            logger.error("User not found: " + username);
            throw new UsernameNotFoundException("Email not found");
        }
        logger.info("User found: " + username);
        return user;
    }
}
