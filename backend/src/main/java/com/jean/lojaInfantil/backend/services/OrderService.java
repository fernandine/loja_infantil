package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.OrderDto;
import com.jean.lojaInfantil.backend.dtos.OrderItemDto;
import com.jean.lojaInfantil.backend.entities.*;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import com.jean.lojaInfantil.backend.entities.enums.StatusPayment;
import com.jean.lojaInfantil.backend.repositories.OrderRepository;
import com.jean.lojaInfantil.backend.services.exceptions.DatabaseException;
import com.jean.lojaInfantil.backend.services.exceptions.ResourceNotFoundException;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.persistence.EntityNotFoundException;
import java.time.Instant;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

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

    @Autowired
    private ProductService productService;

    @Transactional(readOnly = true)
    public OrderDto findById(Long id) {
        Optional<Order> obj = orderRepository.findById(id);
        Order entity = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
        return modelMapper.map(entity, OrderDto.class);
    }


//    @Transactional
//    public OrderDto insert(OrderDto dto) {
//        Order entity = new Order();
//        User user = authService.authenticated();
//        copyEntityToDTO(user, entity, dto);
//        entity = orderRepository.save(entity);
//        return modelMapper.map(entity, OrderDto.class);
//    }

/*
    @Transactional
    public OrderDto insert(OrderDto dto) {
        User user = authService.authenticated();

        Order order = new Order();
        order.setUser(user);
        order.setMoment(Instant.now());
        order.setStatus(StatusOrder.SHIPPED);

        Payment payment = dto.getPayment().toEntity();
        if (payment instanceof PaymentSlip) {  // verifica se o pagamento é feito com boleto
            PaymentSlip slip = (PaymentSlip) payment;
            slip.setDueDate(boletoService.calculateDueDate(order.getMoment()));  // define a data de vencimento com base no momento atual do pedido
        }

        payment.setOrder(order);
        order.setPayment(payment);

        Set<OrderItem> items = new HashSet<>();
        for (OrderItemDto itemDto : dto.getItems()) {
            Product product = productService.find(itemDto.getProductId());  // busca o produto correspondente ao item
            OrderItem item = new OrderItem(order, product, itemDto.getQuantity(), product.getPrice());  // cria o objeto OrderItem e adiciona à lista
            items.add(item);
        }
        order.setItems(items);

        orderRepository.save(order);

        emailService.sendOrderConfirmationEmail(order);  // envia o email de confirmação do pedido

        return fromEntity(order);
    }*/


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
       // entity.setItems(dto.getItems());
      //  entity.setPayment(dto.getPayment());

        user.setId(userService.getAuthUser().getId());
        user.setFirstName(userService.getAuthUser().getFirstName());
        user.setLastName(userService.getAuthUser().getLastName());
        user.setEmail(userService.getAuthUser().getEmail());
        entity.setUser(user);
    }

}

