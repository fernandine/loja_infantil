package com.jean.lojaInfantil.backend.services;


import com.jean.lojaInfantil.backend.dtos.ReviewDto;
import com.jean.lojaInfantil.backend.entities.Order;
import com.jean.lojaInfantil.backend.entities.Review;
import com.jean.lojaInfantil.backend.entities.User;
import com.jean.lojaInfantil.backend.repositories.OrderRepository;
import com.jean.lojaInfantil.backend.services.exceptions.DatabaseException;
import com.jean.lojaInfantil.backend.services.exceptions.ResourceNotFoundException;
import org.hibernate.ObjectNotFoundException;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private AuthService authService;

    @Autowired
    private UserService userService;

    @Autowired
    private ModelMapper modelMapper;

//    @Transactional(readOnly = true)
//    public List<Order> findAll() {
//            List<Order> list = orderRepository.findAll();
//            return list;
//        }


    @Transactional(readOnly = true)
    public Order findById(Long id) {
        Optional<Order> obj = orderRepository.findById(id);
        return obj.orElseThrow(() -> new ResourceNotFoundException(
                "Objeto não encontrado! Id: " + id + ", Tipo: " + Order.class.getName()));
    }


/*



    @Transactional(readOnly = true)



    //BUSCA PAGINADA
    @Transactional(readOnly = true)
    public Page<Order> findAllPaged(Pageable pageable) {
        User user = authService.authenticated();
        user.setId(userService.getAuthUser().getId());
        if (user == null) {
			throw new AuthorizationException("Acesso negado");
		}
        Page<Order> page = orderRepository.findAll(pageable);
        return orderRepository.findByCliente(cliente, pageRequest);
    }


    @Transactional(readOnly = true)
    public OrderDto findById(Long id) {
        Optional<Order> obj = orderRepository.findById(id);
        Order entity = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
        return modelMapper.map(entity, OrderDto.class);
    }

    @Transactional
    public OrderDto insert(OrderDto dto) {
        Order entity = new Order();
        User user = authService.authenticated();
        copyEntityToDTO(user, entity, dto);
        entity = orderRepository.save(entity);
        return modelMapper.map(entity, OrderDto.class);
    }

    @Transactional
    public OrderDto update(Long id, OrderDto dto) {
        try {
            Order entity = orderRepository.getReferenceById(id);
            User user = authService.authenticated();
            copyEntityToDTO(user, entity, dto);
            return modelMapper.map(entity, OrderDto.class);
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Id not found " + id);
        }
    }

    public void delete(Long id) {
        try {
            orderRepository.deleteById(id);
        } catch (EmptyResultDataAccessException e) {
            throw new ResourceNotFoundException("Id not found " + id);
        } catch (DataIntegrityViolationException e) {
            throw new DatabaseException("Integrity violation");
        }
    }

    public void copyEntityToDTO(User user, Order entity, OrderDto dto) {

        entity.setMoment(dto.getMoment());
        entity.setStatus(dto.getStatus());
        //entity.setPayment(dto.getPayment());

        user.setId(userService.getAuthUser().getId());
        user.setFirstName(userService.getAuthUser().getFirstName());
        user.setLastName(userService.getAuthUser().getLastName());
        user.setEmail(userService.getAuthUser().getEmail());
        entity.setUser(user);
    }

*/
}

