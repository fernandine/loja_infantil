package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.*;
import com.jean.lojaInfantil.backend.entities.*;
import com.jean.lojaInfantil.backend.entities.enums.StatusOrder;
import com.jean.lojaInfantil.backend.entities.enums.StatusPayment;
import com.jean.lojaInfantil.backend.repositories.OrderRepository;
import com.jean.lojaInfantil.backend.repositories.PaymentRepository;
import com.jean.lojaInfantil.backend.services.exceptions.ResourceNotFoundException;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Optional;

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
    private EmailService emailService;

    @Autowired
    private PaymentRepository paymentRepository;

    public Order find(Long id) {
        Optional<Order> obj = orderRepository.findById(id);
        return obj.orElseThrow(() -> new ResourceNotFoundException(
                "Objeto não encontrado! Id: " + id + ", Tipo: " + Order.class.getName()));
    }


    public Order insert(Order obj) {
        obj.setId(null);
        obj.setStatus(StatusOrder.PENDING);
        obj.setMoment(LocalDate.of(2023,02,03));
        obj.getPayment().setStatusPayment(StatusPayment.PENDING);

        UserDto userDto = userService.findById(obj.getUser().getId());
        User user = modelMapper.map(userDto, User.class);
        obj.setUser(user);

        obj.getPayment().setOrder(obj);

        for (OrderItem item : obj.getItems()) {
            item.getId().setOrder(obj);

//            // Cálculo do subtotal
//            BigDecimal unitPrice = item.getProduct().getUnitPrice();
//            if (unitPrice != null) {
//                BigDecimal subtotal = unitPrice.multiply(new BigDecimal(item.getQuantity()));
//                item.setSubtotal(subtotal);
//            } else {
//                // Caso em que o preço unitário é nulo
//                BigDecimal defaultPrice = BigDecimal.ZERO; // Defina um valor padrão para o preço unitário
//                BigDecimal subtotal = defaultPrice.multiply(new BigDecimal(item.getQuantity()));
//                item.setSubtotal(subtotal);
//                // Ou, se preferir, você pode lançar uma exceção personalizada
//                 throw new ResourceNotFoundException("O preço unitário do produto é nulo");
//            }


//            // Cálculo do totalValue
//            BigDecimal totalValue = subtotal.subtract((BigDecimal) item.getProduct().getDiscounts());
//            item.setTotalValue(totalValue);
        }

        if (obj.getPayment() instanceof PaymentSlip) {
            PaymentSlip slip = (PaymentSlip) obj.getPayment();
            SlipService.expirationPayment(slip, obj.getMoment());
        }
        obj = orderRepository.save(obj);
        paymentRepository.save(obj.getPayment());

        //Cria e envia o e-mail de confirmação do pedido
        EmailDto emailDto = new EmailDto();
        emailDto.setTo(obj.getUser().getEmail());
        emailDto.setSubject("Pedido " + obj.getId() + " confirmado!");
        emailDto.setBody("Seu pedido foi concluído com sucesso! Obrigado por comprar conosco.");
        emailService.sendEmail(emailDto);

        return obj;
    }

}

