package com.jean.lojaInfantil.backend.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jean.lojaInfantil.backend.dtos.*;
import com.jean.lojaInfantil.backend.entities.*;
import com.jean.lojaInfantil.backend.entities.PK.OrderItemPK;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import com.jean.lojaInfantil.backend.entities.enums.StatusPayment;
import com.jean.lojaInfantil.backend.repositories.DiscountRepository;
import com.jean.lojaInfantil.backend.repositories.OrderItemRepository;
import com.jean.lojaInfantil.backend.repositories.OrderRepository;
import com.jean.lojaInfantil.backend.repositories.PaymentRepository;
import com.jean.lojaInfantil.backend.services.exceptions.ResourceNotFoundException;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
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
    private OrderItemRepository orderItemRepository;

    @Autowired
    private DiscountService discountService;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private EmailService emailService;

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private DiscountRepository discountRepository;

    @Transactional(readOnly = true)
    public OrderDto findById(Long id) {
        Optional<Order> obj = orderRepository.findById(id);
        Order entity = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
        return modelMapper.map(entity, OrderDto.class);
    }

    @Transactional(readOnly = true)
    public OrderDto insert(OrderDto dto) {
        Order entity = new Order();

        entity.setStatusOrder(dto.getStatusOrder());

        entity.setMoment(dto.getMoment());
        entity.setItems(dto.getItems());
        entity.setPayment(dto.getPayment());

        dto.getPayment().setStatusPayment(StatusPayment.PENDING);
        dto.getPayment().setOrder(entity);
        dto.getPayment().setMoment(entity.getMoment());

        paymentRepository.save(dto.getPayment());

        User user = authService.authenticated();
        user.setId(userService.getAuthUser().getId());
        entity.setUser(user);

        entity = orderRepository.save(entity);
        return modelMapper.map(entity, OrderDto.class);
    }
}

